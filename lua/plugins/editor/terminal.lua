-- Terminal integration
return {
  -- Terminal integration with simplified configuration
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 15,
        open_mapping = [[<c-`>]],
        hide_numbers = true,
        start_in_insert = true,
        direction = 'horizontal',
        close_on_exit = true,
        shell = vim.o.shell,
      }

      -- Simplified toggle terminal function
      function _G.toggle_terminal()
        require('toggleterm').toggle()
      end

      -- Single mapping to toggle terminal
      vim.keymap.set('n', '<C-j>', toggle_terminal, { desc = "Toggle Terminal" })
      vim.keymap.set('t', '<C-j>', toggle_terminal, { desc = "Toggle Terminal" })
    end,
  },
}
