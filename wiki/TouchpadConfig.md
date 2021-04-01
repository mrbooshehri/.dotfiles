# Touchpad configuration

1. Create ``` 40-libinput.conf ``` under ```/etc/X11/xorg.conf.d```
```bash
sudo touch /etc/X11/xorg.conf.d/40-libinput.conf
```
2. Open the file add these lines to ```40-libinput.conf```
```bash
sudo vim /etc/X11/xorg.conf.d/40-libinput.conf

Section "InputClass"
	Identifier "libinput touchpad catchall"
	MatchIsTouchpad "on"
	MatchDevicePath "/dev/input/event*"
	Option "Tapping" "True"
	Option "TappingDrag" "True"
	Option "AccelProfile" "linear"
	Option "DisableWhileTyping" "False"
	Driver "libinput"
EndSection
```

