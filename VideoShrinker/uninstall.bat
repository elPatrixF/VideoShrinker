@echo off
REM Thanks to https://superuser.com/questions/788924/is-it-possible-to-automatically-run-a-batch-file-as-administrator/852877#852877
REM for this batch script to detect Admin Rights
REM (It's necessary for the shell extension to work!)

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

echo[
echo    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo   "  _   ___    __           ______       _      __           "
echo  "  | | / (_)__/ /__ ___    / __/ /  ____(_)__  / /_____ ____  "
echo "   | |/ / / _  / -_) _ \  _\ \/ _ \/ __/ / _ \/  '_/ -_) __/   "
echo  "  |___/_/\_,_/\__/\___/ /___/_//_/_/ /_/_//_/_/\_\\__/_/     "
echo   "                                                           "    
echo    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
echo[
reg import %~dp0\uninstall.reg
del "%APPDATA%\Microsoft\Windows\SendTo\VideoShrinker (for multiple files).lnk"
echo VideoShrinker is now uninstalled!
echo Feel free to delete the folder C:\ProgramData\VideoShrinker\
echo[
pause