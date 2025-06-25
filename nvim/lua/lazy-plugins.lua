
require('lazy').setup({
  'NMAC427/guess-indent.nvim', 

  require ( 'core.gitsigns' ),

  require ( 'core.which-key' ),

  require ( 'core.telescope' ),

  require ( 'core.lspconfig' ),

  require ( 'core.conform' ),

  require ( 'core.blink-cmp' ),

  require ( 'core.tokyonight' ),

  require ( 'core.lualine' ),

  require ( 'core.treesitter' ),

  require ( 'core.autopairs' ),

  require ( 'core.neo-tree' ),

  require ( 'core.indent_line' ),

  require ( 'core.substitute' ),

  require ( 'core.oil' ),

  require ( 'core.surround' ),

  require ( 'core.align' ),

  require ( 'core.move' ),

  require ( 'core.winresize' ),

  require ( 'core.barbar' ),

  require ( 'core.leap' ),

  require('core.submode'),

  require('core.cmp')

---------------------------------------------------------------------------------------------
--custom
  require('custom.toggleterm'),

  require('custom.alpha')

  -- require ( 'custom.debug' ),

  -- require ( 'custom.lint' ),

}






-- {
  -- ui = {
  --   -- If you are using a Nerd Font: set icons to an empty table which will use the
  --   -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
  --   icons = vim.g.have_nerd_font and {} or {
  --     cmd = '⌘',
  --     config = '🛠',
  --     event = '📅',
  --     ft = '📂',
  --     init = '⚙',
  --     keys = '🗝',
  --     plugin = '🔌',
  --     runtime = '💻',
  --     require = '🌙',
  --     source = '📄',
  --     start = '🚀',
  --     task = '📌',
  --     lazy = '💤 ',
  --   },
  -- },


)

-- vim: ts=2 sts=2 sw=2 et
