return {
	-- Just kidding
	vim.keymap.set("i", "jk", "<Esc>"),
	-- Yank to clip
	vim.keymap.set("v", "yyy", '"+y'),
	-- Ahoy !!!
	vim.keymap.set("n", "<leader>da", ":Anchor DropAnchor<CR>"),
	vim.keymap.set("n", "<leader>ra", ":Anchor RemoveAnchor<CR>"),
	vim.keymap.set("n", "<leader>pa", ":Anchor PullAnchor<CR>"),
	vim.keymap.set("n", "<leader>la", ":Anchor LocateAnchor<CR>"),
	-- Explore and conquer
	-- vim.keymap.set("n", "<leader>e", ":Explore<CR>"),
	-- Delete buffers
	vim.keymap.set("n", "<leader>bd", ":bd<CR>"),
	-- BuffAssNav
	vim.keymap.set("n", "<leader>bn", ":BufferNav OpenNav<CR>"),
}
