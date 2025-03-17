-- Terminal integration
return {
  -- Terminal integration
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = function(term)
          if term.direction == 'horizontal' then
            return 15 -- Set height to 15 lines (adjust as needed)
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4 -- 40% of screen width
          end
        end,
        open_mapping = [[<c-`>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'horizontal', -- Changed from 'float' to 'horizontal'
        close_on_exit = true,
        shell = vim.o.shell,
      }

      -- Add a function to toggle terminal with <C-j> as well
      function _G.toggle_terminal()
        local term = require('toggleterm.terminal').get(1)
        if term and term:is_open() then
          term:close()
        else
          require('toggleterm').toggle(1, 15, vim.fn.getcwd(), 'horizontal')
        end
      end

      -- Map the VSCode keybinding to toggle the terminal
      vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>lua toggle_terminal()<CR>', { noremap = true, silent = true, desc = "🖥️ Toggle Terminal" })
      vim.api.nvim_set_keymap('t', '<C-j>', '<cmd>lua toggle_terminal()<CR>', { noremap = true, silent = true, desc = "🖥️ Toggle Terminal" })
    end,
  },
}
