return {
  "lewis6991/gitsigns.nvim",
  -- wow! this actually works!
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('gitsigns').setup({
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end, { desc = "Next hunk" })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end, { desc = "Previous hunk" })

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "Stage hunk" })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "Reset hunk" })

        map('v', '<leader>hs', function()
          gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = "Stage hunk" })

        map('v', '<leader>hr', function()
          gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = "Reset hunk" })

        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = "Stage buffer" })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = "Reset buffer" })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "Preview hunk" })
        map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

        map('n', '<leader>hb', function()
          gitsigns.blame_line({ full = true })
        end, { desc = "Blame line" })

        map('n', '<leader>hd', gitsigns.diffthis, { desc = "Diff this" })

        map('n', '<leader>hD', function()
          gitsigns.diffthis('~')
        end, { desc = "Diff this ~" })

        map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = "Set qflist all" })
        map('n', '<leader>hq', gitsigns.setqflist, { desc = "Set qflist" })

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
        map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

        -- Text object
        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = "Select hunk" })
      end
    })
  end,
}
