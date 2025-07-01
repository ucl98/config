--[[

=====================================================================
==================== read this before continuing ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   kickstart.nvim   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

what is kickstart?

  kickstart.nvim is *not* a distribution.

  kickstart.nvim is a starting point for your own configuration.
    the goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    once you've done that, you can start exploring, configuring and tinkering to
    make neovim your own! that might mean leaving kickstart just the way it is for a while
    or immediately breaking it into modular pieces. it's up to you!

    if you don't know anything about lua, i recommend taking some time to read through
    a guide. one possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    after understanding a bit more about lua, you can use `:help lua-guide` as a
    reference for how neovim integrates lua.
    - :help lua-guide
    - (or html version): https://neovim.io/doc/user/lua-guide.html

kickstart guide:

  todo: the very first thing you should do is to run the command `:tutor` in neovim.

    if you don't know what this means, type the following:
      - <escape key>
      - :
      - tutor
      - <enter key>

    (if you already know the neovim basics, you can skip this step.)

  once you've completed that, you can continue working through **and reading** the rest
  of the kickstart init.lua.

  next, run and read `:help`.
    this will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    this should be the first place you go to look when you're stuck or confused
    with something. it's one of my favorite neovim features.

    most importantly, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  i have left several `:help x` comments throughout the init.lua
    these are hints about where to find more information about the relevant settings,
    plugins or neovim features used in kickstart.

   note: look for lines like this

    throughout the file. these are for you, the reader, to help you understand what is happening.
    feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your neovim config.

if you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

i hope you enjoy your neovim journey,
- tj

p.s. you can delete this when you're done too. it's your config now! :)
--]]

--   note: here starts the kickstart settings

-- diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "go to previous [d]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "go to next [d]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "show diagnostic [e]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "open diagnostic [q]uickfix list" })

-- set <space> as the leader key
-- see `:help mapleader`
--  note: must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set to true if you have a nerd font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ setting options ]]
-- see `:help vim.opt`
-- note: you can change these options as you wish!
--  for more options, you can see `:help option-list`

-- make line numbers default
vim.opt.number = true
-- you can also add relative line numbers, to help with jumping.
--  experiment for yourself to see if you like it!
vim.opt.relativenumber = false

-- enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- sync clipboard between os and neovim.
--  remove this option if you want your os clipboard to remain independent.
--  see `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- case-insensitive searching unless \c or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- decrease update time
vim.opt.updatetime = 250

-- decrease mapped sequence wait time
-- displays which-key popup sooner
vim.opt.timeoutlen = 300

-- configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- sets how neovim will display certain whitespace characters in the editor.
--  see `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- show which line your cursor is on
vim.opt.cursorline = true

-- minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ basic keymaps ]]
--  see `:help vim.keymap.set()`

-- set highlight on search, but clear on pressing <esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")
--
-- exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. otherwise, you normally need to press <c-\><c-n>, which
-- is not what someone will guess without a bit more experience.
--
-- note: this won't work in all terminal emulators/tmux/etc. try your own mapping
-- or just use <c-\><c-n> to exit terminal mode
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "exit terminal mode" })

-- tip: disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "use h to move!!"<cr>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "use l to move!!"<cr>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "use k to move!!"<cr>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "use j to move!!"<cr>')

