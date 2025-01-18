return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Define custom highlight group for modified files
		-- tokyonight colors
		-- -- #7dcfff (light blue)
		-- -- #ffc777 (yellow)
		-- -- #ff007c (pink)
		-- -- #c3e88d (green)
		-- -- #bb9af7 (purple)
		-- -- #ff757f (salmon)
		-- -- #4fd6be (blue/green idk)

		vim.api.nvim_set_hl(0, "LualineModifiedBlue", { fg = "#7dcfff", bold = true })
		vim.api.nvim_set_hl(0, "LualineModifiedYellow", { fg = "#ffc777", bold = true })
		vim.api.nvim_set_hl(0, "LualineModifiedPink", { fg = "#ff007c", bold = true })
		vim.api.nvim_set_hl(0, "LualineModifiedGreen", { fg = "#c3e88d", bold = true }) -- current
		vim.api.nvim_set_hl(0, "LualineModifiedPurple", { fg = "#bb9af7", bold = true })
		vim.api.nvim_set_hl(0, "LualineModifiedSalmon", { fg = "#ff757f", bold = true })
		vim.api.nvim_set_hl(0, "LualineModifiedBlueGreen", { fg = "#4fd6be", bold = true })

		local function custom_filename()
			local filename = vim.fn.expand("%:p") -- get the full path of the current file
			if filename == "" then
				return ""
			end -- no file open

			local modified_sign = "[+]" -- define your modified sign here
			local readonly_icon = " " -- icon for readonly file

			local hl_group = "Normal" -- default highlight group for filename
			if vim.bo.modified then
				hl_group = "LualineModifiedGreen" -- highlight if file is modified
				filename = filename .. modified_sign -- append modified sign
			end

			-- Check if file is readonly
			if vim.bo.readonly then
				filename = filename .. readonly_icon -- append readonly icon
			end

			-- Apply highlight group
			return "%#" .. hl_group .. "#" .. filename .. "%*" -- lualine uses special syntax for highlights
		end
		require("lualine").setup({
			options = {
				theme = "tokyonight-moon",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{
						custom_filename,
						file_status = true, -- displays file status (readonly status, modified status)
						path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
					},
				},
				lualine_x = { "filetype" },
				lualine_y = {},
				lualine_z = { "location" },
			},
		})
	end,
}
