 HOW TO:
 can turn on and off the script by going into /Library/LaunchAgents/
 and load by invoking launchdctl load KuvvaRipScript.plist
 or unload by invoking launchdctl unload KuvvaRipScript.plist

 compares two files (in my case images)
 if files are the same then we do not add to the folder
 if files are different then we will add to the folder
