local status_null_ls, null_ls = pcall(require, 'null-ls')
if (not status_null_ls) then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.rubocop,
  formatting.prettier,
  diagnostics.eslint,
  diagnostics.rubocop,
}

null_ls.setup {
  sources = sources
}
