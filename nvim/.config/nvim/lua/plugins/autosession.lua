return {
    {
        'rmagatti/auto-session',
        lazy = false,
        opts = {
            -- Don't auto-restore sessions in these basic folders to avoid clutter
            suppressed_dirs = { '~/', '~/Downloads', '/' },
            
            -- Automatically save the session when you close Neovim
            auto_save_enabled = true,
            
            -- Automatically restore the session when you open Neovim in a project folder
            auto_restore_enabled = true,
        }
    }
}
