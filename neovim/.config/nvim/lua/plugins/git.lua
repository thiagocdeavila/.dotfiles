return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, key, action, desc)
          vim.keymap.set(mode, key, action, { buffer = buffer, desc = desc })
        end

        map('n', '<leader>gib', function() gs.blame_line({ full = true }) end, 'Blame Line')
      end,
    }
  }
}
