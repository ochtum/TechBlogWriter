param(
    [Parameter(Mandatory=$true, Position=0)]
    [String[]]$Url,

    [String]$OutDir = ".\元ネタ\画像",

    [Switch]$Force
)

function Ensure-Dir([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path)) { New-Item -ItemType Directory -Path $Path -Force | Out-Null }
}

Ensure-Dir -Path $OutDir

$downloaded = [System.Collections.Generic.HashSet[string]]::new()

foreach ($page in $Url) {
    Write-Host "Processing: $page"
    try {
        $resp = Invoke-WebRequest -Uri $page -ErrorAction Stop
        $html = $resp.Content
        $base = [uri]$page
    }
    catch {
        Write-Warning "Failed to fetch $page : $_"
        continue
    }

    $matches = @()
    $regexOpts = [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
    $imgPattern = @'
<img[^>]+?src=(?:(?:")|(?:'))(?<src>[^"']+)(?:(?:")|(?:'))
'@
    $metaPattern = @'
<meta[^>]+?(?:property|name)=(?:(?:")|(?:'))(?:og:image|twitter:image)(?:(?:")|(?:'))[^>]*?content=(?:(?:")|(?:'))(?<src>[^"']+)(?:(?:")|(?:'))
'@
    $linkPattern = @'
<link[^>]+?rel=(?:(?:")|(?:'))image_src(?:(?:")|(?:'))[^>]*?href=(?:(?:")|(?:'))(?<src>[^"']+)(?:(?:")|(?:'))
'@
    $matches += [regex]::Matches($html, $imgPattern, $regexOpts) | ForEach-Object { $_.Groups['src'].Value }
    $matches += [regex]::Matches($html, $metaPattern, $regexOpts) | ForEach-Object { $_.Groups['src'].Value }
    $matches += [regex]::Matches($html, $linkPattern, $regexOpts) | ForEach-Object { $_.Groups['src'].Value }

    $matches = $matches | Where-Object { $_ -and $_.Trim().Length -gt 0 } | Select-Object -Unique
    if (-not $matches) { Write-Host "No images found on $page"; continue }

    foreach ($src in $matches) {
        try {
            $s = $src.Trim()
            if ($s -match '^data:') { continue }
            try { $u = [uri]::new($s) } catch { $u = [uri]::new($base, $s) }
            $norm = $u.AbsoluteUri
            if ($downloaded.Contains($norm)) { continue }
            $filename = [System.IO.Path]::GetFileName($u.AbsolutePath)
            if (-not $filename) { $filename = ($u.Host + '_' + ([System.Guid]::NewGuid().ToString()) + '.png') }
            $filename = $filename -replace '[\\/:*?"<>|]', '_'
            $out = Join-Path $OutDir $filename
            if ((Test-Path -LiteralPath $out) -and (-not $Force)) { $downloaded.Add($norm) | Out-Null; continue }
            Write-Host "Downloading: $norm"
            Invoke-WebRequest -Uri $norm -OutFile $out -ErrorAction Stop
            $downloaded.Add($norm) | Out-Null
        }
        catch { Write-Warning "Failed to download $src : $_"; continue }
    }
}

Write-Host "Done. Images saved to: $OutDir"

