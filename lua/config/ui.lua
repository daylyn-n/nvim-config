if vim.g.neovide then
  vim.o.guifont = "jetbrainsmono nerd font:h12"

  vim.g.neovide_opacity = 0.95
  vim.g.neovide_background_color = "#0f1117"

  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_scroll_animation_length = 0.2

  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_left = 5
  vim.g.neovide_padding_right = 5

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_highlight_matching_pair = true
  vim.g.neovide_cursor_vfx_mode = "railgun"

  vim.keymap.set("n", "<C-=>", function()
    vim.g.neovide_scale_factor = (vim.g.neovide_scale_factor or 1.0) * 1.1
  end, { desc = "Zoom in" })

  vim.keymap.set("n", "<C-->", function()
    vim.g.neovide_scale_factor = (vim.g.neovide_scale_factor or 1.0) / 1.1
  end, { desc = "Zoom out" })

  vim.keymap.set("n", "<C-0>", function()
    vim.g.neovide_scale_factor = 1.0
  end, { desc = "Reset zoom" })
end

vim.cmd.colorscheme("murphy")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

vim.cmd([[
  hi TabLineFill guibg=NONE ctermfg=242 ctermbg=NONE
]])
