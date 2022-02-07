#!/usr/bin/env bash

# wichtigstes kommmando auf dem terminal - ls
if [[ -x /usr/bin/exa ]] ; then
    alias ll='exa -Hglam --git --color=auto --group-directories-first'
    alias lll='ll'
    alias llll='ll'
    alias tree='exa -Ta'
else
    alias ll='ls -lAh --color=auto --group-directories-first'
fi

# damit jeder alias auch als root funktioniert
[[ -x /usr/bin/doas ]] && alias doas='doas '
[[ -x /usr/bin/sudo ]] && alias sudo='sudo '

# orte
alias  ..='cd ../'
alias ...='cd ../../'
[[ -d ~/Repositories ]]          && alias repos='cd ~/Repositories'
[[ -d ~/Repositories/dotfiles ]] && alias dotf='cd ~/Repositories/dotfiles'

# shortcuts
[[ -x /usr/bin/ranger ]] && alias r='ranger'
[[ -x /usr/bin/nvim && -x /usr/bin/fzf ]] && alias vf='nvim $(fzf)'

# programme
alias rm='rm -I'
alias mv='mv -i'
[[ -x /usr/bin/fd ]]        && alias fd='fd -iIH'
[[ -x /usr/bin/pwgen ]]     && alias pwgen='pwgen -cns 14 1'
[[ -x /usr/bin/colordiff ]] && alias diff='colordiff'
if [[ -x /usr/bin/nvim ]] ; then
    alias vi='nvim'
    alias vim='nvim'
fi

# usb
if [[ -x /usr/bin/udisksctl ]] ; then
    alias usbmount='udisksctl mount -b'
    alias usbunmount='udisksctl unmount -b'
    alias usboff='udisksctl power-off -b'
fi
