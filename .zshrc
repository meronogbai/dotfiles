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
# required for undercurl support
export TERM="xterm-kitty"

# Save history to log files
# See https://www.justinjoyce.dev/save-your-shell-history-to-log-files/
preexec() {if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $ $3" >> ~/.logs/zsh-history-$(date "+%Y-%m-%d").log; fi}

# Version managers
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Enable zsh completions
# See https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
FPATH="$(brew --prefix)/share/zsh/site-functions:${HOME}/.zfunc:${FPATH}"

# Antigen
source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
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
alias drs='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dco='docker compose'
alias lg='lazygit'
alias gt='git trim --no-confirm && git trim -d stray --no-confirm'
alias t='tmux'
alias tl='tmux list-sessions'
alias ts='tmux new-session -s'
alias ta='tmux attach -t'
alias tp='tmuxp load'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
