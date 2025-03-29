-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==
  "pocco81/auto-save.nvim",
  "chrisdone-archive/hindent",
  "powerman/vim-plugin-ruscmd",
  {
    "mistweaverco/kulala.nvim",
    config = function()
      -- Setup is required, even if you don't pass any options
      require("kulala").setup()
    end,
  },

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  "VonHeikemen/fine-cmdline.nvim",
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  -- "zaldih/themery.nvim",
  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "▐▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▌",
        "▐                                         ▌",
        "▐     ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.     ▌",
        "▐    •█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪    ▌",
        "▐    ▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█·    ▌",
        "▐    ██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌    ▌",
        "▐    ▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀ ▀▀  █▪▀▀▀    ▌",
        "▐                                         ▌",
        "▐▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▌",
      }
      return opts
    end,
  },

  -- {
  --   "jellydn/hurl.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   ft = "hurl",
  --   opts = {
  --     -- Show debugging info
  --     debug = false,
  --     -- Show notification on run
  --     show_notification = false,
  --     -- Show response in popup or split
  --     mode = "popup",
  --     -- Default formatter
  --     formatters = {
  --       json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
  --       html = {
  --         "prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
  --         "--parser",
  --         "html",
  --       },
  --       xml = {
  --         "tidy", -- Make sure you have installed tidy in your system, e.g: brew install tidy-html5
  --         "-xml",
  --         "-i",
  --         "-q",
  --       },
  --     },
  --   },
  --   keys = {
  --     -- Run API request
  --     { "<leader>A", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
  --     { "<leader>a", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
  --     { "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
  --     { "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
  --     { "<leader>tv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
  --     -- Run Hurl request in visual mode
  --     { "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
  --   },
  -- },

  -- { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
