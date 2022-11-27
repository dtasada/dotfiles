### SETTING UP CROSS-DISTRO PACKAGE MANAGING ###

command_exists () {
	type "$1" &> /dev/null ;
}

if command_exists pacman ; then
	alias s='sudo pacman -S'
	alias ss='pacman -Ss'
	alias syu='sudo pacman -Syyu'
	alias rns='sudo pacman -Rns'
	alias ys='yay -S'
	alias yss='yay -Ss'
fi

if command_exists nala ; then
	alias s='sudo nala install'
	alias ss='nala search'
	alias syu='sudo nala update'
	alias rns='sudo nala remove'
fi

if command_exists dnf ; then
	alias s='sudo dnf install'
	alias ss='dnf search'
	alias syu='sudo dnf update'
	alias rns='sudo dnf remove'
fi

### SETTING UP BASE PROGRAMS ###

apt update && apt upgrade
apt install nala
syu
s zsh make vim exa ranger rclone alacritty firefox

### SETTING UP ZSH CONFIG ###

mkdir -p ~/.config/shell mkdir ~/git/ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv .oh-my-zsh/ .config/shell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/dylanaraps/pfetch ~/git/
make install ~/git/pfetch/
zsh

### COPYING CONFIG FILES TO HOMEDIR ###

cp .gitpush.sh ~/
cp .p10k.zsh ~/
cp .vimrc ~/
cp .zshrc ~/
cp startup.sh ~/
cp -r .vim ~/
cp -r .config/* ~/.config/

### INSTALLING BREW ###

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /home/dt/.zprofile
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/dt/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
