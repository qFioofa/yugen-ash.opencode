@echo off
setlocal

set SCRIPT_DIR=%~dp0
set THEME_SRC=%SCRIPT_DIR%..\src\yugen-ash.json

if not exist "%THEME_SRC%" (
  echo error: theme file not found at %THEME_SRC%
  exit /b 1
)

if defined XDG_CONFIG_HOME (
  set OPENCODE_DIR=%XDG_CONFIG_HOME%\opencode
) else if defined APPDATA (
  set OPENCODE_DIR=%APPDATA%\opencode
) else (
  echo error: cannot determine config directory
  exit /b 1
)

set THEME_DST=%OPENCODE_DIR%\themes\yugen-ash.json
copy /y "%THEME_SRC%" "%THEME_DST%" >nul

echo installed to %THEME_DST%

findstr /c:"theme" "%OPENCODE_DIR%\tui.json" >nul 2>&1
if not errorlevel 1 (
  echo update your theme in %OPENCODE_DIR%\tui.json:
  echo   "theme": "yugen-ash"
) else (
  echo add to a config file (e.g. %OPENCODE_DIR%\tui.json):
  echo   { "theme": "yugen-ash" }
)
