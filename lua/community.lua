-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.vue" },
  -- { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.programming-language-support.web-tools-nvim" },

  -- { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.night-owl-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.media.vim-wakatime" },
  { import = "astrocommunity.media.presence-nvim" },
  { import = "astrocommunity.completion.codeium-vim" },

  -- { import = "astrocommunity.motion.mini-ai" },
  -- { import = "astrocommunity.motion.mini-surround" },

  -- { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
  -- { import = "astrocommunity.workflow.precognition-nvim" },
}
