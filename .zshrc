# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Environment variables
export EDITOR='nvim'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export PATH="${HOME}/bin:${PATH}"

# Enable zsh completions
# See https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
FPATH="$(brew --prefix)/share/zsh/site-functions:${HOME}/.zfunc:${FPATH}"

# Antigen
source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  lukechilds/zsh-nvm
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  git
  sudo
  history-substring-search
  z
  colored-man-pages
  tmux
  yarn
  fzf
EOBUNDLES

antigen theme romkatv/powerlevel10k

antigen apply

# Aliases
alias ls='lsd'
alias tree='lsd --tree'
alias up='brew update && brew upgrade'
alias gdcp='git --no-pager diff | pbcopy'
alias vim='nvim'
alias drs='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker volume prune -f'
alias drp='docker system prune --all --volumes'
alias dco='docker-compose'
alias isodate='date -u +%FT%T%z'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /Users/meron/.docker/init-zsh.sh || true # Added by Docker Desktop
