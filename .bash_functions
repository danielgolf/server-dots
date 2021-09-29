#!/usr/bin/env bash

#conda_init () {
#    __conda_setup="$('/home/daniel/.miniconda3/bin/conda' 'shell.zsh' 'hook')"
#    if [ $? -eq 0 ]; then
#        eval "$__conda_setup"
#    else
#        if [ -f "/home/daniel/.miniconda3/etc/profile.d/conda.sh" ]; then
#            . "/home/daniel/.miniconda3/etc/profile.d/conda.sh"
#        else
#            export PATH="/home/daniel/.miniconda3/bin:$PATH"
#        fi
#    fi
#    unset __conda_setup
#}

folder () {
    if [[ $# -gt 1 ]] ; then
        echo "Usage: $0 [path]"
        return 1
    fi

    if [[ $1 ]] ; then
        if [[ ! -d $1 ]] ; then
            echo " $1 is not a directory."
            return 1
        fi
        NAUTILUSPATH="$1"
    else
        NAUTILUSPATH="./"
    fi

    zsh -c "nautilus $NAUTILUSPATH > /dev/null 2>&1 &!"
}

pycl () {
    delcand=$(find ./ -regex '.*/\(__pycache__\|\.ipynb_checkpoints\)')
    if [ -z "$delcand" ] ; then
        echo "Nothing to clean up."
        return 0
    fi
    for dir in $delcand ; do
        echo "Wan't to remove" "$dir"
        rm -rI "$dir"
    done
}

texclean () {
    bash -c "rm -rf ./*.aux \
           ./.auctex-auto \
           ./*.fdb_latexmk  \
           ./*.fls \
           ./*.log \
           ./*.out \
           ./*.lof \
           ./*.bbl \
           ./*.bcf \
           ./*.blg \
           ./*.run.xml \
           ./*.toc \
           ./*.synctex.gz \
           ./*.bib.sav \
           ./*.bib.bak \
           ./*.lot \
           ./*.nav \
           ./*.snm \
           ./*.tdo \
           ./*.dvi \
           ./*.out.ps \
           ./*.xdv"
}
