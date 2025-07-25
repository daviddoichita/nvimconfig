return {
  "RRethy/base16-nvim",
  config = function()
    vim.cmd('colorscheme base16-onedark-dark')
    require('base16-colorscheme').setup({
      base00 = '#121212',
      base01 = '#1c1f24',
      base02 = '#2c313a',
      base03 = '#434852',
      base04 = '#565c64',
      base05 = '#abb2bf',
      base06 = '#b6bdca',
      base07 = '#c8ccd4',
      base08 = '#ef596f',
      base09 = '#d19a66',
      base0A = '#e5c07b',
      base0B = '#89ca78',
      base0C = '#2bbac5',
      base0D = '#61afef',
      base0E = '#d55fde',
      base0F = '#be5046'
    })
  end
}
