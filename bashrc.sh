#!bin/bash
case $- in
  *i*) ;;
    *) return;;
esac

export LANG=en_US.UTF-8

# Nvidia
# export __NV_PRIME_RENDER_OFFLOAD=1
# export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
# export __GLX_VENDOR_LIBRARY_NAME=nvidia
# export __VK_LAYER_NV_optimus=NVIDIA_only
# exec "$@"

export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT_STYLE_OVERRIDE=kvantum

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

eval "$(zoxide init --cmd cd bash)"

export GEMINI_API_KEY="AIzaSyBOqKD0j0p_VRS3RbWXl713HwgpS9hqfKI"

export PATH=$PATH:~/.config/composer/vendor/bin
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/.config/helix/runtime"
export PATH=$PATH:"$HOME/.cargo/bin"

export qutebrowser=$PATH:"$HOME/.dotfiles/scripts/open_url_in_instance.sh"

export HYPRSHOT_DIR="~/Pictures/chupManHinh"

alias cfg="cd ~/.config"

myEditor="hx"

# file manager
alias lg="lazygit"
alias fm="yazi"
alias rfm="ranger"

alias brs="source ~/.bashrc"
alias brc="$myEditor ~/.dotfiles/bashrc.sh"

alias dsm="bash ~/.dotfiles/scripts/lightCtl.sh"

# su dung pulseaudio
alias vlu="pactl set-sink-volume @DEFAULT_SINK@ +5%"
alias vld="pactl set-sink-volume @DEFAULT_SINK@ -5%"

# Su dung light
alias ligu="sudo light -A 10"
alias ligd="sudo light -U 10"

# Eza to ls
alias le="eza --icons"
alias ls="eza --icons"

alias nxc="sudo hx /etc/nixos/configuration.nix"
alias hmc="cd ~/.config/home-manager && hx ."

alias wmhc="cd ~/.dotfiles/hypr && hx ."
alias wmic="cd ~/.dotfiles/i3/ && hx ."
alias wmsc="cd ~/.dotfiles/sway/ && hx ."
alias wbc="cd ~/.dotfiles/waybar/ && hx ."

alias dich-en="trans -shell -b vi:en"
alias dich="trans -shell -b :vi"

alias fm="yazi"

alias chat.prompt="~/go/bin/gemini-cli prompt"
alias chat="~/go/bin/gemini-cli chat"

# Git
alias gul="bash ~/.dotfiles/scripts/git-upload.sh"

# Màn hình chào mừng
echo ''
echo " 󰤔  Hôm nay làm việc tới đâu rồi nhỉ 󰱰 "
echo ''
