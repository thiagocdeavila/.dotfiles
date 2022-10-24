local status_saga, saga = pcall(require, 'lspsaga')
if (not status_saga) then return end

saga.init_lsp_saga {
  code_action_lightbulb = {
    enable = true,
    sign = false,
    virtual_text = true,
  },
}

-- Mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<C-j>', function() require('lspsaga.diagnostic').goto_next({}) end, opts)
map('n', 'K', function() require('lspsaga.hover'):render_hover_doc() end, opts)
map('n', 'gd', function() require('lspsaga.finder'):lsp_finder() end, opts)
map('i', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
map('n', 'gl', function() vim.diagnostic.open_float() end, opts)
map('n', 'gp', function() require('lspsaga.definition'):preview_definition() end, opts)
map('n', 'gr', function() require('lspsaga.rename'):lsp_rename() end, opts)
map('n', 'ca', function() require('lspsaga.codeaction'):code_action() end, opts)
