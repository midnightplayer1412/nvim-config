return {
	{
		"folke/twilight.nvim",
		event = "VeryLazy",
		config = function()
			require("twilight").setup({
				dimming = {
					alpha = 0.25, -- how much to dim (0 = none, 1 = full dim)
					color = { "Normal", "#ffffff" },
				},
				context = 10, -- number of lines around cursor to keep lit
				treesitter = true,
				expand = { "function", "method", "table", "if_statement" }, -- what to keep visible
			})
			vim.keymap.set("n", "<leader>tw", "<cmd>Twilight<CR>", { desc = "Toggle Twilight dimming" })
		end,
	},
}