-- keybinds to make split navigation easier.
--  use ctrl+<hjkl> to switch between windows
--
--  see `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<c-h>", "<c-w><c-h>", { desc = "move focus to the left window" })
vim.keymap.set("n", "<c-l>", "<c-w><c-l>", { desc = "move focus to the right window" })
vim.keymap.set("n", "<c-j>", "<c-w><c-j>", { desc = "move focus to the lower window" })
vim.keymap.set("n", "<c-k>", "<c-w><c-k>", { desc = "move focus to the upper window" })

-- [[ basic autocommands ]]
--  see `:help lua-guide-autocommands`

-- highlight when yanking (copying) text
--  try it with `yap` in normal mode
--  see `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("textyankpost", {
	desc = "highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ install `lazy.nvim` plugin manager ]]
--    see `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ configure and install plugins ]]
--
--  to check the current status of your plugins, run
--    :lazy
--
--  you can press `?` in this menu for help. use `:q` to close the window
--
--  to update plugins you can run
--    :lazy update
--
-- note: here is where you install your plugins.
require("lazy").setup({

	{
		"voldikss/vim-floaterm",
		lazy = false,
	},

	{
		"jpalardy/vim-slime",
		lazy = false,
		config = function()
			vim.g.slime_target = "tmux"
			vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
			vim.g.slime_bracketed_paste = 1
			vim.g.slime_dont_ask_default = 1
			vim.api.nvim_set_keymap("n", "<C-v><C-v>", "<Plug>SlimeLineSend", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "<C-c><C-c>", "<Plug>SlimeParagraphSend", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "<C-c><C-v>", "<Plug>SlimeSendCell", { noremap = false, silent = true })

			vim.g.slime_cell_delimiter = "```"
		end,
	},

	{
		"nvim-neotest/nvim-nio",
		lazy = false,
	},

	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_mode = 0
		end,
	},

	{
		"tpope/vim-fugitive",
		lazy = false,
	},

	{
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		ft = { "python" },
		opts = function()
			local null_ls = require("null-ls")
			return {
				sources = {
					null_ls.builtins.diagnostics.mypy,
					null_ls.builtins.diagnostics.ruff,
				},
			}
		end,
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("nvim-dap-virtual-text").setup({
				enabled = true,
				enabled_commands = true,
				highlight_changed_variables = true,
				highlight_new_as_changed = false,
				show_stop_reason = true,
				commented = false,
				only_first_definition = true,
				all_references = true,
				filter_references_pattern = "<module",
				virt_text_pos = "eol",
				all_frames = true,
				virt_lines = false,
				virt_text_win_col = nil,
			})
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup({
				layouts = {
					{
						elements = {
							"repl",
						},
						size = 80,
						position = "right",
					},
					{
						elements = {
							{ id = "scopes", size = 0.5 },
							{ id = "watches", size = 0.5 },
						},
						size = 80,
						position = "right",
					},
				},
			})

			local function toggle_repl()
				dapui.toggle({ layout = 1 })
			end

			local function close_ui()
				dapui.close()
			end

			local function toggle_variables_and_watches()
				dapui.toggle({ layout = 2 })
			end

			vim.keymap.set("n", "<leader>8", toggle_repl, { desc = "Toggle DAP REPL" })
			vim.keymap.set("n", "<leader>9", toggle_variables_and_watches, { desc = "Toggle Variables and Watches" })
			vim.keymap.set("n", "<leader>0", close_ui, { desc = "Close DAP UI" })

			dap.listeners.after.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.after.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	{
		"mfussenegger/nvim-dap",
	},

	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			local path = "/usr/bin/python3" -- use the global python interpreter
			require("dap-python").setup(path)
			local dap_ok, dap = pcall(require, "dap")
			if dap_ok then
				dap.adapters.python = {
					type = "executable",
					command = path,
					args = { "-m", "debugpy.adapter" },
				}
			end
		end,
	},

	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		-- event = {
		-- 	"BufReadPre " .. vim.fn.expand("~") .. "/obsidian/notes/*.md",
		-- 	"BufNewFile " .. vim.fn.expand("~") .. "/obsidian/notes/*.md",
		-- },
		cmd = {
			"ObsidianTags",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "notes",
					path = "~/obsidian/notes",
				},
				{
					name = "sketches",
					path = "~/obsidian/sketches",
				},
			},
			ui = {
				enable = false,
			},
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	{
		"mbbill/undotree",
		lazy = false,
	},

	-- note: plugins can be added with a link (or for a github repo: 'owner/repo' link).
	"tpope/vim-sleuth", -- detect tabstop and shiftwidth automatically

	-- note: plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- use `opts = {}` to force a plugin to be loaded.
	--
	--  this is equivalent to:
	--    require('comment').setup({})

	-- "gc" to comment visual regions/lines
	{ "numtostr/comment.nvim", opts = {} },

	-- here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`. this is equivalent to the following lua:
	--    require('gitsigns').setup({ ... })
	--
	-- see `:help gitsigns` to understand what the configuration keys do
	{ -- adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- note: plugins can also be configured to run lua code when they are loaded.
	--
	-- this is often very useful to both group configuration, as well as handle
	-- lazy loading plugins that don't need to be loaded immediately at startup.
	--
	-- for example, in the following configuration, we use:
	--  event = 'vimenter'
	--
	-- which loads which-key before all the ui elements are loaded. events can be
	-- normal autocommands events (`:help autocmd-events`).
	--
	-- then, because we use the `config` key, the configuration only runs
	-- after the plugin has been loaded:
	--  config = function() ... end

	{ -- useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "vimenter", -- sets the loading event to 'vimenter'
		config = function() -- this is the function that runs, after loading
			require("which-key").setup()

			-- document existing key chains
			require("which-key").add({
				{ "<leader>c", group = "[c]ode" },
				{ "<leader>d", group = "[d]ocument" },
				{ "<leader>r", group = "[r]ename" },
				{ "<leader>s", group = "[s]earch" },
				{ "<leader>w", group = "[w]orkspace" },
				{ "<leader>t", group = "[t]oggle" },
				{ "<leader>h", group = "git [h]unk", mode = { "n", "v" } },
			})
		end,
	},

	-- note: plugins can specify dependencies.
	--
	-- the dependencies are proper plugin specifications as well - anything
	-- you do for a plugin at the top level, you can do for a dependency.
	--
	-- use the `dependencies` key to specify the dependencies of a particular plugin

	{ -- fuzzy finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "vimenter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- if encountering errors, see telescope-fzf-native readme for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- this is only run then, not every time neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- useful for getting pretty icons, but requires a nerd font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! it's more than just a "file finder", it can search
			-- many different aspects of neovim, your workspace, lsp, and more!
			--
			-- the easiest way to use telescope, is to start by doing something like:
			--  :telescope help_tags
			--
			-- after running this command, a window will open up and you're able to
			-- type in the prompt window. you'll see a list of `help_tags` options and
			-- a corresponding preview of the help.
			--
			-- two important keymaps to use while in telescope are:
			--  - insert mode: <c-/>
			--  - normal mode: ?
			--
			-- this opens a window that shows you all of the keymaps for the current
			-- telescope picker. this is really useful to discover what telescope can
			-- do as well as how to actually do it!

			-- [[ configure telescope ]]
			-- see `:help telescope` and `:help telescope.setup()`
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "TelescopeResults",
				callback = function(ctx)
					vim.api.nvim_buf_call(ctx.buf, function()
						vim.fn.matchadd("TelescopeParent", "\t\t.*$")
						vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
					end)
				end,
			})

			local function filenameFirst(_, path)
				local tail = vim.fs.basename(path)
				local parent = vim.fs.dirname(path)
				if parent == "." then
					return tail
				end
				return string.format("%s\t\t%s", tail, parent)
			end

			require("telescope").setup({
				-- you can put your default mappings / updates / etc. in here
				--  all the info you're looking for is in `:help telescope.setup()`
				--
				-- defaults = {
				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--   },
				-- },
				pickers = {
					oldfiles = {
						cwd_only = true,
						path_display = filenameFirst,
					},
					find_files = {
						path_display = filenameFirst,
					},
					buffers = {
						path_display = filenameFirst,
					},
				},
				defaults = {
					mappings = {
						n = {
							["q"] = require("telescope.actions").close,
						},
					},
					file_ignore_patterns = { "%.png", "%.mov", "%.gif", "%.pdf", "%.html", "%.pkl", "%.pt", "%.ipynb" },

					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							results_position = "bottom",
							preview_width = 0.7,
							results_width = 0.3,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- enable telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- local utils = require("telescope.utils")
			--
			-- ["<leader>ff"] = { function() builtin.find_files({ cwd = utils.buffer_dir() }) end,
			--       desc = "find files in cwd" }

			-- see `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[s]earch [h]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[s]earch [k]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[s]earch [f]iles" })
			-- vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[s]earch [s]elect telescope" })
			vim.keymap.set("n", "<leader>ss", function()
				require("telescope.builtin").lsp_document_symbols({
					symbols = { "class", "function", "method" },
				})
			end, { desc = "[s]earch [s]elect document symbols" })
			vim.keymap.set("n", "<leader>sw", function()
				builtin.grep_string({
					search_dirs = { ".", vim.fn.expand("~/obsidian/notes") },
				})
			end, { desc = "[s]earch current [w]ord" })
			vim.keymap.set("n", "<leader>sg", function()
				builtin.live_grep({
					search_dirs = { ".", vim.fn.expand("~/obsidian/notes") },
				})
			end, { desc = "[s]earch by [g]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[s]earch [d]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[s]earch [r]esume" })
			-- vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[s]earch recent files ("." for repeat)' })
			vim.keymap.set("n", "<leader>se", builtin.oldfiles, { desc = '[s]earch recent files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] find existing buffers" })
			-- slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>/", function()
				-- you can pass additional configuration to telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] fuzzily search in current buffer" })

			-- it's also possible to pass additional configuration options.
			--  see `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "live grep in open files",
				})
			end, { desc = "[s]earch [/] in open files" })

			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({
					cwd = "~/obsidian/notes",
					file_ignore_patterns = { " %- index.md$", "^index%.md$" },
					hidden = false,
					no_ignore = false,
					search_file = "*.md",
				})
			end, { desc = "[s]earch [n]otes files" })

			-- Search local notes - optimized for obsidian notes only
			vim.keymap.set("n", "<leader>sl", function()
				builtin.live_grep({
					cwd = vim.fn.expand("~/obsidian/notes"),
					prompt_title = "Search Notes",
					file_ignore_patterns = { " %- index.md$", "^index%.md$" },
					hidden = false,
					no_ignore = false,
					case_mode = "ignore_case",
					additional_args = function()
						return { "--type=md" }
					end,
				})
			end, { desc = "[s]earch [l]ocal notes" })
		end,
	},

	{ -- lsp configuration & plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- automatically install lsps and related tools to stdpath for neovim
			{ "williamboman/mason.nvim", config = true }, -- note: must be loaded before dependants
			"williamboman/mason-lspconfig.nvim",
			"whoissethdaniel/mason-tool-installer.nvim",

			-- useful status updates for lsp.
			-- note: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- `neodev` configures lua lsp for your neovim config, runtime and plugins
			-- used for completion, annotations and signatures of neovim apis
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			-- brief aside: **what is lsp?**
			--
			-- lsp is an initialism you've probably heard, but might not understand what it is.
			--
			-- lsp stands for language server protocol. it's a protocol that helps editors
			-- and language tooling communicate in a standardized fashion.
			--
			-- in general, you have a "server" which is some tool built to understand a particular
			-- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). these language servers
			-- (sometimes called lsp servers, but that's kind of like atm machine) are standalone
			-- processes that communicate with some "client" - in this case, neovim!
			--
			-- lsp provides neovim with features like:
			--  - go to definition
			--  - find references
			--  - autocompletion
			--  - symbol search
			--  - and more!
			--
			-- thus, language servers are external tools that must be installed separately from
			-- neovim. this is where `mason` and related plugins come into play.
			--
			-- if you're wondering about lsp vs treesitter, you can check out the wonderfully
			-- and elegantly composed help section, `:help lsp-vs-treesitter`

			--  this function gets run when an lsp attaches to a particular buffer.
			--    that is to say, every time a new file is opened that is associated with
			--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
			--    function will be executed to configure the current buffer
			vim.api.nvim_create_autocmd("lspattach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- note: remember that lua is a real programming language, and as such it is possible
					-- to define small helper and utility functions so you don't have to repeat yourself.
					--
					-- in this case, we create a function that lets us more easily define mappings specific
					-- for lsp related items. it sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "lsp: " .. desc })
					end

					-- jump to the definition of the word under your cursor.
					--  this is where a variable was first declared, or where a function is defined, etc.
					--  to jump back, press <c-t>.
					map("gd", require("telescope.builtin").lsp_definitions, "[g]oto [d]efinition")

					-- find references for the word under your cursor.
					map("gr", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")

					-- jump to the implementation of the word under your cursor.
					--  useful when your language has ways of declaring types without an actual implementation.
					map("gi", require("telescope.builtin").lsp_implementations, "[g]oto [i]mplementation")

					-- jump to the type of the word under your cursor.
					--  useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>d", require("telescope.builtin").lsp_type_definitions, "type [d]efinition")

					-- fuzzy find all the symbols in your current document.
					--  symbols are things like variables, functions, types, etc.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")

					-- fuzzy find all the symbols in your current workspace.
					--  similar to document symbols, except searches over your entire project.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[w]orkspace [s]ymbols"
					)

					-- rename the variable under your cursor.
					--  most language servers support renaming across files, etc.
					map("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")

					-- execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your lsp for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")

					-- opens a popup that displays documentation about the word under your cursor
					--  see `:help k` for why this keymap.
					-- map("k", vim.lsp.buf.hover, "hover documentation")

					-- warn: this is not goto definition, this is goto declaration.
					--  for example, in c this would take you to the header.
					map("gd", vim.lsp.buf.declaration, "[g]oto [d]eclaration")

					-- the following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    see `:help cursorhold` for information about when this is executed
					--
					-- when you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documenthighlightprovider then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "cursorhold", "cursorholdi" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "cursormoved", "cursormovedi" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("lspdetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- the following autocommand is used to enable inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- this may be unwanted, since they displace some of your code
					if client and client.server_capabilities.inlayhintprovider and vim.lsp.inlay_hint then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, "[t]oggle inlay [h]ints")
					end
				end,
			})

			-- lsp servers and clients are able to communicate to each other what features they support.
			--  by default, neovim doesn't support everything that is in the lsp specification.
			--  when you add nvim-cmp, luasnip, etc. neovim now has *more* capabilities.
			--  so, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- enable the following language servers
			--  feel free to add/remove any lsps that you want here. they will automatically be installed.
			--
			--  add any additional override configuration in the following tables. available keys are:
			--  - cmd (table): override the default command used to start the server
			--  - filetypes (table): override the default list of associated filetypes for the server
			--  - capabilities (table): override fields in capabilities. can be used to disable certain lsp features.
			--  - settings (table): override the default settings passed when initializing the server.
			--        for example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
			local servers = {
				clangd = {},
				-- gopls = {},
				pyright = {
					capabilities = capabilities,
					filtyes = { "python" },
				},
				-- rust_analyzer = {},
				-- ... etc. see `:help lspconfig-all` for a list of all the pre-configured lsps
				--
				-- some languages (like typescript) have entire language plugins that can be useful:
				--    https://github.com/pmizio/typescript-tools.nvim
				--
				-- but for many setups, the lsp (`tsserver`) will work just fine
				-- tsserver = {},
				--

				lua_ls = {
					-- cmd = {...},
					-- filetypes = { ...},
					-- capabilities = {},
					settings = {
						lua = {
							completion = {
								callsnippet = "replace",
							},
							-- you can toggle below to ignore lua_ls's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}

			-- ensure the servers and tools above are installed
			--  to check the current status of installed tools and/or manually install
			--  other tools, you can run
			--    :mason
			--
			--  you can press `g?` for help in this menu.
			require("mason").setup()

			-- you can add other tools here that you want mason to install
			-- for you, so that they are available from within neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- used to format lua code
				"mypy",
				"ruff",
				-- "black",
				"debugpy",
				"pyright",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- this handles overriding only values explicitly passed
						-- by the server configuration above. useful when disabling
						-- certain features of an lsp (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{ -- autoformat
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[f]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. you can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
			},
			formatters = {
				ruff_format = {
					args = { "--line-length=2000" },
				},
			},
		},
	},

	{ -- autocompletion
		"hrsh7th/nvim-cmp",
		event = "insertenter",
		dependencies = {
			-- snippet engine & its associated nvim-cmp source
			{
				"l3mon4d3/luasnip",
				build = (function()
					-- build step is needed for regex support in snippets.
					-- this step is not supported in many windows environments.
					-- remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    see the readme about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
			},
			"saadparwaiz1/cmp_luasnip",

			-- adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. they are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			-- see `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- for an understanding of why these mappings were
				-- chosen, you will need to read `:help ins-completion`
				--
				-- no, but seriously. please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
					-- select the [n]ext item
					["<c-n>"] = cmp.mapping.select_next_item(),
					-- select the [p]revious item
					["<c-p>"] = cmp.mapping.select_prev_item(),

					-- scroll the documentation window [b]ack / [f]orward
					["<c-b>"] = cmp.mapping.scroll_docs(-4),
					["<c-f>"] = cmp.mapping.scroll_docs(4),

					-- accept ([y]es) the completion.
					--  this will auto-import if your lsp supports it.
					--  this will expand snippets if the lsp sent a snippet.
					["<c-y>"] = cmp.mapping.confirm({ select = true }),

					-- if you prefer more traditional completion keymaps,
					-- you can uncomment the following lines
					--['<cr>'] = cmp.mapping.confirm { select = true },
					--['<tab>'] = cmp.mapping.select_next_item(),
					--['<s-tab>'] = cmp.mapping.select_prev_item(),

					-- manually trigger a completion from nvim-cmp.
					--  generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					["<c-space>"] = cmp.mapping.complete({}),

					-- think of <c-l> as moving to the right of your snippet expansion.
					--  so if you have a snippet that's like:
					--  function $name($args)
					--    $body
					--  end
					--
					-- <c-l> will move you to the right of each of the expansion locations.
					-- <c-h> is similar, except moving you backwards.
					["<c-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<c-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),

					-- for more advanced luasnip keymaps (e.g. selecting choice nodes, expansion) see:
					--    https://github.com/l3mon4d3/luasnip?tab=readme-ov-file#keymaps
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},

	{ -- you can easily change to a different colorscheme.
		-- change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- if you want to see what colorschemes are already installed, you can use `:telescope colorscheme`.
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins.
		init = function()
			-- load the colorscheme here.
			-- like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("tokyonight-night")

			-- you can configure highlights by doing something like:
			vim.cmd.hi("comment gui=none")
		end,
	},

	-- highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "vimenter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- better around/inside textobjects
			--
			-- examples:
			--  - va)  - [v]isually select [a]round [)]paren
			--  - yinq - [y]ank [i]nside [n]ext [']quote
			--  - ci'  - [c]hange [i]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [s]urround [a]dd [i]nner [w]ord [)]paren
			-- - sd'   - [s]urround [d]elete [']quotes
			-- - sr)'  - [s]urround [r]eplace [)] [']
			-- require("mini.surround").setup()

			-- simple and easy statusline.
			--  you could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- disable icons to remove ghost icon
			statusline.setup({ use_icons = false })

			-- you can configure sections in the statusline by overriding their
			-- default behavior. for example, here we set the section for
			-- cursor location to line:column
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- show folder name instead of file icon
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_filename = function()
				local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				local filename = "%t%m%r"
				return string.format("[%s] %s", cwd, filename)
			end

			-- ... and there is more!
			--  check out: https://github.com/echasnovski/mini.nvim
		end,
	},
	{ -- highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
			-- autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				-- some languages depend on vim's regex highlighting system (such as ruby) for indent rules.
				--  if you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			-- [[ configure treesitter ]] see `:help nvim-treesitter`

			-- prefer git instead of curl in order to improve connectivity in some environments
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)

			-- there are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. you should go explore a few and see what interests you:
			--
			--    - incremental selection: included, see `:help nvim-treesitter-incremental-selection-mod`
			--    - show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},

	-- the following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
	-- init.lua. if you want these files, they are in the repository, so you can just download them and
	-- place them in the correct locations.

	-- note: next step on your neovim journey: add/configure additional plugins for kickstart
	--
	--  here are some example plugins that i've included in the kickstart repository.
	--  uncomment any of the lines below to enable them (you will need to restart nvim).
	--
	-- require 'kickstart.plugins.debug',
	-- require 'kickstart.plugins.indent_line',
	-- require 'kickstart.plugins.lint',
	-- require 'kickstart.plugins.autopairs',
	-- require 'kickstart.plugins.neo-tree',
	-- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

	-- note: the import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    this is the easiest way to modularize your config.
	--
	--  uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	--    for additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
	-- { import = 'custom.plugins' },
}, {
	ui = {
		-- if you are using a nerd font: set icons to an empty table which will use the
		-- default lazy.nvim defined nerd font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- keybindings
local map_keys = vim.keymap.set

map_keys("n", "<leader>rr", ":UndotreeToggle<CR>")
-- map_keys("n", "<leader>mo", ':lua require("codewindow").toggle_minimap()<CR>')

map_keys("n", "<C-f>", ":FloatermToggle<CR>")
map_keys("n", "<leader>fe", ":FloatermNew<CR>")
map_keys("n", "<leader>fx", ":FloatermKill<CR>")
map_keys("n", "<leader>fp", ":lua create_float_window()<CR>", { noremap = true, silent = true })
map_keys("t", "<C-f>", "<C-\\><C-n>:FloatermToggle<CR>")

_G.float_buf = nil
_G.float_win = nil
_G.float_win_visible = false

-- Function to create or toggle the float window
_G.create_float_window = function()
	if _G.float_win_visible then
		-- Check if the window still exists
		local win_valid = vim.api.nvim_win_is_valid(_G.float_win)
		if win_valid then
			-- Hide the window if it's visible and valid
			vim.api.nvim_win_close(_G.float_win, true)
			_G.float_win_visible = false
		else
			-- Window no longer exists, reset the state
			_G.float_win_visible = false
		end
	else
		-- Create or show the window if it's not visible
		if _G.float_buf == nil or not vim.api.nvim_buf_is_valid(_G.float_buf) then
			_G.float_buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_set_option(_G.float_buf, "filetype", "python")
		end

		local width = vim.o.columns
		local height = vim.o.lines

		local win_height = math.ceil(height * 0.9 - 4)
		local win_width = math.ceil(width * 0.9 - 4)

		local row = math.ceil((height - win_height) / 2 - 1)
		local col = math.ceil((width - win_width) / 2)

		local opts = {
			relative = "editor",
			width = win_width,
			height = win_height,
			row = row,
			col = col,
			style = "minimal",
			border = "rounded",
		}

		_G.float_win = vim.api.nvim_open_win(_G.float_buf, true, opts)

		vim.wo[_G.float_win].winblend = 0
		vim.wo[_G.float_win].winhl = "Normal:Normal"

		_G.float_win_visible = true

		-- Set up an autocmd to update the state when the window is closed
		vim.api.nvim_create_autocmd({ "WinClosed" }, {
			callback = function(ev)
				if tonumber(ev.match) == _G.float_win then
					_G.float_win_visible = false
					_G.float_win = nil
				end
			end,
		})
	end
end

map_keys("n", "-", ":Oil<CR>")
map_keys("n", "<leader>nn", ":NvimTreeToggle<CR>")

map_keys("n", "[c", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
map_keys("n", "]c", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })

map_keys("n", "<leader>q", ":bprevious<cr>")
map_keys("n", "<leader>e", ":bnext<cr>")
map_keys("n", "<leader>bd", ":bd!<cr>")

map_keys("i", "kj", "<esc>")
map_keys("i", "jk", "<esc>")

map_keys("n", "<leader>tt", function()
	vim.g.transparency = not vim.g.transparency
	if vim.g.transparency then
		vim.api.nvim_set_hl(0, "normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "normalfloat", { bg = "none" })
	else
		vim.cmd("colorscheme " .. vim.g.colors_name)
	end
end, { desc = "toggle transparency" })

-- Obsidian integration
function OpenObsidianSection()
	local file_path = vim.api.nvim_buf_get_name(0)
	local line_number = vim.api.nvim_win_get_cursor(0)[1]
	local vault_name = "obsidian"
	local relative_path = file_path:match("^.+/obsidian/(.+)$")
	local encoded_path = relative_path:gsub("/", "%%2F")
	local command = string.format("obsidian://open?vault=%s&file=%s", vault_name, encoded_path, line_number)
	vim.fn.jobstart({ "open", "-g", command })
end

-- Mappings
vim.keymap.set("n", "<leader>os", OpenObsidianSection, { desc = "Open in Obsidian" })

-- map_keys("n", "=", ":bd!<cr>", { noremap = true, silent = true })
map_keys("n", "<leader>=", ":lua require'dapui'.eval(nil, {enter = true})<cr>", { noremap = true, silent = true })
map_keys("n", "<leader>-", ":lua require'dap'.run_to_cursor()<cr>", { noremap = true, silent = true })
map_keys("n", "<leader>1", ":lua require'dap'.continue()<cr>", { noremap = true, silent = true })
map_keys("n", "<leader>2", ":lua require'dap'.step_over()<cr>", { noremap = true, silent = true })
map_keys("n", "<leader>3", ":lua require'dap'.step_into()<cr>", { noremap = true, silent = true })
map_keys("n", "<leader>5", ":lua require'dap'.restart()<cr>", { noremap = true, silent = true })
map_keys("n", "<leader>6", ":lua require'dap'.terminate()<cr>", { noremap = true, silent = true })
map_keys("n", "<leader>`", ":lua require'dap'.toggle_breakpoint()<cr>", { noremap = true, silent = true })

map_keys("n", "<leader>ut", ":lua require'dapui'.toggle()<cr>", { noremap = true, silent = true })

map_keys("n", "<leader>q", ":bprevious<cr>")
map_keys("n", "<leader>e", ":bnext<cr>")

local harpoon = require("harpoon")
map_keys("n", "<leader>ha", function()
	harpoon:list():add()
end)
map_keys("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
map_keys("n", "<C-1>", function()
	harpoon:list():select(1)
end)
map_keys("n", "<C-2>", function()
	harpoon:list():select(2)
end)
map_keys("n", "<C-3>", function()
	harpoon:list():select(3)
end)
map_keys("n", "<C-4>", function()
	harpoon:list():select(4)
end)

map_keys("n", "<C-e>", function()
	harpoon:list():prev()
end)
map_keys("n", "<C-q>", function()
	harpoon:list():next()
end)

vim.api.nvim_set_keymap("n", "<leader>st", ":ObsidianTags<CR>", { noremap = true, silent = true })

vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}

-- vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- the line beneath this is called `modeline`. see `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

vim.cmd([[
  let @s = "iimport dill\<cr>all_vars = globals().copy()\<cr>all_vars.update(locals())\<cr>with open('/program_state.pkl', 'wb') as f: dill.dump(all_vars, f)\<cr>"
]])
