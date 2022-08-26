require('base')
require('highlight')
require('mapping')
require('plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"

if is_mac then
  vim.opt.clipboard:append { 'unnamedplus' }
end
