# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

. /opt/asdf-vm/asdf.sh

source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  git
  sudo
  vi-mode
  history-substring-search
  z
  colored-man-pages
EOBUNDLES

antigen theme romkatv/powerlevel10k

antigen apply

export EDITOR='nvim'
export PATH=$HOME/bin:$PATH
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

alias vc="sudo protonvpn c -f"
alias vd="sudo protonvpn d"
alias myip="curl ipinfo.io/ip"
alias t="task"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
