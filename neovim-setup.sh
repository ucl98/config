#!/bin/bash

# Install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

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
sed -i "s|builtin.find_files({ cwd = \"~/Documents/obsidian/quickview\" })|builtin.find_files({ cwd = \"/workspace/notes\" })|" ~/.config/nvim/init.lua
curl https://raw.githubusercontent.com/ucl98/config/refs/heads/main/notes/shorcuts.md > /workspace/notes/shortcuts.md

