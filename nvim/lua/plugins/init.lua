return {
  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup({
        agents = {
            -- Disable ChatGPT 3.5
            {
              name = "ChatGPT3-5",
              chat = false,  -- just name would suffice
              command = false,   -- just name would suffice
            },
            {
              name = "ChatGPT4",
              chat = true,
              command = true,
              model = { model = "gpt-4-turbo-preview", temperature = 0.1, top_p = 1 },
              system_prompt = "You are assisting a seasoned programmer. Your answers are concise and you will not explain them."
           },
        },
      })
    end,
    lazy = false,
  },
  -- {
  --   
  -- },
  {
    "dccsillag/magma-nvim",
    lazy = false,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
  },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("chatgpt").setup({
  --       openai_params = {
  --         model = "gpt-4-turbo-preview",
  --         temperature = 0,
  --         max_tokens = 500,
  --       },
  --       chat = {
  --         keymaps = {
  --           new_session = "<C-d>",
  --         },
  --       },
  --    })
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "folke/trouble.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- },
 -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
