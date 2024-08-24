
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# exa
alias lt="exa -T -L1 --icons"
alias lt2="exa -T -L2 --icons"
alias lt3="exa -T -L3 --icons"
alias le="exa --icons"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ---------------------- My Config ---------------------- #

# Gemini key
export GEMINI_API_KEY="AIzaSyBOqKD0j0p_VRS3RbWXl713HwgpS9hqfKI"
# Gemini Cli
export PATH=$PATH:"$HOME/go/bin"


# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# FzF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH=$PATH:~/.config/composer/vendor/bin

export PATH=$PATH:"$HOME/.local/bin"

export PATH=$PATH:/usr/local/bin

export PATH=$PATH:"$HOME/.local/bin"

# Ghi chú path
export gch="$HOME/Atd/GhiChu"
export cfg="$HOME/.config"

export DENO_INSTALL="/home/anhtuan/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export editor=hx
export VISUAL=hx

# Ibus Bamboo
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

# ---------------------- My Alias ---------------------- #

# Tạo thư mục mới và di chuyển vào thư mục vừa tạo
mdcd() {
    mkdir -p $1
    cd $1
}

# Chọn theme cho terminal
alias term-theme='bash -c "$(wget -qO- https://git.io/vQgMr)"'

# wezterm
alias wezc="hx ~/.config/wezterm/ hx ."

alias nvc="cd ~/.config/hx/ && hx ."
alias vgc="cd ~/Atd/GhiChu/ && hx ."
alias dev="cd ~/Dev/ && hx ."
alias brs="source ~/.bashrc"
alias brc="hx ~/.bashrc"

# Mysql
alias msr="sudo mysql -u root -p"

# file manager
alias lg="lazygit"
alias fm="yazi"
alias rfm="ranger"

# Git bash shell
alias gul="~/.upload-git.sh"
alias gc="git clone"

# quản lý độ sáng màn hình [shell]
alias dsm="~/.do-sang-md.sh"

# Trans-shell
alias dich-en="trans -shell -b vi:en"
alias dich="trans -shell -b :vi"

alias chat="gemini"

alias nxc="sudo hx /etc/nixos/configuration.nix"
alias hmc="hx ~/.config/home-manager/home.nix"
alias qtlc="hx ~/.config/qtile/config.py"

# ---- Cấu hình bash it ---- #
# export BASH_IT="/home/anhtuan/.bash_it"
# # location /.bash_it/themes/
# export BASH_IT_THEME='atd'
# export THEME_CLOCK_FORMAT='%H:%M -- %d:%m:%Y'
# export POWERLINE_PROMPT="clock user_info wd scm"
# export BASH_IT_DEVELOPMENT_BRANCH='main'
# export GIT_HOSTING='git@git.hoanhtuan-dev.com'
# # Don't check mail when opening terminal.
# unset MAILCHECK
# # Change this to your console based IRC client of choice.
# export IRC_CLIENT='irssi'
# # Set this to the command you use for todo.txt-cli
# export TODO="t"
# export SCM_CHECK=true
# # Load Bash It
# source "$BASH_IT"/bash_it.sh
# # alias cd=z

eval "$(zoxide init --cmd cd bash)"

# Màn hình chào mừng
echo ''
echo " 󰤔  Hôm nay làm việc tới đâu rồi nhỉ 󰱰 "
echo ''



