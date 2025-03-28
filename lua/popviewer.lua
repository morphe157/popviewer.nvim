local M = {}

function M.setup(opts)
	opts = opts or {}
	M.width = opts.width or 70
	M.height = opts.height or 20
	M.row = opts.row or 5
	M.col = opts.col or 100
	M.default_keymaps = opts.default_keymaps or true

	if M.default_keymaps then
		M.register_default_keymaps()
	end
end

function M.toggle_window()
	-- If window is already open, close it
	if M.window_id and vim.api.nvim_win_is_valid(M.window_id) then
		vim.api.nvim_win_hide(M.window_id)
		M.window_id = nil
		return
	end

	local buf
	-- Get saved buffer if any
	if M.buf and vim.api.nvim_buf_is_valid(M.buf) then
		buf = M.buf
	else
		buf = vim.api.nvim_get_current_buf()
	end

	-- Open window
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = M.width,
		height = M.height,
		row = M.row,
		col = M.col,
		style = "minimal",
		border = "rounded",
	})

	-- Save window and buffer
	M.window_id = win
	M.buf = buf
end

function M.clear_window()
	M.buf = nil
	if M.window_id and vim.api.nvim_win_is_valid(M.window_id) then
		vim.api.nvim_win_hide(M.window_id)
		M.window_id = nil
	end
end

function M.register_default_keymaps()
	vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua require('popviewer').toggle_window()<cr>",
		{ noremap = true, silent = true, desc = "[Popviewer] Toggle popout view" })
	vim.api.nvim_set_keymap("n", "<leader>x", "<cmd>lua require('popviewer').clear_window()<cr>",
		{ noremap = true, silent = true, desc = "[Popviewer] Reset popout window" })
end

return M
