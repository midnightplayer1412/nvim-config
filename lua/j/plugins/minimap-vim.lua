return {
	{
		"wfxr/minimap.vim",
		-- If you want lazy-loading you could add `lazy = false`
		opts = {}, -- not strictly needed because it's a Vimscript plugin
		init = function()
			-- set your globals before plugin loads (important for vimscript plugins)
			vim.g.minimap_width = 10
			vim.g.minimap_auto_start = 0
			vim.g.minimap_auto_start_win_enter = 1
			vim.g.minimap_block_filetypes = { "NvimTree", "TelescopePrompt", "dashboard", "alpha" }
		end,
		config = function()
			vim.keymap.set("n", "<leader>mm", ":MinimapToggle<CR>", { desc = "Toggle Minimap" })
			vim.keymap.set("n", "<leader>mr", ":MinimapRefresh<CR>", { desc = "Refresh Minimap" })
		end,
	},
}
