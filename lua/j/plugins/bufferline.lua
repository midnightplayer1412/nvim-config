return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			diagnostics = "nvim_lsp",
			hover = {
				enable = true,
				delay = 150,
				reveal = { "close" },
			},
			offsets = {
				filetype = "neo-tree",
				text = "Neo-tree",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
}
