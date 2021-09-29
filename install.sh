#/usr/bin/bash

set -e

INSTALL_PATH="$HOME/server-dots"

# this script installs bla bla bla
echo "This script installs or updates a simple server setup."
echo -e "\n------------------------------------------------------\n"

if [[ ! -x /usr/bin/git || ! -x /usr/bin/curl ]] ; then
    "Please make sure git and curl are installed."
    exit 1
fi

# if already cloned just pull, else clone
if [[ -d $INSTALL_PATH/.git ]] ; then
    cd "$INSTALL_PATH" && git pull
else
    git clone "https://github.com/danielgolf/server-dots.git" "$INSTALL_PATH"
fi


cp -r "$INSTALL_PATH/.config" "$HOME"

if [[ ! -f $HOME/.ssh/authorized_keys ]] ; then
    cp -r "$INSTALL_PATH/.ssh" "$HOME"
fi

cp -r "$INSTALL_PATH/.vim" "$HOME"
cp "$INSTALL_PATH/.bash_aliases" "$HOME"
cp "$INSTALL_PATH/.bash_functions" "$HOME"
cp "$INSTALL_PATH/.bashrc" "$HOME"

if [[ ! -f $HOME/.gitconfig ]] ; then
    cp "$INSTALL_PATH/.gitconfig" "$HOME"
fi

cp "$INSTALL_PATH/.tmux.conf" "$HOME"


# install pfetch to .local/bin
curl -fLo "$HOME/.local/bin/pfetch" --create-dirs \
    "https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch"
chmod 755 "$HOME/.local/bin/pfetch"

# install plug.vim to .local/share
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

echo -e "\nDone!\n"
echo -e "------------------------------------------------------\n"

echo "Please install the following package list:"
# missing packages: bat
echo "neovim fd-find htop colordiff fzf tmux ranger python3 python3-pip python3-virtualenv"

echo -e "\nPlease start neovim and run :PlugInstall once."
echo -e "Please also run 'source ~/.bashrc'.\n"

echo "Root configs can be setup with '~/server-dots/install_root.sh'."
