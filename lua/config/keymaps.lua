-- Quick config editing
vim.keymap.set("n", "<leader>im", ":e $MYVIMRC<CR>", { desc = "Edit config" })
-- lazy.nvim can't re-source init.lua, so source just the file being edited
vim.keymap.set("n", "<leader>rl", "<cmd>source %<CR>", { desc = "Source current file" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Change cwd to current file's directory
vim.keymap.set("n", "<leader>q", function()
	vim.cmd("cd %:p:h")
	print("Changed cwd to " .. vim.fn.getcwd())
end, { desc = "CD to current file directory" })

-- Splits / terminal
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>tt", ":vsplit | terminal<CR>", { desc = "Open terminal in vsplit" })
-- Buffer-local so the Claude terminal keeps <Esc> (interrupt) and <C-j> (newline)
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function(args)
		local function tmap(lhs, rhs, desc)
			vim.keymap.set("t", lhs, rhs, { buffer = args.buf, desc = desc })
		end

		tmap("<C-n>", [[<C-\><C-n>]], "Exit terminal mode")
		tmap("<C-h>", [[<C-\><C-n><C-w>h]], "Move left window in terminal mode")
		tmap("<C-l>", [[<C-\><C-n><C-w>l]], "Move right window in terminal mode")

		if vim.api.nvim_buf_get_name(args.buf):match("claude") then
			return
		end

		tmap("<Esc>", [[<C-\><C-n>]], "Exit terminal mode")
		tmap("<C-j>", [[<C-\><C-n><C-w>j]], "Move down window in terminal mode")
		tmap("<C-k>", [[<C-\><C-n><C-w>k]], "Move up window in terminal mode")
	end,
})
-- Resize
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>tm", ":tabmove<CR>", { desc = "Move tab" })
vim.keymap.set("n", "<leader>t>", ":tabmove +1<CR>", { desc = "Move tab right" })
vim.keymap.set("n", "<leader>t<", ":tabmove -1<CR>", { desc = "Move tab left" })
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>t1", "1gt", { desc = "Go to tab 1" })
vim.keymap.set("n", "<leader>t2", "2gt", { desc = "Go to tab 2" })
vim.keymap.set("n", "<leader>t3", "3gt", { desc = "Go to tab 3" })
vim.keymap.set("n", "<leader>t4", "4gt", { desc = "Go to tab 4" })

local function open_file_in_tab()
	vim.ui.input({ prompt = "File to open in new tab: ", completion = "file" }, function(input)
		if input and input ~= "" then
			vim.cmd("tabnew " .. input)
		end
	end)
end

local function duplicate_tab()
	local current_file = vim.fn.expand("%:p")
	if current_file ~= "" then
		vim.cmd("tabnew " .. current_file)
	else
		vim.cmd("tabnew")
	end
end

local function close_tabs_right()
	local current_tab = vim.fn.tabpagenr()
	local last_tab = vim.fn.tabpagenr("$")

	for i = last_tab, current_tab + 1, -1 do
		vim.cmd(i .. "tabclose")
	end
end

local function close_tabs_left()
	local current_tab = vim.fn.tabpagenr()
	for _ = current_tab - 1, 1, -1 do
		vim.cmd("1tabclose")
	end
end

local function smart_close_buffer()
	local windows_in_tab = #vim.api.nvim_tabpage_list_wins(0)
	if windows_in_tab == 1 and vim.fn.tabpagenr("$") > 1 then
		vim.cmd("tabclose")
	else
		vim.cmd("bdelete")
	end
end

vim.keymap.set("n", "<leader>tO", open_file_in_tab, { desc = "Open file in new tab" })
vim.keymap.set("n", "<leader>td", duplicate_tab, { desc = "Duplicate current tab" })
vim.keymap.set("n", "<leader>tr", close_tabs_right, { desc = "Close tabs to the right" })
vim.keymap.set("n", "<leader>tL", close_tabs_left, { desc = "Close tabs to the left" })
vim.keymap.set("n", "<leader>bd", smart_close_buffer, { desc = "Smart close buffer/tab" })

-- flash keymaps --
vim.keymap.set("n", "s", function()
	require("flash").jump()
end)

-- fuzzy find --
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

-- git
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame line" })
vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next hunk" })
vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous hunk" })

-- claude code
vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
vim.keymap.set("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
vim.keymap.set("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume session" })
vim.keymap.set("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add buffer to Claude" })
vim.keymap.set("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send selection" })
vim.keymap.set("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
vim.keymap.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })
