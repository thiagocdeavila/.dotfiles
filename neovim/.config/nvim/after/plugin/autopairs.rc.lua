local status_autopairs, autopairs = pcall(require, 'nvim-autopairs')
if (not status_autopairs) then return end

autopairs.setup {}
