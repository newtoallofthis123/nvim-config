return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Derived from Eviline config for lualine
    -- Author: shadmansaleh
    -- Credit: glepnir
    local lualine = require('lualine')

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = 'auto', -- Automatically use colors from the current colorscheme
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left {
      -- mode component
      function()
        local thunder = '󱐋'
        local mode = vim.fn.mode();
        if mode == 'n' then
          return thunder .. ' NOR'
        elseif mode == 'i' then
          return thunder .. ' INS'
        elseif mode == 'v' or mode == 'V' or mode == '' then
          return thunder .. ' VIS'
        elseif mode == 'c' then
          return thunder .. ' CMD'
        elseif mode == 't' then
          return thunder .. ' TER'
        elseif mode == 'R' or mode == 'Rv' then
          return thunder .. ' REP'
        else
          return thunder .. ' ' .. mode
        end
      end,
      padding = { right = 2, left = 2, top = 2, bottom = 2 },
    }

    ins_left {
      'filename',
      cond = conditions.buffer_not_empty,
    }

    ins_left { 'location' }

    ins_left {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = { error = ' ', warn = ' ', info = ' ' },
    }

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left {
      function()
        return '%='
      end,
    }

    ins_left {
      -- Lsp server name .
      function()
        local msg = '||'
        local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end

        if buf_ft == 'elixir' then
          return '  ElixirLS'
        end
        local lsp = '  ';
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            -- append to lsp
            lsp = lsp .. client.name .. ', '
          end
        end
        msg = lsp.sub(lsp, 1, #lsp - 2)
        return msg
      end,
    }

    ins_right {
      'branch',
      icon = '',
    }

    ins_right {
      'diff',
      symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
      cond = conditions.hide_in_width,
    }

    -- Now don't forget to initialize lualine
    lualine.setup(config)

    -- Make statusline background transparent
    vim.api.nvim_set_hl(0, 'lualine_c_normal', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'lualine_c_insert', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'lualine_c_visual', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'lualine_c_replace', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'lualine_c_command', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'lualine_c_terminal', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'lualine_c_inactive', { bg = 'NONE' })
  end,
  -- enabled = false
}
