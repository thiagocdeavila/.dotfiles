local M = {}

function M.on_attach(_client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = '[LSP] ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- Mappings
  nmap('<leader>cl', '<cmd>LspInfo<cr>', 'LSP Info')
  nmap('<leader>gd', '<cmd>Telescope lsp_definitions<cr>', 'Goto Definition')
  nmap('<leader>gD', vim.lsp.buf.declaration, 'Goto Declaration')
  nmap('<leader>gr', vim.lsp.buf.references, 'Goto References')
  nmap('<leader>gi', vim.lsp.buf.implementation, 'Goto Implementation')
  nmap('<leader>gl', vim.diagnostic.open_float, 'Line Diagnostics')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')

  nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

  nmap('<leader>K', vim.lsp.buf.hover, 'Hover')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
end

return M
