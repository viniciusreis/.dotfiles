require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "bash",
    "json",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "cpp",
    "cmake",
    "lua",
    "nasm",
    "ninja",
    "objdump",
    "vim",
    "vimdoc",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "svelte",
    "graphql",
    "bash",
    "python",
    "proto",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
    "query",
    "regex",
    "sql",
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
