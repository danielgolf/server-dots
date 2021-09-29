#!/usr/bin/bash

# wichtigstes kommmando auf dem terminal - ls
if [[ -x /usr/bin/exa ]] ; then
    alias exa='exa -Hglam --git --color=auto --group-directories-first'
    alias ll='exa'
    alias tree='command exa -Ta'
else
    alias ll='ls -lAh --color=auto --group-directories-first'
fi

if [[ -x /usr/bin/sudo ]] ; then
    # damit jeder alias auch als root funktioniert
    alias sudo='sudo '
fi

# orte
alias ..='cd ../'
alias ...='cd ../../'
if [[ -d ~/Repositories ]] ; then alias repos='cd ~/Repositories' ; fi
if [[ -d ~/Repositories/dotfiles ]] ; then alias dotf='cd ~/Repositories/dotfiles' ; fi

# shortcuts
if [[ -x /usr/bin/ranger ]] ; then alias r='ranger' ; fi
if [[ -x /usr/bin/nvim && -x /usr/bin/fzf ]] ; then alias vf='nvim $(fzf)' ; fi

# programme
alias df='df -Th'
alias du='du -sh'
alias rm='rm -I'
alias mv='mv -i'
if [[ -x /usr/bin/bat ]] ; then alias cat='bat' ; fi
if [[ -x /usr/bin/htop ]] ; then alias top='htop' ; fi
if [[ -x /usr/bin/colordiff ]] ; then alias diff='colordiff' ; fi
if [[ -x /usr/bin/fdfind ]] ; then alias fd='fdfind -iH' ; fi
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
