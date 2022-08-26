local status_lsp, lsp = pcall(require, 'lspconfig')
if (not status_lsp) then return end

local status_mason_lsp, mason_lsp = pcall(require, 'mason-lspconfig')
if (not status_mason_lsp) then return end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)

  -- Formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('Format', { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

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

          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false
          },
        },
      },
    }
  end,
}

-- Mappings
local bufopts = { noremap = true, silent = true, }
local map = vim.keymap.set
map('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
