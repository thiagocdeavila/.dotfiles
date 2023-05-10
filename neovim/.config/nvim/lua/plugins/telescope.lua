return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    version = false,
    dependencies = {
      'nvim-telescope/telescope-file-browser.nvim',
    },
    keys = {
      { '<leader>ff', function() require('telescope.builtin').find_files({}) end },
      { '<leader>fg', function() require('telescope.builtin').live_grep({}) end },
      { '<leader>fb', function() require('telescope.builtin').buffers({}) end },
      { '<leader>fd',
        function()
          local function telescope_buffer_dir()
            return vim.fn.expand('%p:h')
          end

          require('telescope').extensions.file_browser.file_browser({
            path = '%:p:h',
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
          })
        end
      },
    }
  },
}
