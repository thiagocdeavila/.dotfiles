local status_lsp, lsp = pcall(require, 'lspconfig')
if (not status_lsp) then return end

local status_mason_lsp, mason_lsp = pcall(require, 'mason-lspconfig')
if (not status_mason_lsp) then return end

local status_neodev, neodev = pcall(require, 'neodev')
if (not status_neodev) then return end

local on_attach = function(_client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }

  -- Mappings
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

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
