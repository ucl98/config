require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

-- Telescope keybindings
map("n", "<leader>fm", ':Telescope harpoon marks<CR>')
map("n", '<leader>fg', ':Telescope oldfiles<CR>', {silent = false})
map("n", "<leader>fd", ':Telescope live_grep<CR>')

-- Undotree keybindings
map("n", '<leader>rr', ":UndotreeToggle<CR>")

-- Harpoon keybindings
map("n", '<C-q>', ":lua require('harpoon.ui').nav_prev()<CR>")
map("n", '<C-e>', ":lua require('harpoon.ui').nav_next()<CR>")
map("n", '<leader>mm', ":lua require('harpoon.mark').add_file()<CR>")
map("n", '<leader>ht', ":lua require('harpoon.ui').toggle_quick_menu()<CR>")

-- ChatGPT
map("n", '<C-g><C-t>', ":GpChatToggle popup<CR>")
map("n", '<C-g><C-r>', ":GpChatNew popup<CR>")

-- Transparent-Background
map("n", '<leader>tt', ':lua require("base46").toggle_transparency()<CR>')

-- Number key bindings for harpoon files, adjusted the silent option
map("n", '<C-1>', ':lua require("harpoon.ui").nav_file(1)<CR>')
map("n", '<C-2>', ':lua require("harpoon.ui").nav_file(2)<CR>')
map("n", '<C-3>', ':lua require("harpoon.ui").nav_file(3)<CR>')

