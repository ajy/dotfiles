function ColorMyPencils(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

	local lualine_config = require('lualine').get_config()
	lualine_config.theme = "tokyonight"
	require('lualine').setup(lualine_config)

end

ColorMyPencils()
