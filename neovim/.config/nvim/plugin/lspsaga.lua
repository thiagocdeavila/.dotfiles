local status_saga, saga = pcall(require, 'lspsaga')
if (not status_saga) then return end

saga.init_lsp_saga {}

-- Mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local diagnostic = require('lspsaga.diagnostic')
map('n', '<C-j>', function() diagnostic.goto_next({}) end, opts)

local hover = require('lspsaga.hover')
map('n', 'K', function() hover.render_hover_doc() end, opts)

local finder = require('lspsaga.finder')
map('n', 'gd', function() finder:lsp_finder() end, opts)

map('i', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)

local definition = require('lspsaga.definition')
map('n', 'gp', function() definition.preview_definition() end, opts)

local rename = require('lspsaga.rename')
map('n', 'gr', function() rename.lsp_rename() end, opts)
