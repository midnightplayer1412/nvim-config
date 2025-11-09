return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-mini/mini.icons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"██╗   ██╗███╗   ██╗██████╗ ███████╗ █████╗ ████████╗ █████╗ ██████╗ ██╗     ███████╗",
				"██║   ██║████╗  ██║██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██║     ██╔════╝",
				"██║   ██║██╔██╗ ██║██████╔╝█████╗  ███████║   ██║   ███████║██████╔╝██║     █████╗  ",
				"██║   ██║██║╚██╗██║██╔══██╗██╔══╝  ██╔══██║   ██║   ██╔══██║██╔══██╗██║     ██╔══╝  ",
				"╚██████╔╝██║ ╚████║██████╔╝███████╗██║  ██║   ██║   ██║  ██║██████╔╝███████╗███████╗",
				" ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝",
			}

			vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#ED587A", bold = true })
			dashboard.section.header.opts.hl = "DashboardHeader"

			dashboard.section.buttons.val = {
				dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "󰈞  Find File", ":Telescope find_files<CR>"),
				dashboard.button("c", "󰈞  Config", ":Telescope find_files cwd=~/.config/nvim<CR>"),
				dashboard.button("q", "  Quit", ":qa<CR>"),
			}
			alpha.setup(dashboard.opts)
		end,
	},
}
