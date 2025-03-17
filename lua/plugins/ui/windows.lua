-- Window management and animations
return {
  -- Window animations
  {
    'anuvyklack/windows.nvim',
    dependencies = {
      'anuvyklack/middleclass',
    },
    config = function()
      require('windows').setup {
        autowidth = {
          enable = true,
          winwidth = 0,
          filetype = {
            help = 2,
          },
        },
        ignore = {
          buftype = { 'quickfix' },
          filetype = { 'NvimTree', 'neo-tree', 'dashboard', 'Outline', 'alpha', 'dashboard' },
        },
        animation = {
          enable = true,
          duration = 300,
          fps = 60,
          easing = 'in_out_sine',
        },
      }
    end,
  },
}
