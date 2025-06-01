-- add toggleterm plugin, initial options, and keybindings
return {
  {
    'akinsho/toggleterm.nvim',
    keys = {
      {
        '<leader>ft',
        '<cmd>ToggleTerm direction=horizontal dir=%:h<cr>',
        desc = 'Horizontal Terminal (current dir)',
      },
      {
        "<leader>Tv",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, vim.o.columns * 0.4, LazyVim.root.get(), "vertical")
        end,
        desc = "ToggleTerm (vertical root_dir)",
      },
      {
        '<leader>gg',
        function()
          local t = require('toggleterm.terminal').Terminal
          local lazygit = t:new { cmd = 'lazygit', hidden = true, direction = 'float', dir = 'git_dir', name = 'lazygit' }
          lazygit:toggle()
        end,
        desc = 'Open lazygit (root)',
      },
    },
    opts = {
      autochdir = false,
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,

      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_terminals = true,
      close_on_exit = true,
      shell = vim.o.shell,
      start_in_insert = true,
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    },
  },
}
