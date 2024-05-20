return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		opt = true,
	},
	config = function()
		local lualine = require("lualine")

		local function getLspName()
			local buf_clients = vim.lsp.buf_get_clients()
			local buf_ft = vim.bo.filetype
			if next(buf_clients) == nil then
				return "  No servers"
			end
			local buf_client_names = {}

			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" then
					table.insert(buf_client_names, client.name)
				end
			end

			local lint_s, lint = pcall(require, "lint")
			if lint_s then
				for ft_k, ft_v in pairs(lint.linters_by_ft) do
					if type(ft_v) == "table" then
						for _, linter in ipairs(ft_v) do
							if buf_ft == ft_k then
								table.insert(buf_client_names, linter)
							end
						end
					elseif type(ft_v) == "string" then
						if buf_ft == ft_k then
							table.insert(buf_client_names, ft_v)
						end
					end
				end
			end

			local ok, conform = pcall(require, "conform")
			local formatters = table.concat(conform.formatters_by_ft[vim.bo.filetype], " ")
			if ok then
				for formatter in formatters:gmatch("%w+") do
					if formatter then
						table.insert(buf_client_names, formatter)
					end
				end
			end

			local hash = {}
			local unique_client_names = {}

			for _, v in ipairs(buf_client_names) do
				if not hash[v] then
					unique_client_names[#unique_client_names + 1] = v
					hash[v] = true
				end
			end
			local language_servers = table.concat(unique_client_names, ", ")

			return " " .. language_servers
		end

		-- local function getLspName()
		-- 	local msg = "No LSP"
		-- 	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		-- 	local clients = vim.lsp.get_active_clients()
		-- 	if next(clients) == nil then
		-- 		return msg
		-- 	end
		-- 	for _, client in ipairs(clients) do
		-- 		local filetypes = client.config.filetypes
		-- 		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
		-- 			return " " .. client.name
		-- 		end
		-- 	end
		-- 	return " " .. msg
		-- end
		--
		local lsp = {
			function()
				return getLspName()
			end,
		}

		-- Change colorschemes from Lualine plugin
		local custom_color = require("lualine.themes.gruvbox")

		-- Gruvbox colorschemes
		local colors = {
			black = "#000000",
			white = "#ffffff",
			line = "#32302f",
			grey1 = "#d4be98",
			grey2 = "#504945",
			grey3 = "#a89984",
			red = "#fb4934",
			blue1 = "#7daea3",
			blue2 = "#778aed",
			blue3 = "#458898",
			yellow1 = "#fabd2f",
			yellow2 = "#d79921",
			pink = "#ff38a5",
			green1 = "#2af578",
			green2 = "#a9b665",
		}

		-- Colorish colorscheme
		-- local colors = {
		-- 	black = "#000000",
		-- 	white = "#ffffff",
		-- 	line = "#32302f",
		-- 	grey2 = "#504945",
		-- 	red = "#fb4934",
		-- 	blue = "#778aed",
		-- 	yellow = "#ebd40c",
		-- 	pink = "#ff38a5",
		-- 	green = "#2af578",
		-- }

		-- Custom colorscheme
		custom_color.normal = {
			a = { bg = colors.grey3, fg = colors.black, gui = "bold" },
			b = { bg = colors.grey2, fg = colors.white },
			c = { bg = colors.line, fg = colors.white },
		}
		custom_color.insert = {
			a = { bg = colors.yellow2, fg = colors.black, gui = "bold" },
			b = { bg = colors.grey2, fg = colors.white },
			c = { bg = colors.line, fg = colors.white },
		}
		custom_color.visual = {
			a = { bg = colors.green2, fg = colors.black, gui = "bold" },
			b = { bg = colors.grey2, fg = colors.white },
			c = { bg = colors.line, fg = colors.white },
		}
		custom_color.replace = {
			a = { bg = colors.white, fg = colors.black, gui = "bold" },
			b = { bg = colors.grey2, fg = colors.white },
			c = { bg = colors.line, fg = colors.white },
		}
		custom_color.command = {
			a = { bg = colors.blue3, fg = colors.black, gui = "bold" },
			b = { bg = colors.grey2, fg = colors.white },
			c = { bg = colors.line, fg = colors.white },
		}
		custom_color.inactive = {
			a = { bg = colors.green1, fg = colors.white, gui = "bold" },
			b = { bg = colors.grey2, fg = colors.gray },
			c = { bg = colors.line, fg = colors.white },
		}

		vim.api.nvim_set_hl(0, "LualineError", { bg = colors.line, fg = colors.red })
		vim.api.nvim_set_hl(0, "LualineWarn", { bg = colors.line, fg = colors.yellow })
		vim.api.nvim_set_hl(0, "LualineHint", { bg = colors.line, fg = colors.white })
		vim.api.nvim_set_hl(0, "LualineInfo", { bg = colors.line, fg = colors.blue2 })
		vim.api.nvim_set_hl(0, "LualineDiffAdd", { bg = colors.line })
		vim.api.nvim_set_hl(0, "LualineDiffChange", { bg = colors.line })
		vim.api.nvim_set_hl(0, "LualineDiffDelete", { bg = colors.line })
		vim.api.nvim_set_hl(0, "ModeMsg", { fg = colors.white, bold = true })

		-- Plugin setup
		lualine.setup({
			options = {
				icons_enabled = true,
				theme = custom_color,
				-- component_separators = { left = "", right = "" },
				-- component_separators = { left = '', right = '' },
				-- component_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
				component_separators = { left = "|", right = "|" },
				-- section_separators = { left = "█", right = "█" },
				-- section_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},

			sections = {
				lualine_a = {
					{
						"mode",
						padding = 1,
						--icons_enabled = true,
						--icon = ''
					},
				},
				lualine_b = {
					{
						"filename",
						file_status = true,
						newfile_status = false,
						path = 3,
						shorting_target = 40,
						symbols = {
							modified = "[~]",
							readonly = "[!]",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
					},
					{ "branch", icons_enabled = true, icon = "" },
					{
						"diff",
						colored = false,
						diff_color = {
							added = "LualineDiffAdd",
							modified = "LualineDiffChange",
							removed = "LualineDiffDelete",
						},
						symbols = { added = "+", modified = "~", removed = "-" },
						-- symbols = { added = " ", modified = " ", removed = " " },
					},
				},
				lualine_c = {
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						sections = { "error", "warn", "hint", "info" },
						-- symbols = {error = 'E', warn = 'W', hint = 'H', info = 'I'},
						symbols = { error = " ", warn = " ", hint = " ", info = " " },
						-- symbols = { error = " ", warn = " ", hint = " ", info = " " },
						-- symbols = {error = ' ', warn = ' ', hint = ' ', info = ' '},
						diagnostics_color = {
							error = "LualineError",
							warn = "LualineWarn",
							hint = "LualineHint",
							info = "LualineInfo",
						},
						colored = true,
						update_in_insert = true,
						always_visible = false,
					},
				},
				lualine_x = {},
				lualine_y = { "filetype", lsp },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = { "filename" },
				lualine_c = {},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
