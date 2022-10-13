local status_trouble, trouble = pcall(require, 'trouble')
if (not status_trouble) then return end

trouble.setup {}
