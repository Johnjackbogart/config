return { 
  "sainnhe/gruvbox-material",
  priority = 1000,
  config = function()
    -- use vim.g to set gruvbox-material settings
    -- :h gruvbox-material
    vim.g.gruvbox_material_transparent_background = "2"
    vim.cmd([[colorscheme gruvbox-material]])
    -- need to use gui instead of cterm when termguicolors are set in options.lua
    -- https://github.com/vim/vim/issues/1740
    -- https://www.reddit.com/r/neovim/comments/128rg86/how_to_change_cursorline_style/
    vim.cmd([[highlight CursorLine guibg=NONE gui=underline]])
  end
}
