local status_lsp, lsp = pcall(require, 'lspconfig')
if (not status_lsp) then return end

local status_mason_lsp, mason_lsp = pcall(require, 'mason-lspconfig')
if (not status_mason_lsp) then return end

local status_neodev, neodev = pcall(require, 'neodev')
if (not status_neodev) then return end

local on_attach = function(_client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = '[LSP] ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- Mappings
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [d]efinition')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('gr', vim.lsp.buf.references, '[G]oto [r]eferences')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [i]mplementation')
  nmap('gl', vim.diagnostic.open_float, 'Open diagnostic float')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

  nmap('<leader>f', function() vim.lsp.buf.format({async = true}) end, '[f]ormat file')

  nmap('<leader>K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  local capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )
end

neodev.setup {}

mason_lsp.setup_handlers {
  function(server_name)
    lsp[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  ['sumneko_lua'] = function()
    lsp.sumneko_lua.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },

          completion = {
            callSnippet = "Replace",
          },

          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false
          },
        },
      },
    }
  end,
}
