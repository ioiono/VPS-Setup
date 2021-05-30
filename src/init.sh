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

timedatectl set-timezone Asia/Singapore

apt-get update && apt-get install -y \
    curl \
    git \
    zsh \
    wget \
    sudo \
    vim \

echo ""
echo "Installation done."
echo ""

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s "$(which zsh)"


# change default zsh theme
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="crcandy"/' ~/.zshrc
sed -i 's/^plugins=.*/plugins=(git docker docker-compose zsh-syntax-highlighting zsh-autosuggestions zsh-completions timer)/' ~/.zshrc

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
echo "export TIMER_PRECISION=2"
# shellcheck disable=SC2028
echo "export TIMER_FORMAT=\"\n\$fg[white]Time: %d\""
} >> ~/.zshrc

# start using zsh

zsh
