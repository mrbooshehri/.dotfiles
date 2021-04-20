# Artix linux openrc
## Virtualbox installation guid + efi
* Enable Efi mode in your virtualbox settings under system tab
1. Switch to root user
	```bash
	sudo su
	```
2. Sync packet manager
	```bash
	pacman -Syy
	```
3. Check disk status
	```bash
	lsblk
	```
4. Create your partitions with fdisk/cfdisk/gdisk
	```bash
	fdisk /dev/sdX
	or
	cfdisk /dev/sdX
	or
	gdisk /dev/sdX
	```
* Create a 200MB partition for efi with efi type
* Create a petition with the rest of remaining space for root partition

5. Format created partitions
* For efi you should use FAT32
	```bash
	mkfs.fat -F32 /dev/sdX
	```
* For the root partition use ext4
	```bash
	mkfs.ext4 /dev/sdX
	```
6. Mount the formatted partitions
* For root partition
	```bash
	mount /dev/sdX /mnt
	```
* For boot partition
	```bash
	mkdir /mnt/boot
	mount /dev/sdX /mnt/boot
	```
7. Install the base system
	```bash
	basestrap /mnt base base-devel openrc linux linux-firmware vim intel-ucode
	```
* The vim and intel-ucode are optional
* Use amd-ucode if you're using AMD

8. Create file system table (fstab)
	```bash
	fstabgen -U /mnt >> /mnt/etc/fstab
	```
9. Enter the installation and live the iso
	```bash
	artix-chroot /mnt
	```
10. [Optional] Create swapfile
	```bash
	dd if=/dev/zero of=/swapfile bs=1G count=2 status=progress
	chmod 600 /swapfile
	mkswap /swapfile
	swapon /swapfile
	```
* You can choose the size and count of swapfile as your need
11. [Optional] Add swapfile to fstab by add these line to ``` /etc/fstab ```
	```bash
	/swapfile	none	swap	defaults	0	0
	```
12. Configure your localization
	```bash
	ln -sf /usr/sahre/zoneinfo/REGION/CITY /etc/localtime
	```
* Select your region and city
13. Sync system clock with hardware clock
	```bash
	hwclock --systohc
	```
14. Select locale by removing the ``` #  ``` form start of your preferred one
	```bash
	vim /etc/locate.gen
	```
* Hint: uncomment ``` #en_US.UTF-8 UTF-8 ```
15. Generate the locale file
	```bash
	locale-gen
	```
16. Put the locale in ``` locale.conf ``` by adding ``` LANG=en_US.UTF-8 ``` to ``` /etc/locale.conf ```
	```bash
	vim /etc/locale.conf
	```
17. Configure your hostname by adding your favorite name to ``` /etc/hostname  ```
	```bash
	vim /etc/hostname
	```
18. Add the following lines to ``` /etc/hosts ```
	```bash
	127.0.0.1		localhost
	::1			localhost
	127.0.1.1		vm.localdomain	vm
	```
* ``` vm  ```is your hostname
19. Set password for root user
	```bash
	passwd
	```
20. Install other packages
	```bash
	pacman -S grub efibootmgr nerworkmanager networkmanager-openrc network-manager-applet 
		  wpa_supplicant diolog os-prober dosfstools linux-headers bluez bluez-openrc 
	   	  bluez-utils cups cups-openrc
	```
21. Install the GRUB bootloader
	```bash
	grub-install --target=x86_64-efi --efi-directory=/boot bootloader-id=GRUB
	```
22. Generate grub configuration
	```bash
	grub-mkconfig -o /boot/grub/grub.cfg
	```
23. Enable services
	```bash
	rc-update add NetworkManager default
	rc-update add bluetoothd default
	rc-update add cupsd default
	```
24. Create a user and set password for it
	```bash
	useradd -mG wheel vm
	passwd vm
	```
25. Give sudo privilege to the user by removing the ``` # ``` from first of ``` whell ALL=(ALL) ALL ```
	```bash
	EDITOR=vim visudo
	```
26. Exit from chroot and reboot the system
	```bash
	exit
	reboot
	```
