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
export N_PREFIX="$HOME/.n"
export PATH="$N_PREFIX/bin:$PATH" # https://github.com/tj/n

# Enable Homebrew's completions
# See https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

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
  yarn
  fzf
EOBUNDLES

antigen theme romkatv/powerlevel10k

antigen apply

# Aliases
alias ls='lsd'
alias tree='lsd --tree'
alias t='tmux'
alias up='brew update && brew upgrade'
alias gdcp='git --no-pager diff | pbcopy'
alias gcnt='git --no-pager diff --stat'
alias gcntm='gcnt main'
alias vim='nvim'
alias drs='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker volume prune -f'
alias drp='docker system prune --all --volumes'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
