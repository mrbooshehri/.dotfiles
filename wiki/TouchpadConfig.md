# Touchpad configuration

1. Create ``` 40-libinput.conf ``` under ```/etc/X11/xorg.conf.d```
```bash
sudo touch /etc/X11/xorg.conf.d/40-libinput.conf
```
2. Open ```40-libinput.conf``` and add these lines to it
```bash
sudo vim /etc/X11/xorg.conf.d/40-libinput.conf

Section "InputClass"
	Identifier "libinput touchpad catchall"
	MatchIsTouchpad "on"
	MatchDevicePath "/dev/input/event*"
	Option "Tapping" "True"
	Option "TappingDrag" "True"
	Option "AccelProfile" "linear"
	Option "DisableWhileTyping" "True"
	Driver "libinput"
EndSection
```

