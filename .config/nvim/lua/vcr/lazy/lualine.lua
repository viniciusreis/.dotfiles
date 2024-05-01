return {
  'nvim-lualine/lualine.nvim',
  config = function()

    local new_colors = {
      normal = "#D5AA61",
      insert = "#CB5D46",
      visual = "#5AA297",
      commandbg = "#E4844D",
      commandfg = "#000000",
    }

    local lualine = require("lualine")
    local nightfly = require('lualine.themes.nightfly')

    nightfly.normal.a.bg = new_colors.normal
    nightfly.insert.a.bg = new_colors.insert
    nightfly.visual.a.bg = new_colors.visual

    nightfly.command = {
      a = {
        gui = "bold",
        bg = new_colors.commandbg,
          fg = new_colors.commandfg,
      }
    }

    lualine.setup({
      options = {
        theme = nightfly
      }
    })
  end
}
