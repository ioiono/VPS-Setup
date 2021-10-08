#!/bin/sh

# change default zsh theme
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="crcandy"/' ~/.zshrc
sed -i 's/^plugins=.*/plugins=(git brew docker docker-compose zsh-syntax-highlighting zsh-autosuggestions zsh-completions command-time)/' ~/.zshrc

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/popstas/zsh-command-time.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/command-time

{
  # todo: fzf fd

#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "export TZ=Asia/Singapore"
echo "[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh"
echo "autoload -U compinit && compinit"
echo "LS_COLORS=\$LS_COLORS:'tw=00;33:ow=01;33:'; export LS_COLORS"
echo "export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'"
echo 'export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"'
echo "ZSH_COMMAND_TIME_MIN_SECONDS=0"
echo 'ZSH_COMMAND_TIME_MSG="Execution time: %s"'
} >> ~/.zshrc
