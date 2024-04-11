local lspconfig = require('lspconfig')
-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- local default_setup = function(server)
--   lspconfig[server].setup({
--     -- capabilities = lsp_capabilities,
--   })
-- end

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
  automatic_installation = true,
  -- handlers = {default_setup},
})
