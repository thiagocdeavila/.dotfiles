local status_gitsigns, gitsigns = pcall(require, 'gitsigns')
if (not status_gitsigns) then return end

gitsigns.setup {}
