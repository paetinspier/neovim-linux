-- general
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.o.winborder = "rounded"

-- keymaps
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>e", ":Explore<CR>")
vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>")
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")


-- packages
vim.pack.add({
	{ src = "https://github.com/AlexvZyl/nordic.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/Saghen/blink.cmp", },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
})

-- theme
vim.cmd("colorscheme nordic")

-- lsp
vim.lsp.enable({ 'pyright' })
vim.lsp.enable({ 'lua_ls' })

-- mini pick
require('mini.pick').setup()

-- completions
require('blink.cmp').setup()

-- lualine
require('lualine').setup({
	options = {
		theme = 'tomorrow_night',
	},
})
