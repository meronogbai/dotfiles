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
export PATH="${HOME}/bin:${HOME}/go/bin:${PATH}"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Save history to log files
# See https://www.justinjoyce.dev/save-your-shell-history-to-log-files/
preexec() {if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $ $3" >> ~/.logs/zsh-history-$(date "+%Y-%m-%d").log; fi}

# Version managers

# fnm
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"

# zinit - zsh plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

zinit snippet OMZL::directories.zsh  # directory aliases
zinit snippet OMZL::completion.zsh  # tab to highlight
zinit snippet OMZL::history.zsh  # shared history across sessions
zinit snippet OMZL::key-bindings.zsh  # terminal shortcuts like C-a and C-e
zinit snippet OMZL::functions.zsh  # adds take function
zinit snippet OMZL::git.zsh  # all the git goodies

zinit snippet OMZP::aws
zinit snippet OMZP::colored-man-pages
# wait for the sake of zsh vi mode
zinit ice lucid wait
zinit snippet OMZP::fzf
zinit snippet OMZP::git
zinit snippet OMZP::yarn
zinit snippet OMZP::z

# Load zsh vi mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
ZVM_SYSTEM_CLIPBOARD_ENABLED=true

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
zvm_bindkey vicmd '^R' redo

# Load direnv
zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' src"zhook.zsh"
zinit light direnv/direnv

# Load powerlevel10k theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

# Load Zsh completions
autoload -Uz compinit && compinit

# Load Bash-style completions
autoload -U +X bashcompinit && bashcompinit

# Load terraform completions
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Load all the completions
zinit cdreplay -q

# Custom Aliases
alias ls='lsd'
alias tree='lsd --tree'
alias up='brew update && brew upgrade && brew cleanup -s'
alias vim='nvim'
alias drs='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dco='docker compose'
alias lg='lazygit'
alias gt='git trim --no-confirm && git trim -d stray --no-confirm'
alias t='tmux'
alias tl='tmux list-sessions'
alias ts='tmux new-session'
alias ta='tmux attach'
alias tp='tmuxp load'
alias tf='terraform'
alias icat="kitten icat"

gdcp() {
  git --no-pager diff "$@" | pbcopy
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
