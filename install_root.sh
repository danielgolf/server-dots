#/bin/bash -e

if [[ $EUID -ne 0 ]] ; then
    echo "Please run as root"
    exit 1
fi

INSTALL_PATH="/home/daniel/server-dots"

# this script installs bla bla bla
echo "This script installs or updates a simple config for the root user."
echo -e "\n------------------------------------------------------\n"

# check if already cloned / installed
if [[ ! -d $INSTALL_PATH/.git ]] ; then
    echo "Please make sure you ran 'setup.sh'."
    exit 1
fi

mkdir -p "/root/.config"
cp -r "$INSTALL_PATH/.config/nvim" "/root/.config"
cp -r "$INSTALL_PATH/.vim" "/root"
cp "$INSTALL_PATH/.bash_aliases_root" "/root/.bash_aliases"
cp "$INSTALL_PATH/.bash_functions" "/root/.bash_functions"
cp "$INSTALL_PATH/.bashrc" "/root/.bashrc"
cp "$INSTALL_PATH/.tmux.conf" "/root"

# install plug.vim to .local/share
curl -fLo "/root/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

echo -e "\nDone!\n"
echo -e "------------------------------------------------------\n"

if [[ -x /usr/bin/nvim ]] ; then
    nvim -c "PlugInstall" -c "quit" -c "quit" || exit 1
else
    echo "Please start neovim and run ':PlugInstall' once."
fi
echo "Please also run 'source ~/.bashrc'."
