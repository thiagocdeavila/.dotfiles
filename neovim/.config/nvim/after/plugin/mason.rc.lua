local status_mason, mason = pcall(require, 'mason')
local status_lspconfig, lspconfig = pcall(require, 'mason-lspconfig')
if (not status_mason or not status_lspconfig) then return end

mason.setup {}

lspconfig.setup {
  ensure_installed = {
    'sumneko_lua',
    'solargraph',
    'volar',
    'tailwindcss',
    'tsserver',
    'html',
    'gopls',
    'cssls',
    'ansiblels',
    'rubocop',
  }
}
