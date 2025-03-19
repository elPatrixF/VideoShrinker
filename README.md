# VideoShrinker
![image](https://github.com/user-attachments/assets/b986af36-6588-44c1-ae7b-9f1a0f940246)

Discord has a 10MB size limit for videos and it was tedious to have to manually open up [avidemux](https://avidemux.sourceforge.net/) to trim, cut and export, or drag and drop each video on a batch file every time I needed to send a video, so I made an explorer extension that lets you compress videos quickly by just right-clicking and selecting "Shrink Video". I figured it's really useful so I cleaned it up and uploaded it so anyone can use it. Uses ffmpeg to decode and encode video files.

It also doubles as a simple H.264 re-encoder if you want to quickly compress your clips and recordings.

This was designed for Windows 10, but it should also work with no problem on any 64-bit version of Windows, as old as Windows 7.

I've uploaded the files here just so you can see the contents of the script files to confirm they're safe.
The only files missing are ffmpeg_v.exe and ffprobe_v.exe. Which are just ffmpeg.exe and ffprobe.exe but renamed.
You can use the ones bundled in the autoinstaller or you build your own version of ffmpeg and ffprobe.
The version used here is the "essentials" build from https://www.gyan.dev/ffmpeg/builds/

# Download
## Automatic installation
Download and run the self extracting autoinstaller here:

https://mega.nz/file/iLATxRCR#dBt5N4oJoKqupVTdRjZcJmKt2WINjHx17JmG5XmkgN8
(Includes ffmpeg, ffprobe, cmdmp3, registry fixes, icon, and the batch files)

## Manual installation
Download the self extracting autoinstaller and extract the contents of it using winrar, or 7zip, to the path C:\ProgramData\VideoShrinker\
Then run install.bat to add the menu options to the context menu of video files.

# To uninstall
Go to C:\ProgramData\VideoShrinker\ and run uninstall.bat to remove the context menu options from video files, then delete the folder.

# README:
> Q: What is this?

**A:** This is a simple shell extension program that lets you compress videos down to 8MB.
   Made specifically to quickly be able to send video files over discord without exceeding
   the maximum file size allowed for free users.
   
> Q: How do I use it?

**A:** Right click on any video file (MP4, WEBM, MOV, MKV, AVI, etc) and select 
   "Quick Shrink video", or "Shrink Video...", then either follow the on-screen instructions
   or wait for the file to finish converting. You will hear a fanfare noise when it's done, and
   the program will close automatically.
      
> Q: The "Quick Shrink video" and "Shrink Video..." aren't showing up!

A: Navigate to the folder C:\ProgramData\VideoShrinker\ and double click on "install.reg" to
   add the context menu options again.

> Q: What video formats are supported?

**A:** By default the only extensions recognized by VideoShrinker are .MP4, .WEBM, .MKV, .AVI, .MOV, and .WMV.
   If your video is in a different format the context menu option might not show up, but ffmpeg can decode from 
   a huge variety of video formats. The output format will be MP4. You *can* change it by pressing "E" but it's
   not recommended, as H.264 is not compatible with all formats (like WEBM for example).
   
> Q: How do I uninstall this program?

**A:** Navigate to the folder C:\ProgramData\VideoShrinker\, and open "uninstall.reg" to remove the
   options from the context menu, then delete the folder C:\ProgramData\VideoShrinker\.
   
> Q: Can I choose other file sizes?

**A:** Yes, just select "Shrink Video...", then press "F" when the options show up.
   Type your desired filesize in megabytes there.

> Q: The resulting video is larger than 8MB! What do I do?

**A:** If the resulting video ends up being larger than you need it you can try option "7".
   It will output a SLIGHTLY smaller file size. If that is still too large, you'll have to 
   change the target filesize to a smaller value than the one you need.
   Target filesize is the result of a very naive calculation (duration/bitrate).
   You might have to play around with this value until you get the right size.

> Q: The resulting video looks awful! How can I make it look better?

**A:** You can select "Shrink Video..." and then chooose option "1".
   This will trim the video to the last 30 seconds, which will make it look better.
   Alternately you can press "5" to use the H.265 codec instead of the default H.264 one.
   
   It will take a bit longer but it will look slightly better, at the same file size.
   If it still looks bad, you could try the other options, but we don't do miracles here!   
   For slightly more complex editing, I recommend [avidemux](https://avidemux.sourceforge.net/).

> Q: I'm an advanced user. Can I modify this program to add my own formats and presets?

**A:** Sure go ahead, the main script is located at `C:\ProgramData\VideoShrinker\VideoShrinker.bat`.
All the script does is call ffprobe to check the video length, present the options on screen, then call ffmpeg to re-encode the video.

The main focus of this program was to be able to shrink videos quickly and in a very simple fashion, so the options are limited on purpose.

The `Install.reg` file contains the registry entries which add the context menu options to the specified file extensions. If you know what you're doing you can add your own desired file formats there and merge the registry entries again.

You can do whatever you want with this program if it's for personal use. All I ask is that you plan to share your modified version around, keep the `echo VideoShrinker script made by elPatrixF.com - 2025` line and the cool Ascii title intact.
Linking back to this github page is appreciated too!
