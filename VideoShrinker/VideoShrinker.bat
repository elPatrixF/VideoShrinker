@echo off
cd /D %~dp0

if "%~1"=="" goto error
cls
set /a size=8
set extension=mp4
set codecchoice=0

rem /* Passing the "-quick" parameter skips selection and uses the default option */
if "%~1"=="-quick" set codecchoice=4
if "%~1"=="-quick" shift

rem /* Passing the "-best" parameter skips selection and uses the best option */
if "%~1"=="-best" set codecchoice=7
if "%~1"=="-best" shift

:loop
rem /* Check video length and store it in an environment variable */
ffprobe_v -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "%~1" > length.txt
for /f "tokens=1 delims=." %%a in (length.txt) do set var=%%a

echo    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo   "  _   ___    __           ______       _      __           "
echo  "  | | / (_)__/ /__ ___    / __/ /  ____(_)__  / /_____ ____  "
echo "   | |/ / / _  / -_) _ \  _\ \/ _ \/ __/ / _ \/  '_/ -_) __/   "
echo  "  |___/_/\_,_/\__/\___/ /___/_//_/_/ /_/_//_/_/\_\\__/_/     "
echo   "                                                           "         elPatrixF.com
echo    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""            v15.3.2025.2
echo[

echo *********************************
echo  Video file: %~1
echo  Video length: %var% seconds
rem /* Multiply by 8000 to get the desired target size in megabytes. */
set /a kbsize=%size%*8000
echo  Desired size: %size%MB (%kbsize% kilobits)
set /a s30size=%kbsize%/30
set /a var=%kbsize%/%var%
echo  Calculated target maximum bitrate: %var%kbps
set /a buf=%var%/2
del length.txt
echo *********************************
echo This video will be encoded (%extension%) to fit in %size%MB. Choose a codec, or an option:
echo[
echo 1.  Trim to last 30 seconds (Uses libx264)
echo 2.  H.264 @ 360p    - Video resolution adjusted to 640x360
echo 3.  H.264 @ 720p    - Video resolution adjusted to 1280:720
echo 4.  H.264 (AVC)     - Fast, most compatible ( *Default option* )
echo 5.  H.265 (HEVC)    - Slower, less compatible but has better compression
echo 6.  h264_nvenc      - Fastest, NVIDIA graphics cards only
echo 7.  H.264 (Smaller) - Fast, slightly smaller buffer size
echo 8.  Ignore file size limit and use recommended settings (H.264)
echo[
echo F.  Change target [F]ilesize or [E]xtension (Currently %size%MB, %extension%).
echo X.  Exit
echo[
IF %codecchoice% == 0 choice /c 12345678FEX /t 30 /d 4 /m "If no option is picked in 30 seconds, option 4 will be used."
IF %codecchoice% == 0 set codecchoice=%ERRORLEVEL%

IF %codecchoice% == 11 goto end
IF %codecchoice% LEQ 8 goto process
IF %codecchoice% == 10 goto chooseextension

echo *********************************
:choosesize
set /p size=Enter the target size in whole megabytes (Currently %size%MB): 
set /a size=%size%
set codecchoice=0
IF %size% LEQ 0 echo ERROR: Size must be a positive non-zero integer number.
IF %size% LEQ 0 goto choosesize
cls
goto loop

echo *********************************
:chooseextension
set /p extension=Enter the target file extension (Currently .%extension%): .
set codecchoice=0
cls
goto loop

:process
IF %codecchoice% == 1 ffmpeg_v -y -sseof -30 -i "%~1" -c:v libx264 -maxrate %s30size%k -bufsize %s30size%k  "%~dpn1 (30s).mp4"

IF %codecchoice% == 2 ffmpeg_v -y -i "%~1" -c:v libx264 -filter:v scale=-640:360 -maxrate %var%k -bufsize %buf%k  "%~dpn1 (%var%kbps 360p).%extension%"
IF %codecchoice% == 3 ffmpeg_v -y -i "%~1" -c:v libx264 -filter:v scale=-1280:720 -maxrate %var%k -bufsize %buf%k  "%~dpn1 (%var%kbps 720p).%extension%"

IF %codecchoice% == 4 ffmpeg_v -y -i "%~1" -c:v libx264 -maxrate %var%k -bufsize %buf%k  "%~dpn1 (%var%kbps).%extension%"
IF %codecchoice% == 5 ffmpeg_v -y -i "%~1" -c:v libx265 -maxrate %var%k -bufsize %buf%k  "%~dpn1 (%var%kbps HEVC).%extension%"
IF %codecchoice% == 6 ffmpeg_v -y -i "%~1" -c:v h264_nvenc -b:v %var%k -maxrate %var%k -bufsize %buf%k  "%~dpn1 (%var%kbps NVENC).%extension%"

IF %codecchoice% == 7 set /a buf=%buf%/2
IF %codecchoice% == 7 set /a var=%var%-%buf%
IF %codecchoice% == 7 ffmpeg_v -y -i "%~1" -c:v libx264 -maxrate %var%k -bufsize %buf%k  "%~dpn1 (%var%kbps).%extension%"

IF %codecchoice% == 8 ffmpeg_v -y -i "%~1" -c:v libx264 "%~dpn1 (H.264).%extension%"

shift
if not "%~1"=="" goto loop

rem ffplay_v -i "tada.wav" -v error -autoexit -nodisp
echo VideoShrinker script made by elPatrixF.com - 2025
cmdmp3 tada.wav > nul
goto end

:error
echo ERROR: 
pause

:end