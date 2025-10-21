<#
.SYNOPSIS
 Downloads images referenced from one or more web pages into the repository's 元ネタ\画像 folder.

.DESCRIPTION
 This script fetches the HTML for each provided URL, extracts image URLs from <img> tags and common
 meta tags (og:image, twitter:image), resolves relative paths, and downloads unique images to the
 destination directory. It is intended to be run with PowerShell (pwsh.exe) on Windows.

.PARAMETER Url
 One or more webpage URLs to scan for images.

.PARAMETER OutDir
 Destination directory for downloaded images. Defaults to .\元ネタ\画像

.PARAMETER Force
 If set, overwrite existing files with the same name.

EXAMPLE
 pwsh.exe -File .\scripts\download-images.ps1 -Url "https://github.blog/…" -OutDir ".\\元ネタ\\画像"
#>

param(
    [Parameter(Mandatory=$true, Position=0)]
    [String[]]$Url,

    [String]$OutDir = ".\元ネタ\画像",

    [Switch]$Force
)

function Ensure-Dir {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

Ensure-Dir -Path $OutDir

[System.Collections.Generic.HashSet[string]]$downloaded = [System.Collections.Generic.HashSet[string]]::new()

foreach ($page in $Url) {
    Write-Host "Processing: $page"
    try {
        $response = Invoke-WebRequest -Uri $page -UseBasicParsing -ErrorAction Stop
        $html = $response.Content
        $baseUri = [uri]$page
    }
    catch {
        Write-Warning "Failed to fetch $page : $_"
        continue
    }

    $matches = @()

    # img tags
    $imgPattern = '<img[^>]+?src=(?:"|\')(?<src>[^"\']+)(?:"|\')'
    $m = [regex]::Matches($html, $imgPattern, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($x in $m) { $matches += $x.Groups['src'].Value }

    # og:image and twitter:image
    $metaPattern = '<meta[^>]+?(?:property|name)=(?:"|\')(?:og:image|twitter:image)(?:"|\')[^>]*?content=(?:"|\')(?<src>[^"\']+)(?:"|\')'
    $m2 = [regex]::Matches($html, $metaPattern, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($x in $m2) { $matches += $x.Groups['src'].Value }

    # also look for link rel=image_src
    $linkPattern = '<link[^>]+?rel=(?:"|\')image_src(?:"|\')[^>]*?href=(?:"|\')(?<src>[^"\']+)(?:"|\')'
    $m3 = [regex]::Matches($html, $linkPattern, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($x in $m3) { $matches += $x.Groups['src'].Value }

    $matches = $matches | Where-Object { $_ -and $_.Trim().Length -gt 0 } | Select-Object -Unique

    if (-not $matches) {
        Write-Host "No images found on $page"
        continue
    }

    foreach ($src in $matches) {
        try {
            $srcTrim = $src.Trim()
            # Skip data URIs
            if ($srcTrim -match '^data:') { Write-Host "Skipping data URI"; continue }

            # Resolve relative URIs
            try { $imgUri = [uri]::new($srcTrim) }
            catch { $imgUri = [uri]::new($baseUri, $srcTrim) }

            $normalized = $imgUri.AbsoluteUri
            if ($downloaded.Contains($normalized)) { continue }

            # Derive filename
            $filename = [System.IO.Path]::GetFileName($imgUri.AbsolutePath)
            if (-not $filename) {
                # fallback: use host + hash
                $hash = [System.BitConverter]::ToString((New-Object Security.Cryptography.MD5CryptoServiceProvider).ComputeHash([Text.Encoding]::UTF8.GetBytes($normalized))).Replace('-','').ToLower()
                $filename = ($imgUri.Host + "_" + $hash + ".png")
            }
            else {
                # remove query from filename if present
                if ($filename -match '^(.+?)\?') { $filename = $matches[1] }
            }

            # sanitize filename
            $filename = $filename -replace '[\\/:*?"<>|]', '_' 

            $outPath = Join-Path $OutDir $filename

            if ((Test-Path -LiteralPath $outPath) -and (-not $Force)) {
                Write-Host "Skipping existing: $filename"
                $downloaded.Add($normalized) | Out-Null
                continue
            }

            Write-Host "Downloading: $normalized -> $outPath"
            Invoke-WebRequest -Uri $normalized -OutFile $outPath -ErrorAction Stop
            $downloaded.Add($normalized) | Out-Null
        }
        catch {
            Write-Warning "Failed to download $srcTrim : $_"
            continue
        }
    }
}

Write-Host "Done. Images saved to: $OutDir"
