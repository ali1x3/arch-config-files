return {
  "windwp/nvim-ts-autotag",
  opts = {
    -- 1. The core settings must now be nested inside an inner 'opts' table
    opts = {
      enable_close = true,          -- Auto close tags
      enable_rename = true,         -- Auto rename pairs of tags
      enable_close_on_slash = false -- Auto close on trailing </
    },
    
    -- 2. Filetype overrides sit next to the inner 'opts' table
    per_filetype = {
      ["html"] = {
        enable_close = false
      }
    }
  }
}
