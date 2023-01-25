return {
  -- lspconfig
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      'folke/neodev.nvim',
      'mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    opts = {
      servers = {
        sumneko_lua = {
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
        },
      },
      setup = {},
    },
    config = function(_, opts)
      local servers = opts.servers
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local on_attach = require('plugins.lsp.keymaps').on_attach

      local function setup(server)
        local server_opts = servers[server] or {}
        server_opts.capabilities = capabilities
        server_opts.on_attach = on_attach

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then return end
        elseif opts.setup['*'] then
          if opts.setup['*'](server, server_opts) then return end
        end

        require('lspconfig')[server].setup(server_opts)
      end

      require('mason-lspconfig').setup({ ensure_installed = vim.tbl_keys(servers) })
      require('mason-lspconfig').setup_handlers({ setup })
    end
  },

  -- Mason LSP
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
    opts = {
      ensure_installed = {
        'stylua',
        'solargraph',
      }
    },
    config = function(_, opts)
      require('mason').setup(opts)

      local mason_registry = require('mason-registry')
      for _, tool in ipairs(opts.ensure_installed) do
        local package = mason_registry.get_package(tool)
        if not package:is_installed() then
          package:install()
        end
      end
    end,
  },
}
