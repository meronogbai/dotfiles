return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },

  keys = {
    { '<leader>duo', '<cmd>tab DBUI<cr>',                   desc = 'Launch dadbod ui' },
    { '<leader>duc', '<cmd>DBUIClose<cr><cmd>windo bd<cr>', desc = 'Close dadbod ui' },
    { '<leader>dut', '<cmd>DBUIToggle<cr>', desc = 'Toggle dadbod ui' }
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
