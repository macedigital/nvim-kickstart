-- plugin for applying theme changes in case native support is not available
-- https://contour-terminal.org/vt-extensions/color-palette-update-notifications/#request-unsolicited-dsr-on-color-palette-updates
return {
  {
    'vimpostor/vim-lumen',
    cond = function()
      return vim.env.TERM ~= 'xterm-ghostty' or vim.env.TERM_PROGRAM ~= 'ghostty'
    end,
  },
}
