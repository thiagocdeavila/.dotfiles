local status_dap, dap = pcall(require, 'dap')
if (not status_dap) then return end

dap.adapters.ruby = function(callback, config)
  callback {
    type = "server",
    host = "127.0.0.1",
    port = "${port}",
    executable = {
      command = "bundle",
      args = { "exec", "rdbg", "-n", "--open", "--port", "${port}",
        "-c", "--", "bundle", "exec", config.command, config.script },
    },
  }
end

dap.configurations.ruby = {
  {
    type = "ruby",
    name = "debug current file",
    request = "attach",
    localfs = true,
    command = "ruby",
    script = "${file}",
  },
  {
    type = "ruby",
    name = "run current spec file",
    request = "attach",
    localfs = true,
    command = "rspec",
    script = "${script}",
  },
}

-- Mappings
local map = vim.keymap
local opts = { noremap = true, silent = true }

map.set('n', '<F5>', function() dap.continue() end, opts)
map.set('n', '<F10>', function() dap.step_over() end, opts)
map.set('n', '<F11>', function() dap.step_into() end, opts)
map.set('n', '<F12>', function() dap.step_out() end, opts)
map.set('n', '<leader>b', function() dap.toggle_breakpoint() end, opts)
map.set('n', '<leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, opts)
map.set('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, opts)
map.set('n', '<leader>dr', function() dap.repl.open() end, opts)
map.set('n', '<leader>dl', function() dap.run_last() end, opts)
