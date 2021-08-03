# Linux configurations
## Basic software
### OpenSuse
#### Essentials 
```console
sudo zypper in git make zsh bc tmux pwgen
```
```console
chsh -s /bin/zsh
```
```console
zsh
```
```console
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
```console
mkdir ~/git
```
```console
cd ~/git
```
```console
git clone https://www.github.com/manto89/myconf
```
```console
cp ./myconf/.zshrc ~/
```
```console
cp -r ./myconf/.oh-my-zsh ~/
```
```console
vim ~/.zshrc
```
Edit .zshrc, substitute $USER with your user
```console
export ZSH=/home/$USER/.oh-my-zsh
```
Update zsh config
```console
source ~/.zshrc
```
Open Konsole and create a new *Profile* (Settings > Configure Konsole). Under command insert
```console
/bin/zsh -i -c "tmux attach-session -t $USER || tmux new-session -s $USER"
```
Save the profile and assign as default
#### Jetbrains
Download Rider, Pycharm, Idea. Then for each one extract in `/opt` and create link
```console
sudo tar xvf ~/Downloads/JetBrains.Rider-2021.2.tar.gz -C /opt
```
```console
sudo ln -s /opt/JetBrains\ Rider-2021.2/bin/rider.sh /opt/rider  
```
### Utilities
#### Claws Mail
```console
sudo zypper in claws-mail
```
#### AnyDesk
Follow instructions at http://rpm.anydesk.com/howto.html
```console
cat > AnyDesk-OpenSUSE.repo << "EOF" 
```
```console
[anydesk]
name=AnyDesk OpenSUSE - stable
baseurl=http://rpm.anydesk.com/opensuse/$basearch/
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY
EOF

```
```console
sudo zypper addrepo --repo AnyDesk-OpenSUSE.repo
```
Grab binaries from 
https://software.opensuse.org/download/package?package=pangox-compat&project=home%3Aberny%3Acamline
and 
https://software.opensuse.org/download/package?package=libpangox-1_0-0&project=home%3Aberny%3Acamline
and install manually
```console
sudo rpm -ivh ./pangox-compat-0.0.2-4.14.x86_64.rpm
sudo rpm -ivh ./libpangox-1_0-0-0.0.2-4.14.x86_64.rpm
```
Then install anydesk
```console
sudo zypper in anydesk
```
#### VirtualBox
```console
sudo zypper in virtualbox
```
```console
LatestVirtualBoxVersion=$(wget -qO - http://download.virtualbox.org/virtualbox/LATEST.TXT) && wget "http://download.virtualbox.org/virtualbox/${LatestVirtualBoxVersion}/Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack"
```
```console
sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack 
```
```console
foo@bar:~$ sudo apt install virtualbox virtualbox-guest-additions-iso
```
To uninstall
```console
foo@bar:~$ sudo VBoxManage extpack uninstall "Oracle VM VirtualBox Extension Pack"
```
### Debian
#### Sudo
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
#### Essentials 
```console
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install git curl zsh tree vim bc tmux
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh
zsh
git clone https://www.github.com/manto89/myconf
cp ./myconf/.zshrc ~/
cp -r ./myconf/.oh-my-zsh ~/
vim ~/.zshrc
```
Edit .zshrc, substitute $USER with your user
```
export ZSH=/home/$USER/.oh-my-zsh
```
Update zsh config
```console
source ~/.zshrc
```
#### Install i3wm
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
#### Change terminal emulator
```console
sudo update-alternatives --config x-terminal-emulator
```

#### AUTO MOUNT USB
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
#### Install VirtualBox
```console
foo@bar:~$ sudo apt install virtualbox virtualbox-guest-additions-iso
foo@bar:~$ LatestVirtualBoxVersion=$(wget -qO - http://download.virtualbox.org/virtualbox/LATEST.TXT) && wget "http://download.virtualbox.org/virtualbox/${LatestVirtualBoxVersion}/Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack"
foo@bar:~$ sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack 
```
To uninstall
```console
foo@bar:~$ sudo VBoxManage extpack uninstall "Oracle VM VirtualBox Extension Pack"
```
#### Install JetBrains Rider
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
