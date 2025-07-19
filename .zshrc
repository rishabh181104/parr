if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Auto-start Sway on TTY1
if [[ -z $DISPLAY ]] && [[ -z $WAYLAND_DISPLAY ]] && [[ $(tty) =~ /dev/tty1 ]]; then
  # Start Sway instead of Hyprland for Kali Linux
  exec sway
fi

if [[ -o interactive ]]; then
  ssh-add ~/.ssh/id_rsa >/dev/null 2>&1
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::debian
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey -e
bindkey '^[p' history-search-backward
bindkey '^[n' history-search-forward

HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# # Ensure UTF-8 support
export LANG=en_IN.UTF-8
export LC_ALL=en_IN.UTF-8

# Default apps, terminal or programs
export EDITOR="nvim"

# Fix $TERM for tmux and truecolor support
if [[ -n "$TMUX" ]]; then
  export TERM="tmux-256color"  # Inside tmux
else
  export TERM="xterm-256color" # Outside tmux
fi

# Force 256-color mode (for consistent theming)
export COLORTERM="truecolor"

# ==========================================
#           BASIC ALIASES
# ==========================================
# File and directory operations
alias l='ls -CF'
alias clr='clear'
alias c='clear'
alias cls='clear'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias rmd='/bin/rm  --recursive --force --verbose '

# Navigation shortcuts
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias bd='cd "$OLDPWD"'

# ==========================================
#           EDITOR ALIASES
# ==========================================
# Neovim and editor shortcuts
alias vim='nvim'
alias n='nvim'
alias sn='sudo nvim'
alias nv='nvim'
alias nvi='nvim'
alias v='nvim'
alias vi='nvim'
alias svi='sudo vi'
alias vis='nvim "+set si"'

# ==========================================
#           TMUX ALIASES
# ==========================================
alias tns='tmux new -s'
alias ta='tmux attach'
alias td='tmux detach'

# ==========================================
#           SYSTEM ALIASES
# ==========================================
# System information and monitoring
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias h="history | grep "
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
alias find="fzf --preview='bat {}' --bind 'enter:execute(nvim {})'"
alias f="find . | grep "
alias checkcommand="type -t"
alias openports='netstat -nape --inet'

# System control
alias reboot='systemctl reboot'
alias logout='loginctl kill-session $XDG_SESSION_ID'
alias shutdown='sudo shutdown now'
alias restart-dm='sudo systemctl restart display-manager'

# ==========================================
#           PACKAGE MANAGEMENT
# ==========================================
# Kali Linux package management shortcuts
alias i='sudo apt install'
alias u='sudo apt update && sudo apt upgrade'
alias r='sudo apt remove'
alias remove-orphaned='sudo apt autoremove'
alias s='apt search'
alias aggressively-clear-cache='sudo apt autoclean && sudo apt clean'
alias clear-cache='sudo apt clean'
alias show='apt show'

# ==========================================
#           FILE OPERATIONS
# ==========================================
# Advanced file operations
alias ls='ls -aFh --color=always'
alias la='ls -Alh'
alias lx='ls -lXBh'
alias lk='ls -lSrh'
alias lc='ls -ltcrh'
alias lu='ls -lturh'
alias lr='ls -lRh'
alias lt='ls -ltrh'
alias lm='ls -alh |more'
alias lw='ls -xAh'
alias ll='ls -Fls'
alias labc='ls -lap'
alias lf="ls -l | egrep -v '^d'"
alias ldir="ls -l | egrep '^d'"
alias lla='ls -Al'
alias las='ls -A'
alias lls='ls -l'

# Disk and space management
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'
alias duf='duf -hide special'

# ==========================================
#           ARCHIVE OPERATIONS
# ==========================================
# Archive and compression
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# ==========================================
#           PERMISSIONS & SECURITY
# ==========================================
# File permissions
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Security and system
alias sha1='openssl sha1'
alias freshclam='sudo freshclam'

# ==========================================
#           DEVELOPMENT & TOOLS
# ==========================================
# Development tools
alias grep='grep --color=auto'
alias bright='brightnessctl set'
alias tty_kill_all="sudo pkill -t $(who | awk '$2 != "tty1" {print $2}' | sort -u | paste -sd,)"

# Video conversion
alias convert='ffmpeg -i $argv[1] -filter_complex "[0:v] fps=10,scale=320:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" $argv[2]'

# System monitoring
alias fetch='fastfetch'
alias macchina='$HOME/.cargo/bin/./macchina'

# ==========================================
#              GIT ALIASES
# ==========================================
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'

# ==========================================
#           UTILITY ALIASES
# ==========================================
# Various utilities
alias multitail='multitail --no-repeat -c'
alias clickpaste='sleep 3; xdotool type "$(xclip -o -selection clipboard)"'
alias kssh="kitty +kitten ssh"
alias smv='sudo mv'
alias scp='sudo cp'
alias web='cd /var/www/html'
alias ebrc='edit ~/.bashrc'
alias hlp='less ~/.bashrc_help'
alias da='date "+%Y-%m-%d %A %T %Z"'

# Entertainment
alias anime='~/.local/bin/ani-cli'

# Kali Linux specific aliases
alias kali-update='sudo apt update && sudo apt full-upgrade -y'
alias kali-install='sudo apt install'
alias kali-search='apt search'
alias kali-remove='sudo apt remove --purge'
alias kali-clean='sudo apt autoremove && sudo apt autoclean'
alias kali-list='apt list --installed'

# Fix Home/End keys in terminal
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# SSH Agent configuration
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)" >/dev/null 2>&1
  ssh-add ~/.ssh/id_rsa >/dev/null 2>&1
fi
