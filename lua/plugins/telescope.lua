return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			-- 1) basic setup, enable hidden files in find_files
			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["q"] = require("telescope.actions").close,
						},
					},
				},
				pickers = {
					find_files = {
						-- show dotfiles
						hidden = true,
						-- if you also want to ignore .gitignore you'd add:
						no_ignore = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			-- 2) load your extension
			require("telescope").load_extension("ui-select")

			-- 3) your keymaps
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({ hidden = true })
			end, { desc = "Telescope find files (including hidden)" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},
}
