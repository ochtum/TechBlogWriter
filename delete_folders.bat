@echo off
setlocal

set "BASE_DIR=%~dp0"
set "PS_EXE=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"

if not exist "%PS_EXE%" (
    echo [ERROR] PowerShell was not found.
    pause
    exit /b 1
)

"%PS_EXE%" -NoProfile -ExecutionPolicy Bypass -Command ^
  "$base = [System.IO.Path]::GetFullPath('%BASE_DIR%');" ^
  "$names = @(([string][char]0x8A18 + [char]0x4E8B), ([string][char]0x5143 + [char]0x30CD + [char]0x30BF));" ^
  "foreach ($name in $names) {" ^
  "  $target = Join-Path -Path $base -ChildPath $name;" ^
  "  if (Test-Path -LiteralPath $target -PathType Container) {" ^
  "    Remove-Item -LiteralPath $target -Recurse -Force;" ^
  "    if (Test-Path -LiteralPath $target) { Write-Host ('[FAILED] ' + $name); } else { Write-Host ('[DELETED] ' + $name); }" ^
  "  } else {" ^
  "    Write-Host ('[SKIP] ' + $name);" ^
  "  }" ^
  "}"

if errorlevel 1 (
    echo [ERROR] Deletion script failed.
) else (
    echo [OK] Completed.
)
pause
exit /b %errorlevel%
