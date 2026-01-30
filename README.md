# Configurationss

## MacOS

### Essentials
HomeBrew
```console
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
Misc utilities
```console
brew install pwgen 7zip git ripgrep fd python tmux bc 
```
Oh-My-Zsh
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
Update zsh config
```console
source ~/.zshrc
```

### Development

#### Interpreters
```console
python -m ensurepip --upgrade
```

#### Doom Emacs
Install Emacs
```console
brew tap d12frosted/emacs-plus
```
``` console
brew install emacs-plus --with-native-comp
```
``` console
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app
```
Install Doom Emacs

```console
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
```
```console
~/.config/emacs/bin/doom install
```
Confirm that everything is working
```console
doom doctor
```
---
Open Emacs and enable some plugins (`SPC f P` > `init.el`):
* nerdtree
* csharp
* vterm
After changing the file, save it (`:w`) and reload the config (`SPC h r r`)

To always open the emacs window in full screen add the following to the `config.el` (`SPC f P` > `config.el`):

``` console
...
(add-hook 'window-setup-hook #'toggle-frame-maximized)
```
