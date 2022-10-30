# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Homebrew's completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Antigen
source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  git
  sudo
  history-substring-search
  z
  colored-man-pages
  tmux
  docker
EOBUNDLES

antigen theme romkatv/powerlevel10k

antigen apply

# Environment variables
export N_PREFIX="$HOME/.n"
export PATH="$HOME/.n/bin:$PATH"
export PATH="$PATH:$(yarn global bin)"
export EDITOR="nvim"

# Aliases
alias ls='exa --icons'
alias y='yarn'
alias t='tmux'
alias up='brew update && brew upgrade'
alias gdcp='git --no-pager diff | pbcopy'
alias gcnt='git --no-pager diff --stat'
alias gcntm='gcnt main'
alias vim='nvim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
