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
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["<C-l>"] = actions.smart_send_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("emoji")
    -- telescope.load_extension('fzf')

    -- Import custom telescope plugins
    local custom_plugins = require("noobscience.custom.telescope-plugins")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>fe", "<cmd>Telescope emoji<cr>", { desc = "Find emoji" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>", { desc = "Select from register" })
    keymap.set("n", "<leader>gsw", custom_plugins.git_branch_picker, { desc = "Git branch picker" })
    keymap.set("n", "<leader>gr", custom_plugins.git_branch_picker_with_stash,
      { desc = "Git branch picker (stash-switch-pop)" })
  end,
}
