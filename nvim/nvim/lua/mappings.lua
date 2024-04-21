require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" }, { silent=true})
map("i", "jk", "<ESC>", { silent=true})
map("i", "kj", "<ESC>", { silent=true})

-- 
map("n", "<leader>fm", ':Telescope harpoon marks<CR>', { silent=true})
map("n", '<leader>fg', ':Telescope oldfiles<CR>', { silent=true})
map("n", '<leader>rr', ":UndotreeToggle<CR>", { silent=true})

-- Harpoon keybindings
map("n", '<C-q>', ":lua require('harpoon.ui').nav_prev()<CR>", { silent=true})
map("n", '<C-e>', ":lua require('harpoon.ui').nav_next()<CR>", { silent=true})
map("n", '<leader>mm', ":lua require('harpoon.mark').add_file()<CR>", { silent=true})
map("n", '<leader>ht', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent=true})

-- Number key bindings for harpoon files, adjusted the silent option
-- map("n", '1', ':lua require("harpoon.ui").nav_file(1)<CR>', { silent=true})
-- map("n", '2', ':lua require("harpoon.ui").nav_file(2)<CR>', { silent=true})
-- map("n", '3', ':lua require("harpoon.ui").nav_file(3)<CR>', { silent=true})
-- map("n", '4', ':lua require("harpoon.ui").nav_file(4)<CR>')
--
