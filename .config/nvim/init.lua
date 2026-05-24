vim.g.mapleader = " "

vim.o.number = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.winborder = "rounded"


vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')


vim.pack.add({
				{src = "https://github.com/vague2k/vague.nvim"},
				{src = "https://github.com/stevearc/oil.nvim"},
				{src = "https://github.com/echasnovski/mini.pick"},
				--{src = "https://github.com/neovim/nvim-lspconfig"},
})

require "mini.pick".setup()
require "oil".setup()

--vim.lsp.enable({ "lua_ls" })
--vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set('n', '<leader>f', ':Pick files<CR>')

vim.cmd("colorscheme vague")
