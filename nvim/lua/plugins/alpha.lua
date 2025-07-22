return {
  'goolord/alpha-nvim',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    local dashboard = require("alpha.themes.dashboard")
    local builtin = require ( 'telescope.builtin' )

    require( 'alpha' ).setup(dashboard.config)

    dashboard.section.buttons.val={
      dashboard.button("n"," New File","<cmd>ene <BAR> startinsert<CR>"),
      dashboard.button("f", " Find File", function() builtin.find_files() end),
      dashboard.button("r", " Recent Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("w", " Restore Session", "<cmd>SessionRestore<CR>"),
      dashboard.button("q"," Quit","<cmd>qa!<CR>"),
    }

  end

}
