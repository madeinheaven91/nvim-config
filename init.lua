-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo(
  { { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
    true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

vim.cmd("colorscheme tokyonight-night")
vim.g.neovide_scale_factor = 0.8
-- git clone https://github.com/echevarriandre/mononoki-ligatures
vim.o.guifont = "Liga mononoki:h14"
vim.g.neovide_cursor_vfx_mode = "wireframe"

vim.api.nvim_set_keymap("n", "<leader>m", ":ASToggle<CR>", {})
vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

vim.keymap.set("t", "<c-r>", function()
  local next_char_code = vim.fn.getchar()
  local next_char = vim.fn.nr2char(next_char_code)
  return '<C-\\><C-N>"' .. next_char .. "pi"
end, { expr = true })

-- require("themery").setup {
  -- themes = { "gruvbox" }, -- Your list of installed colorschemes.
  -- livePreview = true, -- Apply theme while picking. Default to true.
-- }
