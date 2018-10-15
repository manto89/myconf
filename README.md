#AUTO MOUNT USB
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
