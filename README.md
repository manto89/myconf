# XPS15 with Debian 9
## Basic software
Login as root
```console
root@bar:# apt-get install sudo
root@bar:# visudo
```
Edit sudoers 
```
foo ALL=(ALL:ALL) ALL
```
or
```
foo ALL=(ALL) NOPASSWD:ALL
```
Logout and login with user
```console
foo@bar:$ sudo apt-get update && sudo apt-get upgrade
foo@bar:$ sudo apt-get install git curl zsh tree vim
foo@bar:$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
foo@bar:$ chsh -s /bin/zsh
foo@bar:$ zsh
foo@bar:$ git clone https://www.github.com/manto89/myconf
foo@bar:$ cp ./myconf/.zshrc ~/
foo@bar:$ cp -r ./myconf/.oh-my-zsh ./
foo@bar:$ vim ./zshrc
```
Edit .zshrc, substitute $USER with your user
```
export ZSH=/home/$USER/.oh-my-zsh
```
Update zsh config
```console
foo@bar:$ source ~/.zshrc
```
## Install i3wm
```console
foo@bar:$ sudo apt-get install i3
```
In order to have ram usage in i3status
```console
foo@bar:$ sudo apt-get install libconfuse-dev libyajl-dev libasound2-dev libiw-dev asciidoc libpulse-dev libnl-genl-3-dev
foo@bar:$ git clone https://github.com/i3/i3status.git
foo@bar:$ cd i3status
foo@bar:$ make && sudo make install
foo@bar:$ vim /etc/i3status.conf
```
```
# i3status configuration file.
# see "man i3status" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# ß
# If the above line is not correctly displayed, fix your editor first!

general {
        colors = true
        interval = 5
}

order += "ipv6"
order += "volume master"
order += "disk /"
order += "wireless _first_"
order += "ethernet _first_"
order += "cpu_temperature 0"
order += "battery all"
order += "load"
order += "memory"
order += "tztime local"

wireless _first_ {
        format_up = "W: (%quality at %essid) %ip"
        format_down = "W: down"
}

ethernet _first_ {
        format_up = "E: %ip (%speed)"
        format_down = "E: down"
}

battery all {
        format = "%status %percentage %remaining"
}

tztime local {
        format = "%Y-%m-%d %H:%M:%S"
}

load {
        format = "CPU: %5min"
}

disk "/" {
        format = "HDD: %avail"
}

volume master {
        format = "♪: %volume"
        format_muted = "♪: muted (%volume)"
        device = "default"
        mixer = "Master"
        mixer_idx = 0
}

cpu_temperature 0 {
        format = "T: %degrees °C"
        path = "/sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input"
}
memory {
        format = "RAM: %available"
        threshold_degraded = "1G"
        format_degraded = "MEMORY < %available"
}
```
Create file .xinitrc
```console
foo@bar:~$ vim ~/.xinitrc
```
```
start i3
```
Test for errors
```console
foo@bar:~$ startx
```
If everything is fine add in the first line of .zshrc
```console
foo@bar:~$ vim ~/.zshrc
```
```
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi
```
Reload i3
```
Meta+Shift+R
```
### Change terminal emulator
```console
sudo update-alternatives --config x-terminal-emulator
```

## AUTO MOUNT USB
Install udiskie
```console
foo@bar:~$ sudo apt-get install python-setuptools udisks2 python-pip python-gobject python-yaml libgio2.0 gobject-introspection libgtk2.0-0 libnotify4 gettext gir1.2-notify-0.7

foo@bar:~$ sudo pip install udiskie
```
Edit the policy kit authorization file
```console
foo@bar:~$ sudo vim  /etc/polkit-1/localauthority/50-local.d/consolekit.pkla

```
Add the following text
```
[udiskie]
Identity=unix-group:plugdev
Action=org.freedesktop.udisks.*
ResultAny=yes
```
Add user to group 
```console
foo@bar:~$ sudo usermod -a -G plugdev $USER
```
Test if there's any error
```console
foo@bar:~$ udiskie
```
If everything is fine, edit .xinitrc
```console
foo@bar:~$ vim ~/.xinitrc
```
add the following text
```
udiskie &
```
## Install VirtualBox
```console

```
## Install JetBrains Rider
Install Mono Develop
```console
foo@bar:~$ sudo apt install apt-transport-https dirmngr
foo@bar:~$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
foo@bar:~$ echo "deb https://download.mono-project.com/repo/debian stable-stretch main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
foo@bar:~$ sudo apt update
foo@bar:~$ sudo apt install mono-complete mono-xsp4 nodejs npm
```
Download and install rider
```console
foo@bar:~$ wget https://download-cf.jetbrains.com/rider/JetBrains.Rider-2018.2.3.tar.gz
foo@bar:~$ tar -xvf ./JetBrains.Rider-2018.2.3.tar.gz
foo@bar:~$ sudo mkdir -p /opt/rider-2018.2.3
foo@bar:~$ sudo cp -r ./JetBrains.Rider-2018.2.3/* /opt/rider-2018.2.3/
foo@bar:~$ sudo ln -s /opt/rider /opt/rider-2018.2.3/bin/rider.sh
```
