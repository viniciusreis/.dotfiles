require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "bash",
    "json",
    "yaml",
    "markdown",
    "markdown_inline",
    "c",
    "cpp",
    "proto",
    "lua",
    "ninja",
    "cmake",
    "vim",
    "vimdoc",
    "dockerfile",
    "gitignore",
    "regex",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true }, -- enable indentation
  autotag = { enable = true }, -- enable autotagging (w/ nvim-ts-autotag plugin)
})
