return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
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
        "python",
        "proto",
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
    ident = { enable = true }, -- enable identation
    autotag = { enable = true }, -- enable autotagging (w/ nvim-ts-autotag plugin)
  },

  config = function(_, opts)
    require 'nvim-treesitter.configs'.setup(opts)
  end
}
