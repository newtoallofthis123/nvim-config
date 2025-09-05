return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			theme = "ivy",
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
				find_files = {
					theme = 'ivy'
				},
				buffers = {
					theme = 'ivy'
				},
				live_grep = {
					theme = 'ivy',
					find_command = "rg,--ignore,--hidden,--files prompt_prefix=🔍",
				},
			},

			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
			defaults = {
				path_display = { "truncate " },
				preview = {
					filesize_limit = 0.1,
					mime_hook = function(filepath, bufnr, opts)
						local is_image = function(filepath)
							local image_extensions = { "png", "jpg" } -- Supported image formats
							local split_path = vim.split(filepath:lower(), ".", { plain = true })
							local extension = split_path[#split_path]
							return vim.tbl_contains(image_extensions, extension)
						end
						if is_image(filepath) then
							local term = vim.api.nvim_open_term(bufnr, {})
							local function send_output(_, data, _)
								for _, d in ipairs(data) do
									vim.api.nvim_chan_send(term, d .. "\r\n")
								end
							end
							vim.fn.jobstart({
								"kitty",
								"+kitten",
								"icat",
								filepath, -- Terminal image viewer command
							}, { on_stdout = send_output, stdout_buffered = true, pty = true })
						else
							require("telescope.previewers.utils").set_preview_message(
								bufnr,
								opts.winid,
								"Binary cannot be previewed"
							)
						end
					end,
				},
				-- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-l>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("emoji")
		-- telescope.load_extension('fzf')

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fl", "<cmd>Telescope frecency<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>e", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fe", "<cmd>Telescope emoji<cr>", { desc = "Find emoji" })
		keymap.set("n", "<leader>xi", "<cmd>TodoTelescope<cr>", { desc = "Todo Telescope" })
		keymap.set(
			"n",
			"<leader>fo",
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			{ desc = "Work space signals" }
		)
		keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>", { desc = "Select from register" })
	end,
}
