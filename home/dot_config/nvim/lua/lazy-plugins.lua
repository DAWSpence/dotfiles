
require('lazy').setup({
--code
require( 'code.lspconfig' ),
require( 'code.cmp' ),
require( 'code.trouble' ),
require( 'code.treesitter' ),

--editor
require( 'editor.telescope' ),
require( 'editor.neo-tree' ),
require( 'editor.conform' ),
require( 'editor.indent_line' ),
require( 'editor.oil' ),
require( 'editor.barbar' ),
require( 'editor.which-key' ),
require( 'editor.nvim-spectre' ),
require( 'editor.toggleterm' ),
require( 'editor.nvim-spider' ),
require ( 'editor.arrow' ),






--utils
require( 'utils.autopairs' ),
require( 'utils.mini' ),
require( 'utils.move' ),
require( 'utils.winshift' ),
require( 'utils.auto_session' ),
require( 'utils.indent-o-matic' ),
require( 'utils.hlsearch' ),





--ui
require( 'ui.lualine' ),
require( 'ui.alpha' ),
require( 'ui.tokyonight' ),




--custom

-- require( 'custom.todo-comments' ),
-- require( 'custom.debug' ),
-- require( 'custom.lint' ),






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
