$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

function Convert-Logo {
  param(
    [string]$Source,
    [string]$Dest,
    [bool]$Light
  )

  $src = [System.Drawing.Bitmap]::new($Source)
  $bmp = New-Object System.Drawing.Bitmap $src.Width, $src.Height, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.DrawImage($src, 0, 0, $src.Width, $src.Height)
  $g.Dispose()
  $src.Dispose()

  $rect = New-Object System.Drawing.Rectangle 0, 0, $bmp.Width, $bmp.Height
  $data = $bmp.LockBits($rect, [System.Drawing.Imaging.ImageLockMode]::ReadWrite, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $bytes = New-Object byte[] ($data.Stride * $bmp.Height)
  [System.Runtime.InteropServices.Marshal]::Copy($data.Scan0, $bytes, 0, $bytes.Length)

  $navyR = 11; $navyG = 31; $navyB = 58
  $minX = $bmp.Width; $minY = $bmp.Height; $maxX = 0; $maxY = 0

  for ($y = 0; $y -lt $bmp.Height; $y++) {
    $row = $y * $data.Stride
    for ($x = 0; $x -lt $bmp.Width; $x++) {
      $i = $row + ($x * 4)
      $b = [int]$bytes[$i]
      $gch = [int]$bytes[$i + 1]
      $r = [int]$bytes[$i + 2]
      $mx = [Math]::Max($r, [Math]::Max($gch, $b))
      $mn = [Math]::Min($r, [Math]::Min($gch, $b))
      $chroma = $mx - $mn
      $isCyan = ($gch -gt 90 -and $b -gt 90 -and $r -lt 200 -and $chroma -gt 25)
      $isWhite = ($chroma -lt 35 -and $mx -gt 150)

      if ($mx -lt 22) {
        $bytes[$i + 3] = 0
        continue
      }

      if ($isCyan) {
        $bytes[$i + 3] = 255
      }
      elseif ($isWhite) {
        if ($Light) {
          $bytes[$i] = $navyB
          $bytes[$i + 1] = $navyG
          $bytes[$i + 2] = $navyR
        }
        $bytes[$i + 3] = 255
      }
      else {
        $a = [Math]::Min(255, [int](($mx - 18) * 4))
        if ($a -lt 16) { $a = 0 }
        if ($Light -and $chroma -lt 40) {
          $bytes[$i] = $navyB
          $bytes[$i + 1] = $navyG
          $bytes[$i + 2] = $navyR
        }
        $bytes[$i + 3] = [byte]$a
      }

      if ($bytes[$i + 3] -gt 20) {
        if ($x -lt $minX) { $minX = $x }
        if ($y -lt $minY) { $minY = $y }
        if ($x -gt $maxX) { $maxX = $x }
        if ($y -gt $maxY) { $maxY = $y }
      }
    }
  }

  [System.Runtime.InteropServices.Marshal]::Copy($bytes, 0, $data.Scan0, $bytes.Length)
  $bmp.UnlockBits($data)

  $pad = 10
  $minX = [Math]::Max(0, $minX - $pad)
  $minY = [Math]::Max(0, $minY - $pad)
  $maxX = [Math]::Min($bmp.Width - 1, $maxX + $pad)
  $maxY = [Math]::Min($bmp.Height - 1, $maxY + $pad)
  $cw = $maxX - $minX + 1
  $ch = $maxY - $minY + 1
  $crop = New-Object System.Drawing.Bitmap $cw, $ch, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $cg = [System.Drawing.Graphics]::FromImage($crop)
  $cg.DrawImage($bmp, (New-Object System.Drawing.Rectangle 0, 0, $cw, $ch), $minX, $minY, $cw, $ch, [System.Drawing.GraphicsUnit]::Pixel)
  $cg.Dispose()
  $bmp.Dispose()

  $dir = Split-Path $Dest -Parent
  if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  $crop.Save($Dest, [System.Drawing.Imaging.ImageFormat]::Png)
  $crop.Dispose()
}

$root = Split-Path $PSScriptRoot -Parent
$src = Join-Path $root 'images\corelane-logo.png'
$opt = Join-Path $root 'images\opt'
Convert-Logo -Source $src -Dest (Join-Path $opt 'corelane-logo.png') -Light $true
Convert-Logo -Source $src -Dest (Join-Path $opt 'corelane-logo-white.png') -Light $false

$headerBlock = @"
<a class="logo" href="/index.html">
          <img class="logo__img" src="/images/opt/corelane-logo.png" width="220" height="220" alt="Corelane Systems" />
        </a>
"@
$footerBlock = @"
<a class="logo" href="/index.html">
            <img class="logo__img" src="/images/opt/corelane-logo-white.png" width="220" height="220" alt="Corelane Systems" />
          </a>
"@

$rx = [regex]'<a class="logo" href="/index.html">[\s\S]*?</a>'
$files = @((Join-Path $root 'index.html')) + @(Get-ChildItem (Join-Path $root 'pages') -Filter '*.html' | ForEach-Object { $_.FullName })
foreach ($file in $files) {
  $c = [System.IO.File]::ReadAllText($file)
  $ms = $rx.Matches($c)
  if ($ms.Count -lt 1) {
    Write-Host "No logo: $file"
    continue
  }
  $out = New-Object System.Text.StringBuilder
  $last = 0
  for ($n = 0; $n -lt $ms.Count; $n++) {
    [void]$out.Append($c.Substring($last, $ms[$n].Index - $last))
    if ($n -eq 0) { [void]$out.Append($headerBlock) } else { [void]$out.Append($footerBlock) }
    $last = $ms[$n].Index + $ms[$n].Length
  }
  [void]$out.Append($c.Substring($last))
  [System.IO.File]::WriteAllText($file, $out.ToString())
  Write-Host "Updated $file ($($ms.Count) logos)"
}

Write-Host 'Done.'
