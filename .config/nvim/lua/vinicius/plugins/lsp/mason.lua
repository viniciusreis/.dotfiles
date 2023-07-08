local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status,mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end


mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    -- "ansiblels",
    "arduino_language_server",
    "asm_lsp",
    -- "bashls",
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
    "pylsp",
    "lua_ls",
    "tailwindcss",
    "terraformls",
    "tsserver",
  }
})
