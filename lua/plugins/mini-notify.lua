return {
	{
		"echasnovski/mini.notify",
		version = false,
		config = function()
			local mini_notify = require("mini.notify")
			mini_notify.setup({})

			-- make_notify() returns a vim-notify-compatible function,
			-- which you can use as both notify and notify_once:
			local wrapped = mini_notify.make_notify()
			vim.notify = wrapped
			vim.notify_once = wrapped

			-- sanity check
			vim.notify("mini.notify up and running!", vim.log.levels.WARN)
		end,
	},
}
