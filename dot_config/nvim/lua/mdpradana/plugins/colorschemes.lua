return {
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavour = "mocha",
	-- 			transparent_background = true,
	-- 			-- styles = {
	-- 			-- 	sidebars = "transparent",
	-- 			-- 	floats = "transparent",
	-- 			-- },
	-- 		})
	-- 		vim.cmd([[
	--            colorscheme catppuccin
	--            hi Normal guibg=none
	--            hi NormalFloat ctermbg=none
	--            hi Visual gui=none guibg=#444144 guifg=none
	--            " hi Visual gui=none guibg=#444144 guifg=none
	--            hi NonText guibg=none
	--            hi LineNr guibg=none guifg=#5f8787
	--            hi CursorLine guibg=none
	--            hi CursorLineNr guibg=none guifg=#fffea0
	--            hi Comment guifg=#5f8787
	--         ]])
	-- 	end,
	-- },

	-- {
	-- 	"craftzdog/solarized-osaka.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[
	--            colorscheme solarized-osaka
	--            hi Normal guibg=none
	--            hi NormalFloat ctermbg=none
	--            hi Visual gui=none guibg=#292e42 guifg=none
	--            hi NonText guibg=none
	--            hi LineNr guibg=none guifg=#5f8787
	--            hi CursorLine guibg=none
	--            hi CursorLineNr guibg=none guifg=#fffea0
	--            hi Comment guifg=#5f8787
	--            ]])
	-- 	end,
	-- },

	-- Aura Dark only
	-- { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- {
	-- 	"baliestri/aura-theme",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function(plugin)
	-- 		vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
	-- 		vim.cmd([[
	--            colorscheme aura-dark
	-- hi Normal guibg=none
	--            hi NormalFloat ctermbg=none
	--            hi Visual gui=none guibg=#2A6485 guifg=#edecee
	--            hi NonText guibg=none
	--            hi LineNr guibg=none guifg=#5f8787
	--            hi CursorLine guibg=none
	--            hi CursorLineNr guibg=none guifg=#fffea0
	--            hi Comment guifg=#5f8787
	--              hi ColorColumn guibg=#292e42
	--            ]])
	-- 	end,
	-- },

	-- Gruvbox
	-- {
	-- 	"eddyekofo94/gruvbox-flat.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	enabled = true,
	-- 	config = function()
	-- 		vim.cmd([[
	--            colorscheme gruvbox-flat
	--            hi Normal guibg=none
	--            hi NormalFloat ctermbg=none
	--                hi Visual gui=none guibg=#063BA4 guifg=#edecee
	--                " -- hi Visual gui=none guibg=#7a6b5e guifg=#edecee
	--                " -- hi Visual gui=none guibg=#968475 guifg=#ffffff
	--                hi NonText guibg=none
	--                hi LineNr guibg=none guifg=#5f8787
	--                hi CursorLine guibg=none
	--                hi CursorLineNr guibg=none guifg=#fffea0
	--                hi Comment guifg=#5f8787
	--                hi ColorColumn guibg=#292e42
	--                " -- hi FloatShadow guibg=none
	--                " -- hi FloatShadowThrough guibg=none
	--                " -- hi FloatBorder guibg=none guifg=#d5c4a1
	--           ]])
	-- 	end,
	-- },

	{
		"sainnhe/gruvbox-material",
		priority = 1000,
		config = function()
			vim.cmd([[
	           colorscheme gruvbox-material
	           hi Normal guibg=none
	           hi NormalFloat guibg=none
	              hi NormalNC guibg=none
	              hi FloatTitle guibg=none, guifg=#d5c4a1
	              hi FloatBorder guibg=none, guifg=#d5c4a1
	              hi Visual guibg=#444144
                  "" -- hi Visual guibg=#063BA4 guifg=#edecee
	              hi NonText guibg=none
	              hi LineNr guibg=none guifg=#5f8787
	              hi CursorLineNr guibg=none guifg=#fffea0
	              hi Comment guifg=#5f8787
	              hi ColorColumn guibg=#32302f
                  hi CursorLine guibg=#32302f
                  " -- hi FloatShadow guibg=none
                  " -- hi FloatShadowThrough guibg=none
                  " -- hi FloatBorder guibg=none guifg=#d5c4a1
                  " -- hi Visual gui=none guibg=#7a6b5e guifg=#edecee
                  " -- hi Visual gui=none guibg=#968475 guifg=#ffffff
	       ]])
		end,
	},
}
