return {
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			local actions = require("telescope.actions")
			require("neoclip").setup({
				history = 1000,
				enable_persistent_history = false,
				length_limit = 1048576,
				continuous_sync = false,
				db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
				filter = nil,
				preview = true,
				prompt = nil,
				default_register = '"',
				default_register_macros = "q",
				enable_macro_history = true,
				content_spec_column = false,
				disable_keycodes_parsing = false,
				dedent_picker_display = false,
				initial_mode = "insert",

				on_select = {
					move_to_front = false,

					close_telescope = true,
				},
				on_paste = {
					set_reg = false,
					move_to_front = false,

					close_telescope = true,
				},
				on_replay = {

					set_reg = false,
					move_to_front = false,
					close_telescope = true,
				},
				on_custom_action = {
					close_telescope = true,
				},
				keys = {
					telescope = {
						i = {
							select = "<cr>",
							["C-j"] = actions.move_selection_next,
							["C-k"] = actions.move_selection_previous,
							paste = "p",
							paste_behind = "P",
							delete = "d", -- delete an entry
							edit = "e", -- edit an entry
							custom = {},
						},
						n = {
							select = "<cr>",
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							paste = "p",
							--- It is possible to map to more than one key.
							-- paste = { 'p', '<c-p>' },
							paste_behind = "P",
							delete = "d",
							edit = "e",
							custom = {},
						},
					},

					fzf = {
						select = "default",
						paste = "ctrl-p",
						paste_behind = "ctrl-k",
						custom = {},
					},
				},
			})
			vim.keymap.set({ "n", "v" }, "<leader>uu", function()
				require("telescope").extensions.neoclip.neoclip()
			end, { desc = "Open clipboard history" })
		end,
	},
}
