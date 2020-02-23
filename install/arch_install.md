# Installing arch with an encrypted /home fodler

# Before chroot

* Keyboard layout setup

`loadkeys _key layout_ (ie br-abnt2)`

* Interwebs

`ping archlinux.org
`
`wifi-menu
`
* update clock

`timedatectl set-ntp true
`
* partitioning

`cfdisk
`
/          Linux 1
/home      Linux 2
/boot/efi  EFI   3
swap       Swap  4

* create filesystems

`mkfs.ext4 /dev/sda1
``mkfs.ext4 /dev/sda2
``mkfs.fat -F32 /dev/sda3
``mkswap /dev/sd4
`
`swapon /dev/sd4
`
* encrypting

`cryptsetup luksFormat /dev/sda2
`
`cryptsetup open /dev/sda2 home
`
* mounting the filesystems

`mount /dev/sda1 /mnt
``mkdir /mnt/home
``mount /dev/mapper/home /mnt/home
``mkdir -p /boot/efi
``mount /dev/sda3 /boot/efi
`
* install

`pacstrap /mnt base base-devel linux linux-firmware
`
`genfstab -U /mnt >> /mnt/etc/fstab
`
`arch-chroot /mnt
`
## After Chroot

* setup time zoen

`ln -sf /usr/share/zoneinfo/_region_/_city_ /etc/localtime (ie /America/Sao\_Paulo)
    `
    `hwclock --systohc
    `
* Locales

`edit /etc/locale.gen and uncomment en\_US.UTF-8 UTF-8
`
`locale-gen
`
`echo "LANG=en_US.UTF-8" >> /etc/locale.conf
    `
`loadkeys _key layout_ (ie br-abnt2)
    `
* hostname

`echo "_hostname_" > /etc/hostname
`
* Network

Add these lines to /etc/hosts

```
127.0.0.1	localhost
::1		    localhost
```

`pacman -S networkmanager network-manager-applet
`

`systemctl enable NetworkManager`

* create a new initramfs

`mkinitcpio -P
`
* Users

set your password with passwd

`useradd -m -G wheel _name_
`
`pacman -S vim
`
`visudo`

create a line with `name ALL=(ALL) ALL`

`passwd name`

* bootloader

<!--TODO: try out refind (https://github.com/bobafetthotmail/refind-theme-regular)-->

`pacman -S grub efibootmgr`

`grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB`

`grub-mkconfig -o /boot/grub/grub.cfg`

REBOOT

## Post install

install the needed graphics driver

`pacman -S --needed - < packages.txt`

`git clone https://github.com/vscncls/dotfiles`

copy config files

add this to the .xinitrc

```
exec bspwm
```

* aur packages

```sh
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

`yay -S polybar betterlockscreen compton-tryone-git omnidb-app spotify`

`exec startx`

* install vim plug

* install zsh plugins

* choose a nice wallpaper (~/Documents/wallpaper.jpg)

done?
