## NVBurner
A MSI Afterburner alternative for NVIDIA users in Linux.

# YOU MUST INSTALL LATEST NVIDIA DRIVERS TO USE!
If you do not install the latest NVIDIA drivers, you will not be able to use the application.

## How to use?
Download latest release from [releases](https://github.com/iloveichigo/NVBurner/releases) and uncompress it.
And open terminal in folder which you put uncompressed folder.
Use `bash install-dependencies.sh` command. 
Finally you can open app with `bash run.sh` command.

# To Do List
- [x] Install "dialog" package automatically -> Added! 
- [ ] Adjusting clock speeds (I've already done this but need to improve as it's useless)
- [ ] Close "screen" automatically
- [ ] Web UI

# Bugs:
You can't exit NVBurner with buttons when logging info (Use CTRL+C instead)

There are no any alert if you set voltage 40000W etc. so don't try

If you close it with the X button the dialog is double so always exit with the Cancel button. I'm working on it, will be fixed soon.


## Screenshot

![](https://raw.githubusercontent.com/iloveichigo/NVBurner/main/sc1.png)
