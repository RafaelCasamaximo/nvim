local options = {
	backup = false,
	shiftwidth = 4,
	tabstop = 4,
	number = true,
	wrap = false,
}

for k, v in pairs(options) do 
	vim.opt[k] = v
end

--vim.cmd[[colorscheme nord]]
vim.g.nord_borders = true

require("nord").set()
