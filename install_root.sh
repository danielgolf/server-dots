#/usr/bin/bash

set -e

INSTALL_PATH="$HOME/server-dots"

# this script installs bla bla bla
echo "This script installs or updates a simple config for the root user."
echo -e "\n------------------------------------------------------\n"

# check if already cloned / installed
if [[ ! -d $INSTALL_PATH/.git ]] ; then
    echo "Please make sure you ran 'setup.sh'."
    exit 1
fi

sudo mkdir -p "/root/.config"
sudo cp -r "$INSTALL_PATH/.config/nvim" "/root/.config"
sudo cp -r "$INSTALL_PATH/.vim" "/root"
sudo cp "$INSTALL_PATH/.bash_aliases_root" "/root/.bash_aliases"
sudo cp "$INSTALL_PATH/.bashrc_root" "/root/.bashrc"
sudo cp "$INSTALL_PATH/.tmux.conf" "/root"

# install plug.vim to .local/share
sudo curl -fLo "/root/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

echo -e "\nDone!\n"
echo -e "------------------------------------------------------\n"

echo -e "\nPlease start neovim as root and run :PlugInstall once."
