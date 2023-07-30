return {
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, key, command, desc)
          vim.keymap.set(mode, key, command, { buffer = bufnr, desc = '(Git) ' .. desc })
        end

        map('n', ']h', function() gs.next_hunk() end, 'Next Hunk')
        map('n', '[h', function() gs.next_hunk() end, 'Next Hunk')
        map('n', '<leader>ghs', function() gs.stage_hunk() end, 'Stage Hunk')
        map('n', '<leader>ghr', function() gs.reset_hunk() end, 'Reset Hunk')
        map('v', '<leader>ghs', function() gs.stage_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, 'Stage Hunk')
        map('v', '<leader>ghr', function() gs.reset_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, 'Reset Hunk')
        map('n', '<leader>ghS', function() gs.stage_buffer() end, 'Stage Buffer')
        map('n', '<leader>ghR', function() gs.reset_buffer() end, 'Reset Buffer')
        map('n', '<leader>ghu', function() gs.undo_stage_hunk() end, 'Undo Stage Hunk')
        map('n', '<leader>ghp', function() gs.preview_hunk() end, 'Preview Hunk')
        map('n', '<leader>ghb', function() gs.blame_line() end, 'Blame Line')
        map('n', '<leader>ghB', function() gs.blame_line({ full = true }) end, 'Blame Line (Full)')
        map('n', '<leader>ghd', function() gs.diffthis() end, 'Diff This')
        map('n', '<leader>ghD', function() gs.diffthis('~') end, 'Diff This ~')
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'Select Hunk')
      end,
    },
  },
}
