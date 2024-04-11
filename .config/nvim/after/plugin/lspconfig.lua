local lspconfig = require('lspconfig')
-- local typescript = require('typescript')

local vim = vim
local keymap = vim.keymap

-- local additional_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set('n', '<F4>', '<cmd>ClangdSwitchSourceHeader<cr>', opts)                       -- show documentation for what is under cursor
  keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)                                -- show documentation for what is under cursor
--keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts)                              -- show definition, references
--keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)                   -- got to declaration
--keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)                         -- see definition and make edits in window
--keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)                -- go to implementation
--keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
--keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
--keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)                          -- smart rename
  keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
-- keymap.set('n', '<F4>', '<cmd>Lspsaga code_action<CR>', opts)                           -- see available code actions
--keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  keymap.set('n', '<leader>D', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)            -- show  diagnostics for line
  keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)          -- show diagnostics for cursor
--keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)                    -- jump to previous diagnostic in buffer
--keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)                    -- jump to next diagnostic in buffer
  keymap.set('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts)                          -- see outline on right hand side

  -- typescript specific keymaps (e.g. rename file and update imports)
  -- if client.name == 'tsserver' then
  --   keymap.set('n', '<leader>rf', ':TypescriptRenameFile<CR>')                         -- rename file and update imports
  --   keymap.set('n', '<leader>oi', ':TypescriptOrganizeImports<CR>')                    -- organize imports (not in youtube nvim video)
  --   keymap.set('n', '<leader>ru', ':TypescriptRemoveUnused<CR>')                       -- remove unused variables (not in youtube nvim video)
  -- end
end


-- -- configure html server
-- lspconfig['html'].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- configure typescript server with plugin
-- typescript.setup({
--   server = {
--     capabilities = capabilities,
--     on_attach = on_attach,
--   },
-- })

-- configure css server
-- lspconfig['cssls'].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- configure tailwindcss server
-- lspconfig['tailwindcss'].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- configure emmet language server
-- lspconfig['emmet_ls'].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
-- })

-- print "I'm about to load Clangd configuration"
vim.api.nvim_create_autocmd("LspAttach", {callback = on_attach})

vim.api.nvim_create_autocmd("LspAttach", { callback = function()
    print "I'm a second handler being called."
  end})

-- config clangd language server
lspconfig['clangd'].setup({
  --gcapabilities = capabilities,
  on_attach = function (client, bufnr) 
    print "I'm a second handler being called."
  end,
  --   client.server_capabilities.signatureHelpProvider = false
  --   on_attach(client, bufnr)
  -- end,
})


-- configure lua server (with special settings)
lspconfig['lua_ls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize 'vim' global
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
    },
  },
})

-- Change the Diagnostic symbols in the sign column (gutter)
-- local signs = { Error = ' ', Warn = ' ', Hint = 'ﴞ ', Info = ' ' }
-- for type, icon in pairs(signs) do
--   local hl = 'DiagnosticSign' .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
-- end

-- local cmp = require('cmp')
-- 
-- cmp.setup({
--   sources = {
--     {name = 'nvim_lsp'},
--   },
--   mapping = cmp.mapping.preset.insert({
--     -- Enter key confirms completion item
--     ['<CR>'] = cmp.mapping.confirm({select = false}),
-- 
--     -- Ctrl + space triggers completion menu
--     ['<C-Space>'] = cmp.mapping.complete(),
--   }),
--   snippet = {
--     expand = function(args)
--       require('luasnip').lsp_expand(args.body)
--     end,
--   },
-- })
