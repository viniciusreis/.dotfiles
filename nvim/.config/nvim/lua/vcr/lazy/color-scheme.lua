return {
  'folke/tokyonight.nvim',
  config = function()
    local colorscheme = "tokyonight-night"
    local selected, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not selected then
      vim.notify('colorscheme ' .. colorscheme .. 'not found!')
      return
    end
    vim.api.nvim_set_hl(0, 'Normal', {bg = 'none'})
    vim.api.nvim_set_hl(0, 'NormalFloat', {bg = 'none'})
  end
}
