local status_catppuccin, catppuccin = pcall(require, 'catppuccin')
if (not status_catppuccin) then return end

catppuccin.setup {}

vim.cmd('colorscheme catppuccin')
