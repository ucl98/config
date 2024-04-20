require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

-- Harpoon keybindings
map("n", '<C-q>', ":lua require('harpoon.ui').nav_prev()<CR>")
map("n", '<C-e>', ":lua require('harpoon.ui').nav_next()<CR>")
map("n", '<leader>mm', ":lua require('harpoon.mark').add_file()<CR>")
map("n", '<leader>ht', ":lua require('harpoon.ui').toggle_quick_menu()<CR>")

-- Adjusting silent option for <leader>ff and <leader>fm mappings
map("n", "<leader>fm", ':Telescope harpoon marks<CR>')
map("n", '<leader>fg', ':Telescope oldfiles<CR>', {silent = false})

-- Number key bindings for harpoon files, adjusted the silent option
map("n", '1', ':lua require("harpoon.ui").nav_file(1)<CR>', {silent = false})
map("n", '2', ':lua require("harpoon.ui").nav_file(2)<CR>', {silent = false})
map("n", '3', ':lua require("harpoon.ui").nav_file(3)<CR>', {silent = false})
map("n", '4', ':lua require("harpoon.ui").nav_file(4)<CR>', {silent = false})

