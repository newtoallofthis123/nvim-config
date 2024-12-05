return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Derived from Eviline config for lualine
        -- Author: shadmansaleh
        -- Credit: glepnir
        local lualine = require('lualine')

        -- Color table for highlights
        -- stylua: ignore
        -- Gruvbox
        local colors = {
            bg       = nil,       -- Muted dark gray for background
            fg       = '#ebdbb2', -- Soft beige for foreground
            yellow   = '#d79921', -- Muted yellow
            cyan     = '#689d6a', -- Vintage teal green
            darkblue = '#458588', -- Muted deep blue
            green    = '#98971a', -- Olive green
            orange   = '#d65d0e', -- Rustic orange
            violet   = '#b16286', -- Muted violet
            magenta  = '#d3869b', -- Soft magenta
            blue     = '#83a598', -- Vintage blue
            red      = '#e0241d', -- Brick red
        }

        -- local colors = {
        --     bg       = nil, -- White for background
        --     fg       = '#24292e', -- Dark gray for foreground (default text)
        --     yellow   = '#f4c542', -- Bright yellow
        --     cyan     = '#1b7c83', -- Cyan-blue
        --     darkblue = '#0969da', -- Deep blue
        --     green    = '#2ea043', -- Green (used for success)
        --     orange   = '#f0883e', -- Vibrant orange
        --     violet   = '#8257e5', -- Purple-violet
        --     magenta  = '#cf222e', -- Light magenta-pink
        --     blue     = '#0969da', -- Standard blue
        --     red      = '#cf222e', -- Bright red (used for errors)
        -- }

        -- Rosepine dawn
        -- local colors = {
        --     bg       = nil,       -- Muted soft beige for background
        --     fg       = '#575279', -- Muted lavender for foreground
        --     yellow   = '#907aa9', -- Dusty mauve
        --     cyan     = '#286983', -- Muted teal
        --     darkblue = '#9ccfd8', -- Light aqua blue
        --     green    = '#56949f', -- Gentle sea green
        --     orange   = '#ea9d34', -- Soft amber
        --     violet   = '#b4637a', -- Dusky pink
        --     magenta  = '#d7827e', -- Muted coral
        --     blue     = '#286983', -- Deep teal
        --     red      = '#eb6f92', -- Rose red
        -- }

        -- local colors = {
        --     bg       = nil, -- Background (soft dark background, typically transparent)
        --     fg       = '#e0def4', -- Soft, off-white for the foreground text
        --     yellow   = '#f6c177', -- Warm amber yellow
        --     cyan     = '#9ccfd8', -- Muted cyan
        --     darkblue = '#31748f', -- Deep teal blue
        --     green    = '#a3be8c', -- Gentle sage green
        --     orange   = '#ebbcba', -- Muted peachy orange
        --     violet   = '#c4a7e7', -- Subtle lavender violet
        --     magenta  = '#e5e9f0', -- Soft, muted pinkish magenta
        --     blue     = '#3e8fb0', -- Muted sky blue
        --     red      = '#eb6f92', -- Rose red
        -- }

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
                theme = {
                    -- We are going to use lualine_c an lualine_x as left and
                    -- right section. Both are highlighted by c theme .  So we
                    -- are just setting default looks o statusline
                    normal = { c = { fg = colors.fg, bg = colors.bg } },
                    inactive = { c = { fg = colors.fg, bg = colors.bg } },
                },
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
            function()
                return ''
            end,
            color = { fg = colors.blue },                           -- Sets highlighting of component
            padding = { left = 2, right = 2, top = 2, bottom = 2 }, -- We don't need space before this
        }

        ins_left {
            -- mode component
            function()
                return 'NOOB'
            end,
            color = function()
                -- auto change color according to neovims mode
                local mode_color = {
                    n = colors.red,
                    i = colors.green,
                    v = colors.blue,
                    [''] = colors.blue,
                    V = colors.blue,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.orange,
                    S = colors.orange,
                    [''] = colors.orange,
                    ic = colors.yellow,
                    R = colors.violet,
                    Rv = colors.violet,
                    cv = colors.red,
                    ce = colors.red,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ['r?'] = colors.cyan,
                    ['!'] = colors.red,
                    t = colors.red,
                }
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { right = 2, left = 2, top = 2, bottom = 2 },
        }

        ins_left {
            -- filesize component
            'filesize',
            cond = conditions.buffer_not_empty,
        }

        ins_left {
            'filename',
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta, gui = 'bold' },
        }

        ins_left { 'location' }

        ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

        ins_left {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.cyan },
            },
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
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            -- icon = '  LSP:',
            color = { fg = '#f0f0f0' },
        }

        -- Add components to right sections
        ins_right {
            'o:encoding',       -- option component same as &encoding in viml
            fmt = string.upper, -- I'm not sure why it's upper case either ;)
            cond = conditions.hide_in_width,
            color = { fg = colors.green, gui = 'bold' },
        }

        ins_right {
            'fileformat',
            fmt = string.upper,
            icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
            color = { fg = colors.green, gui = 'bold' },
        }

        ins_right {
            'branch',
            icon = '',
            color = { fg = colors.violet, gui = 'bold' },
        }

        ins_right {
            'diff',
            -- Is it me or the symbol for modified us really weird
            symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        }

        ins_right {
            function()
                return ''
            end,
            color = { fg = colors.blue },
            padding = { left = 1 },
        }

        -- Now don't forget to initialize lualine
        lualine.setup(config)
    end
}
