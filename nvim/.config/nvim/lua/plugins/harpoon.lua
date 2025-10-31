return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup() --REQUIRED

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<M-m>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<M-n>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<M-e>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<M-i>", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<M-o>", function() harpoon:list():select(5) end)
    end,
}

