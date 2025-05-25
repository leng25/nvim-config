vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "


-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.filetype.add({
  extension = {
    ftl = "java",
  },
})

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "Format with LSP" })


-- increase tree width
vim.keymap.set('n', '+', ':vertical resize +5<CR>', { desc = "Widen nvim-tree" })

-- decrease tree width
vim.keymap.set('n', '-', ':vertical resize -5<CR>', { desc = "Shrink nvim-tree" })


require("nvim-tree").setup({
  view = {
    width = 60, -- change this to your desired width
    side = "left", -- or "right", if you like chaos
    number = false,
    relativenumber = false,
  },
})
