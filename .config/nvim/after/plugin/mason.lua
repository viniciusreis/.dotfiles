local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup()

require('mason-lspconfig').setup({

  ensure_installed = {
    "arduino_language_server",
    "asm_lsp",
    "neocmake",
    "clangd",
    "cssls",
    "dockerls",
    "docker_compose_language_service",
    "emmet_ls",
    "graphql",
    "html",
    "jsonls",
    "marksman",
    "prismals",
    -- "prettier",
    -- "pylsp",
    "lua_ls",
    "tailwindcss",
    "terraformls",
    "tsserver",
  },
  handlers = {default_setup},
})
