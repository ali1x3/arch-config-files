return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    window = {
      backdrop = 1, -- Blurs/darkens the background slightly
      width = 120, -- Keeps your Typst paragraphs at a highly readable width
    },
    plugins = {
      tmux = { enabled = true }, -- Hides your Tmux status bar!
      kitty = { enabled = true, font = "+4" }, -- Optional: Boosts font size if you use Kitty
    },
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
  },
}
