return {
	"oncomouse/lushwal.nvim",
	cmd = { "LushwalCompile" },
	dependencies = {
		{ "rktjmp/lush.nvim" },
		{ "rktjmp/shipwright.nvim" },
	},
	lazy = false,
    config = function ()
        vim.cmd("colorscheme lushwal")
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = 'none'})
    end
}
