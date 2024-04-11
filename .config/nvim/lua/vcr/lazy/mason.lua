return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  },
  config = function()
    local servers = {
        "clangd",
        "neocmake",
        "bashls",
        "pyright",
        "arduino_language_server",
        "asm_lsp",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "emmet_ls",
        "graphql",
        "html",
        "marksman",
        "tailwindcss",
        "terraformls",
        "tsserver",
    }
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = servers,
      automatic_installation = true
    })
  end
}
