-- Status line configuration
return {
  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
          disabled_filetypes = { 'alpha' },
        },
        sections = {
          lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
          },
          lualine_b = {
            { 'branch', icon = '' },
            {
              'diff',
              symbols = { added = ' ', modified = ' ', removed = ' ' },
              diff_color = {
                added = { fg = '#98be65' },
                modified = { fg = '#ECBE7B' },
                removed = { fg = '#ec5f67' },
              },
            },
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            },
          },
          lualine_c = {
            { 'filename', path = 1, file_status = true, symbols = { modified = '●', readonly = '', unnamed = '[No Name]' } },
          },
          lualine_x = {
            { 'encoding' },
            { 'fileformat', symbols = { unix = ' ', dos = ' ', mac = ' ' } },
            { 'filetype', colored = true, icon_only = false },
          },
          lualine_y = {
            { 'progress', separator = { right = '' }, left_padding = 2 },
          },
          lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { 'neo-tree', 'lazy', 'mason', 'trouble' },
      }
    end,
  },

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = '│', highlight = 'IblIndent' },
      scope = { enabled = true, show_start = true, show_end = true },
    },
  },

  -- Buffer line (tabs)
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers',
          indicator = {
            icon = '▎',
            style = 'icon',
          },
          buffer_close_icon = '',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 18,
          max_prefix_length = 15,
          tab_size = 22,
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count, level)
            local icons = { error = ' ', warning = ' ', info = ' ', hint = ' ' }
            return ' ' .. icons[level] .. count
          end,
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'File Explorer',
              text_align = 'center',
              separator = true,
            },
          },
          color_icons = true,
          separator_style = 'thin',
          always_show_bufferline = false,
          hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' },
          },
        },
      }
    end,
    keys = {
      { '<leader>bp', '<Cmd>BufferLineCyclePrev<CR>', desc = '⬅️ Previous buffer' },
      { '<leader>bn', '<Cmd>BufferLineCycleNext<CR>', desc = '➡️ Next buffer' },
      { '<leader>bc', '<Cmd>BufferLinePickClose<CR>', desc = '❌ Close buffer' },
      { '<leader>bse', '<Cmd>BufferLineSortByExtension<CR>', desc = '🔤 Sort by extension' },
      { '<leader>bsd', '<Cmd>BufferLineSortByDirectory<CR>', desc = '📁 Sort by directory' },
    },
  },

  -- LSP progress indicator
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    event = 'LspAttach',
    opts = {
      text = {
        spinner = 'moon',
      },
      align = {
        bottom = true,
      },
      window = {
        relative = 'editor',
        blend = 0,
      },
    },
  },
}
