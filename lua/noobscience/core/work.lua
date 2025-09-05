-- Work-related keymaps

-- Extract last word from cursor to end of line and search in codebase
vim.keymap.set("n", "<leader>mw", function()
	-- Move cursor to beginning of line first
	vim.cmd("normal! 0")

	-- Get current line content from cursor to end
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local text_till_end = string.sub(line, col + 1)

	-- Extract last word (split by space and take last element)
	local words = vim.split(text_till_end, "%s+", { trimempty = true })
	local last_word = words[#words] or ""
	last_word = "defmodule " .. last_word .. " do"

	-- If we have a word, search for it using telescope live_grep
	if last_word ~= "" then
		require("telescope.builtin").live_grep({ default_text = last_word })
	else
		print("No word found to search")
	end
end, { desc = "Search last word from cursor to end of line" })

-- Search current full word under cursor
vim.keymap.set("n", "<leader>fw", function()
	-- Get the current word under cursor
	local word = vim.fn.expand("<cword>")

	-- If we have a word, search for it using telescope live_grep
	if word ~= "" then
		require("telescope.builtin").live_grep({ default_text = word })
	else
		print("No word found to search")
	end
end, { desc = "Search current word under cursor" })

vim.keymap.set("n", "<leader>fj", function()
	require("telescope.builtin").find_files({ prompt_prefix = "v40/" })
end, { desc = "Search files starting with v40/" })

-- Search selected text in visual mode
vim.keymap.set("v", "<leader>f", function()
	-- Exit visual mode and get selected text
	vim.cmd('normal! "vy')
	local selected_text = vim.fn.getreg("v")

	-- Search using telescope live_grep
	if selected_text ~= "" then
		require("telescope.builtin").live_grep({ default_text = selected_text })
	else
		print("No text selected")
	end
end, { desc = "Search selected text" })
