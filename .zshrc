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
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export NVM_AUTO_USE=true

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
  history-substring-search
  z
  colored-man-pages
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
alias lg='lazygit'
alias t='tmux'
alias tl='tmux list-sessions'
alias ts='tmux new-session -s'
alias ta='tmux attach -t'
alias cls='clear && tmux clear-history'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /Users/meron/.docker/init-zsh.sh || true # Added by Docker Desktop
