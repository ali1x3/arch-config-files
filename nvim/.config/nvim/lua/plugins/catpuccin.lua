return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      custom_highlights = function(colors)
        return {
          -- Boosts the relative line numbers to a much brighter grey/white
          LineNr = { fg = colors.subtext0 }, 
          
          -- Makes the current line number pop aggressively (optional, but highly recommended!)
          CursorLineNr = { fg = colors.mauve, bold = true },
        }
      end,
    },
  },
}
