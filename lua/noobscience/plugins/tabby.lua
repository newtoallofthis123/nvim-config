return {
  'nanozuki/tabby.nvim',
  event = 'VimEnter',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local theme = {
      fill = 'TabLineFill',
      head = { fg = '#e0def4', bg = '#1a1a1a' },
      current_tab = { fg = '#1a1a1a', bg = '#31748f' },
      tab = { fg = '#e0def4', bg = '#1a1a1a', style = 'italic' },
      win = { fg = '#1a1a1a', bg = '#8aadf4', style = 'italic' },
      tail = { fg = '#e0def4', bg = '#1a1a1a', style = 'italic' },
    }

    require('tabby.tabline').set(function(line)
      return {
        {
          { ' Noob ', hl = theme.head },
          line.sep('', theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            line.sep('', hl, theme.fill),
            tab.is_current() and '*' or '',
            tab.number(),
            tab.name(),
            tab.close_btn(''),
            line.sep('', hl, theme.fill),
            hl = hl,
            margin = ' ',
          }
        end),

        line.spacer(),
        {
          line.sep('', theme.tail, theme.fill),
        },
        hl = theme.fill,
      }
    end)
  end,
}
