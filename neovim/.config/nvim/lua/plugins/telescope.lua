return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope-file-browser.nvim'
    },
    cmd = 'Telescope',
    keys = function()
      local builtin = require('telescope.builtin')

      return {
        { '<leader>ff', function() builtin.find_files({}) end },
        { '<leader>fg', function() builtin.live_grep({}) end },
        { '<leader>fb', function() builtin.buffers({}) end },
        { '<leader>fd', function()
          local function telescope_buffer_dir()
            return vim.fn.expand('%p:h')
          end

          require('telescope').extensions.file_browser.file_browser({
            path = '%:p:h',
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true
          })
        end },
      }
    end
  },
}
