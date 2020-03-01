# Installing arch with an encrypted /home folder

# Before chroot

* Keyboard layout setup

`loadkeys key-layout` (ie br-abnt2)

* Interwebs

`ping archlinux.org
`

`wifi-menu
`
* update clock

`timedatectl set-ntp true
`

* partitioning

`cfdisk`

/          Linux 1

/home      Linux 2

/boot/efi  EFI   3

swap       Swap  4

* encrypting

```sh
cryptsetup luksFormat /dev/sda2
cryptsetup open /dev/sda2 home
```
* create filesystems

```sh
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/mapper/home
mkfs.fat -F32 /dev/sda3
mkswap /dev/sd4
swapon /dev/sd4
```

* mounting the filesystems

```sh
mount /dev/sda1 /mnt
mkdir /mnt/home
mount /dev/mapper/home /mnt/home
mkdir -p /boot/efi
mount /dev/sda3 /boot/efi
```

* install

```sh
pacstrap /mnt base base-devel linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```

## After Chroot

* setup time zone

```sh
ln -sf /usr/share/zoneinfo/_region_/_city_ /etc/localtime (ie /America/Sao\_Paulo)
hwclock --systohc
```

* Locales

edit /etc/locale.gen and uncomment en\_US.UTF-8 UTF-8

```sh
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=\"br-abnt2\"" >> /etc/vconsole.conf
echo "LANG=en_US.UTF-8"
```

* hostname

```sh
echo "_hostname_" > /etc/hostname
```

* Network

Add these lines to /etc/hosts

```
127.0.0.1	localhost
::1		    localhost
```

```sh
pacman -S networkmanager network-manager-applet
systemctl enable NetworkManager
```

* Users

set your password with passwd

```sh
useradd -m -G wheel _name_
passwd _name_
passwd root
pacman -S vim
visudo
```

create a line with `name ALL=(ALL) ALL`

* pacman

edit /etc/pacman.conf and include multilib and enable colors

`pacman -Sy`

* bootloader

edit cryptab and include the incripted partition (run blkid to get the partition uuid                                                                                 )

<!--TODO: try out refind (https://github.com/bobafetthotmail/refind-theme-regular)-->
create a new initramfs

```sh
mkinitcpio -P
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
exit
reboot
```

## Post install

* Connecting wifi
```sh
nmcli dev wifi
nmcli dev wifi connect ESSID_NAME password ESSID_PASSWORD
```

install the needed graphics driver

```sh
sudo pacman -S git
git clone https://github.com/vscncls/dotfiles
pacman -S --needed - < packages.txt
systemctl enable --now ufw.service
sudo ufw default deny
sudo ufw allow from 192.168.0.0/24
sudo ufw allow Deluge
sudo ufw limit ssh
sudo ufw enable
```

copy config files

```sh
echo "setxkbmap -model pc101 -layout br & exec bspwm" > ~/.xinitrc
```

* Install a terminal emulator

```bash
git clone https://github.com/vscncls/st`
cd st
sudo make clean install
```

* aur packages

```sh
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S polybar betterlockscreen compton-tryone-git omnidb-app spotify nerd-fonts-fira-code
exec startx
```

* install vim plug

* install zsh plugins

* choose a nice wallpaper (~/Documents/wallpaper.jpg)

done?
