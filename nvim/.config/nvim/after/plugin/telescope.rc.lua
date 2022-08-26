local status_telescope, telescope = pcall(require, 'telescope')
if (not status_telescope) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local extensions = telescope.extensions

local fb_actions = extensions.file_browser.actions

local function telescope_buffer_dir()
  return vim.fn.expand('%p:h')
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      },
    },
  },
  pickers = {
    buffers = {
      mappings = {
        ['n'] = {
          ['d'] = actions.delete_buffer
        }
      }
    }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
      mappings = {
        ['n'] = {
          ['c'] = fb_actions.create,
        }
      },
    },
  },
}

local map = vim.keymap.set

map('n', ';f', function() builtin.find_files({}) end)
map('n', '\\\\', function() builtin.buffers() end)
map('n', 'sf', function()
  extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true
  })
end)
map('n', ';r', function() builtin.live_grep() end)
map('n', ';t', function() builtin.help_tags() end)
map('n', ';;', function() builtin.resume() end)
map('n', ';e', function() builtin.diagnostics() end)