    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   "  _   ___    __           ______       _      __           "
  "  | | / (_)__/ /__ ___    / __/ /  ____(_)__  / /_____ ____  "
 "   | |/ / / _  / -_) _ \  _\ \/ _ \/ __/ / _ \/  '_/ -_) __/   "
  "  |___/_/\_,_/\__/\___/ /___/_//_/_/ /_/_//_/_/\_\\__/_/     "
   "                                                           "   
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""      
	
	elpatrixf.com
	
Q: What is this?
A: This is a simple shell extension program that lets you compress videos down to 8MB.
   Made specifically to quickly be able to send video files over discord without exceeding
   the maximum file size allowed for free users.
   
Q: How do I use it?
A: Right click on any video file (MP4, WEBM, MOV, MKV, AVI, etc) and select 
   "Quick Shrink video", or "Shrink Video...", then either follow the on-screen instructions
   or wait for the file to finish converting. You will hear a fanfare noise when it's done, and
   the program will close automatically.
      
Q: The "Quick Shrink video" and "Shrink Video..." aren't showing up!
A: Navigate to the folder C:\ProgramData\VideoShrinker\ and double click on "install.reg" to
   add the context menu options again.
   
Q: How do I uninstall this program?
A: Navigate to the folder C:\ProgramData\VideoShrinker\, and open "uninstall.reg" to remove the
   options from the context menu, then delete the folder C:\ProgramData\VideoShrinker\.
   
Q: Can I choose other file sizes?
A: Yes, just select "Shrink Video...", then press "F" when the options show up.
   Type your desired filesize in megabytes there.

Q: The resulting video is larger than 8MB! What do I do?
A: If the resulting video ends up being larger than you need it you can try option "7".
   It will output a SLIGHTLY smaller file size. If that is still too large, you'll have to 
   change the target filesize to a smaller value than the one you need.
   Target filesize is the result of a very naive calculation (duration/bitrate).
   You might have to play around with this value until you get the right size.

Q: The resulting video looks awful! How can I make it look better?
A: You can select "Shrink Video..." and then chooose option "7".
   This will trim the video to the last 30 seconds, which will make it look better.
   Alternately you can press "5" to use the H.265 codec instead of the default H.264 one.
   It will take a bit longer but it will look slightly better, at the same file size.
   If it still looks bad, you could try the other options, but we don't do miracles here!
