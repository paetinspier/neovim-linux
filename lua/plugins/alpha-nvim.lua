return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		-- 		dashboard.section.header.val = {
		-- 			[[                               __                ]],
		-- 			[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		-- 			[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		-- 			[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		-- 			[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		-- 			[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		-- 		}
		dashboard.section.header.val = {
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
			[[            ██████╗ ███████╗███╗   ██╗            ]],
			[[            ██╔══██╗██╔════╝████╗  ██║            ]],
			[[            ██████╔╝███████╗██╔██╗ ██║            ]],
			[[            ██╔═══╝ ╚════██║██║╚██╗██║            ]],
			[[            ██║     ███████║██║ ╚████║            ]],
			[[            ╚═╝     ╚══════╝╚═╝  ╚═══╝            ]],
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("e", "  Explore file", ":Explore<CR>"),
			dashboard.button("c", "  Config", ":cd " .. vim.fn.stdpath("config") .. " | :e init.lua<CR>"),
			dashboard.button("q", "󰅚  quit", ":qa<CR>"),
		}
		local handle = io.popen("fortune")
		local fortune = handle:read("*a")
		handle:close()
		dashboard.section.footer.val = fortune

		dashboard.config.opts.noautocmd = true

		vim.cmd([[autocmd User AlphaReady echo 'ready']])

		alpha.setup(dashboard.config)
	end,
}
