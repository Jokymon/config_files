@echo Installing _cmd as AutoRun script when opening a cmd.exe Shell

reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun ^
  /t REG_EXPAND_SZ /d "%~dp0_cmd.bat" /f

pause
