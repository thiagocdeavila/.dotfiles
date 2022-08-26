local lualine = require('lualine')

lualine.setup {
  options = {
    icons_enabled = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{
      'filename',
      file_status = true,
      path = 0
    }}
  }
}
