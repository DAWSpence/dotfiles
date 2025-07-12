
require('lazy').setup({
  'NMAC427/guess-indent.nvim', 

  -- require ( 'plugins.gitsigns' ),

  require ( 'lsp.lspconfig' ),

  require ('plugins.harpoon'),

  require(  'lsp.cmp' ),

  require ( 'plugins.which-key' ),

  require ( 'lsp.trouble'),

  require ('plugins.mini'),

  require ( 'plugins.telescope' ),

  require ( 'plugins.conform' ),

  require ( 'plugins.tokyonight' ),

  require ( 'plugins.lualine' ),

  require ( 'plugins.treesitter' ),

  require ( 'plugins.autopairs' ),

  require ( 'plugins.neo-tree' ),

  require ( 'plugins.indent_line' ),

  require ( 'plugins.oil' ),

  require ( 'plugins.surround' ),

  require ( 'plugins.move' ),

  -- require ( 'plugins.winresize' ),

  require ( 'plugins.barbar' ),

  require ('plugins.leap'),

  require ('plugins.winshift'),

  require('plugins.winresize'),
  
  require('plugins.alpha'),

  require('plugins.marks'),

  require('plugins.toggleterm'),

  require('plugins.mini'),


---------------------------------------------------------------------------------------------
--custom

  -- require('custom.todo-comments'),

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
