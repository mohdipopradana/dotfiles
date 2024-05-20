-- TELESCOPE PLUGIN SETTINGS
return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")

		local builtin = require("telescope.builtin")

		local actions = require("telescope.actions")

		local map = vim.keymap.set

		require("telescope").load_extension("file_browser")

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					height = 30,
					width = 150,
				},
				extensions = {
					file_browser = {
						-- dir_icon_hl = "#ffffff",
					},
				},
				mappings = {
					i = {
						-- Move to previous selection
						["<C-k>"] = actions.move_selection_previous,
						-- Move to next selection
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		-- Gruvbox colorscheme
		local colors = {
			bg = "#1c1c1c",
			bd = "#d5c4a1",
			hl = "#3c3836",
			-- hl = "#7a6b5e",
			text_sel = "#ffffff",
			sel_caret = "#fffea0",
		}

		-- Colorish colorscheme
		-- local colors = {
		-- 	bg = "none",
		-- 	bd = "#565f89",
		-- 	hl = "#2a6485",
		-- 	text_sel = "#ffffff",
		-- 	sel_caret = "#fffea0",
		-- }

		-- Modify color of telescope floating
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.bd })
		vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "none", fg = colors.text_sel })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = colors.bg })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.bd })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.bd })
		vim.api.nvim_set_hl(0, "TelescopePromptCounter", { bg = "none", fg = colors.bd })
		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = colors.sel_caret })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.bd })
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = colors.bd })
		vim.api.nvim_set_hl(0, "TelescopeResultsDiffAdd", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsDiffChange", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsDiffDelete", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsDiffUntracked", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.bd })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.bd })
		vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = colors.hl, fg = colors.text_sel, bold = true })
		vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = colors.sel_caret, bold = true })
		vim.api.nvim_set_hl(0, "TelescopePreviewDirectory", { bg = "none", fg = colors.text_sel })
		vim.api.nvim_set_hl(0, "TelescopePreviewDate", { bg = "none", fg = colors.text_sel })

		-- Keymap for browse file on project directory
		map("n", "<leader>ff", "<cmd>Telescope file_browser hidden=true<CR>", { desc = "Find files in cwd" })

		-- Keymap for open recently file that was opened
		map("n", "<leader>fr", builtin.oldfiles, { desc = "Open recent files" })

		-- Keymap for find string in current working directory
		map("n", "<leader>fs", builtin.live_grep, { desc = "Find string in CWD" })

		-- Keymap for find string on under cursor in current working directory
		map("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in CWD" })

		-- Keymap to open help from telescope documentation
		map("n", "<leader>fh", builtin.help_tags, { desc = "Find information and help" })
	end,
}
