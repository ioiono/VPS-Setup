#!/bin/sh
#
# This script should be run via curl:
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ioiono/VPS-Setup/master/src/init.sh)"
# or via wget:
#   sh -c "$(wget -qO- https://raw.githubusercontent.com/ioiono/VPS-Setup/master/src/init.sh)"
# or via fetch:
#   sh -c "$(fetch -o - https://raw.githubusercontent.com/ioiono/VPS-Setup/master/src/init.sh)"
#
# As an alternative, you can first download the install script and run it afterwards:
#   wget https://raw.githubusercontent.com/ioiono/VPS-Setup/master/src/init.sh -O install.sh
#   sh install.sh

set -e

GREEN='\033[0;32m'
NC='\033[0m' # No Color

timedatectl set-timezone Asia/Singapore

apt-get update && apt-get install -y \
    curl \
    git \
    zsh \
    wget \
    sudo \
    vim \
    net-tools \


# shellcheck disable=SC2059
printf "\n${GREEN}Installation done.${NC}\n\n"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s "$(which zsh)"


# change default zsh theme
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="crcandy"/' ~/.zshrc
sed -i 's/^plugins=.*/plugins=(git brew docker docker-compose zsh-syntax-highlighting zsh-autosuggestions zsh-completions)/' ~/.zshrc

# zsh plugins
# shellcheck disable=SC2086
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# shellcheck disable=SC2086
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# shellcheck disable=SC2086
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

{
echo "autoload -U compinit && compinit"
echo "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=\"fg=7\""
} >> ~/.zshrc

# start using zsh

zsh
