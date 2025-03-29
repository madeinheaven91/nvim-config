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

vim.o.termguicolors = true
vim.cmd "colorscheme rose-pine"
-- git clone https://github.com/echevarriandre/mononoki-ligatures

-- vim.g.codeium_no_map_tab = true
-- vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>(codeium-accept)", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>m", ":ASToggle<CR>", {})
vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("t", "<c-r>", function()
  local next_char_code = vim.fn.getchar()
  local next_char = vim.fn.nr2char(next_char_code)
  return '<C-\\><C-N>"' .. next_char .. "pi"
end, { expr = true })

-- require("themery").setup {
-- themes = { "gruvbox" }, -- Your list of installed colorschemes.
-- livePreview = true, -- Apply theme while picking. Default to true.
-- }
