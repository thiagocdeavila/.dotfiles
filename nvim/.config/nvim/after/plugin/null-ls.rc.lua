local status_null_ls, null_ls = pcall(require, 'null_ls')
if (not status_null_ls) then return end

local formatting = null_ls.builtins.formatting

local sources = {
    formatting.rubocop
}

null_ls.setup {
  sources = sources
}
