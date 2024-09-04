source ~/.dotfiles/bashrc.sh


# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

shopt -s histappend
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s checkjobs

alias vimdiff='nvim -d'

if [[ ! -v BASH_COMPLETION_VERSINFO ]]; then
  . "/nix/store/zl1b8sh880fxdcy02vrw0bnrl1zq7499-bash-completion-2.14.0/etc/profile.d/bash_completion.sh"
fi

if [[ :$SHELLOPTS: =~ :(vi|emacs): ]]; then
  eval "$(/nix/store/8dmq6m0cynss73m9hrbxapzn1bbbkmj9-fzf-0.54.3/bin/fzf --bash)"
fi

source "$(fzf-share)/completion.bash";
source "$(fzf-share)/key-bindings.bash";


