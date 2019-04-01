mkdir C:\bin
xcopy /s . C:\bin
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor" /v AutoRun /d "C:\bin\cmdrc.bat"