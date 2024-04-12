# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# If ~/.bashrc exists and does not export the PATH to Neovim, add it
if [ -f ~/.bashrc ]; then
    if ! grep -q 'export PATH="$PATH:/opt/nvim-linux64/bin"' ~/.bashrc; then
        echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc
    fi
fi

# Backup old init.vim if it exists
if [ -f ~/.config/nvim/init.vim ]; then
    mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak
fi

# Create the necessary directories
mkdir -p ~/.config/nvim

# Create a symbolic link to the init.vim file
ln -s init.vim ~/.config/nvim/init.vim

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Neovim plugins
# TODO: add the nvim plugins