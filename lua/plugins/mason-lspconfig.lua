return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure = {
					"lua_ls",
					"ts_ls",
					"pylsp",
					"rust_analyzer",
					"clangd",
					"tailwindcss",
					"gopls",
					"html",
					"java_language_server",
					"markdown_oxide",
					"typescript_language_server",
					"cssls",
					"sqls",
					"pyright",
					"ruby_lsp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local csslsCapabilities = vim.lsp.protocol.make_client_capabilities()
			csslsCapabilities.textDocument.completion.completionItem.snippetSupport = true

			local lspconfig = require("lspconfig")
			--Enable (broadcasting) snippet capability for completion
			--local capabilities = vim.lsp.protocol.make_client_capabilities()
			--capabilities.textDocument.completion.completionItem.snippetSupport = true
			-- LSPs
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.pylsp.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				filetypes = {
					"html",
					"erb",
					"eruby",
					"html.erb",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"jsx",
					"tsx",
				},
				init_options = {
					userLanguages = {
						eruby = "html",
						erb = "html",
					},
				},
				settings = {
					tailwindCSS = {
						includeLanguages = {
							eruby = "html",
							erb = "html",
						},
						experimental = {
							classRegex = {
								'class\\s*=\\s*"([^"]*)', -- matches: class="..."
								"class\\s*=\\s*'([^']*)", -- matches: class='...'
							},
						},
					},
				},
			})

			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.java_language_server.setup({ capabilities = capabilities })
			lspconfig.markdown_oxide.setup({
				vim.tbl_deep_extend("force", capabilities, {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				}),
			})
			lspconfig.typescript_language_server.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = csslsCapabilities })
			lspconfig.sqls.setup({})
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,
				cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
			})

			-- keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
