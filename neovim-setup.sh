#!/bin/bash

# Install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# Update package list and install dependencies
apt-get update && apt-get install -y \
    clangd \
    ripgrep \
    && rm -rf /var/lib/apt/lists/*

# Add NodeSource repository for Node.js
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

# Install Node.js and npm packages
apt-get update && apt-get install -y nodejs
npm install -g npm@latest
npm install -g pyright

# Install LuaRocks
apt-get update && apt-get install -y luarocks
apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure debugging for Jupyter Notebook
echo "import os" > $HOME/.pdbrc
echo "import sys" >> $HOME/.pdbrc
echo "sys.path.append('/workspace/')" >> $HOME/.pdbrc
echo "with open('/workspace/debug_helper.py') as file: exec(file.read())" >> $HOME/.pdbrc
echo "alias save save_state(vars())" >> $HOME/.pdbrc

# Set PYTHONPATH environment variable
export PYTHONPATH=/workspace/:$PYTHONPATH

# Update PATH
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc

# Nvim configuration
mkdir -p /root/.config/nvim
curl -L https://github.com/ucl98/config/raw/main/nvim/init.lua -o /root/.config/nvim/init.lua

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Tmux configuration
git clone https://github.com/ucl98/config.git /tmp/config
cp -r /tmp/config/tmux /root/.config/tmux
rm -rf /tmp/config

# Add a note for shorcuts and reference the folder for nvim
curl https://raw.githubusercontent.com/ucl98/config/refs/heads/main/notes/shorcuts.md > /workspace/notes/shortcuts.md
echo TERM=xterm-256color >> ~/.bashrc

# for neovim linting/suggestions
pip3 install mypy
pip3 install ruff
pip3 install black
pip3 install debugpy

