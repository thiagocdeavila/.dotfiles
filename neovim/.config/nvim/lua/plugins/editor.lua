return {
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      { ']t', function() require('todo-comments').jump_next() end, desc = 'Next todo comment' },
      { '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous todo comment' },
      { '<leader>xt', '<cmd>TodoTrouble<cr>', desc = '(Trouble) Todo' },
      { '<leader>xT', '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>', desc = '(Trouble) Todo/Fix/Fixme' },
      { '<leader>ft', '<cmd>TodoTelescope<cr>', desc = '(Telescope) Todo' },
      { '<leader>fT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<br>', desc = '(Telescope) Todo/Fix/Fixme' },
    },
  },
  {
    'nvim-pack/nvim-spectre',
    cmd = "Spectre",
    opts = {
      open_cmd = 'noswapfile vnew',
    },
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "(Spectre) Replace in files" },
    },
  },
  {
    'folke/trouble.nvim',
    cmd = { 'TroubleToggle', 'Trouble', },
    keys = {
      { '<leader>xx', function() require('trouble').open('document_diagnostics') end, desc = '(Trouble) Document Diagnostics', },
      { '<leader>xX', function() require('trouble').open('workspace_diagnostics') end, desc = '(Trouble) Workspace Diagnostics', },
    },
  }
}
