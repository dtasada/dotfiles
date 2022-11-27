apt update && apt update
apt install zsh make vim exa ranger rclone alacritty firefox nala
pacman -Syyu
pacman install zsh make vim exa ranger rclone alacritty firefox 
dnf update
dnf install zsh make vim exa ranger rclone alacritty firefox 

mkdir -p ~/.config/shell
mkdir ~/git/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv .oh-my-zsh/ .config/shell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/dylanaraps/pfetch ~/git/

cp .gitpush.sh ~/
cp .p10k.zsh ~/
cp .vimrc ~/
cp .zshrc ~/
cp startup.sh ~/
cp -r .vim ~/
cp -r .config/* ~/.config/
