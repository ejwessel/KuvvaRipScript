### About: 
Kuvva was an application and service for artists to share, sell, and gain exposure for their work. The client application changed the background image of your desktop every X duration (minutes, hours, weeks, months, etc). I decided I wanted all the art, but to not have to pay for it. I set up my account to pull a variety of images I was interested in to my computer. This was a script I wrote back in 2006 that monitored the hidden directory that Kuvva saved into, copied the image, and saved it into my personal collection. Given that Kuvva is no longer around, I've decided to share this.

### Setup:
1. Drop `KuvvaRipScript.plist` into `/Library/LaunchAgents`
1. Drop `KuvvaRipScript.sh` into `/usr/local/bin`
1. Give `KuvvaRipScript.sh` `rwxr-xr-x` permissions
1. Load script by running `launchdctl load KuvvaRipScript.plist`

### Other:
1. Unload script by running `launchdctl unload KuvvaRipScript.plist`

### How it works:
- compares two files (in my case images) with `cmp`
  - compare two files byte by byte
- if files are the same then we do not add to the folder
- if files are different then we will add to the folder

### Problems: 
- Images can be the same visually, but still different byte by byte if they are of different resolutions or sizes of the image; if two images are the 'same' one is a better resolution than the other, they will be marked as 'different' and both will be saved.
