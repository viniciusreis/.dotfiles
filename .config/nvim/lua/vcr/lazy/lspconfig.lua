local base_on_attach = function(client, bufnr)
  
  local opts = { noremap = true, silent = true, buffer = bufnr }

  local keymap = vim.keymap
  keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)                   -- got to declaration
  keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  keymap.set('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts)                          -- see outline on right hand side


  -- keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)                                -- show documentation for what is under cursor
  -- keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts)                              -- show definition, references
  -- keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)                         -- see definition and make edits in window
  -- keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)                          -- smart rename
  -- keymap.set('n', '<F4>', '<cmd>Lspsaga code_action<CR>', opts)                           -- see available code actions
  --keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  --keymap.set('n', '<leader>D', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)            -- show  diagnostics for line
  --keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)          -- show diagnostics for cursor
  --keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)                    -- jump to previous diagnostic in buffer
  --keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)                    -- jump to next diagnostic in buffer

  -- typescript specific keymaps (e.g. rename file and update imports)
  -- if client.name == 'tsserver' then
  --   keymap.set('n', '<leader>rf', ':TypescriptRenameFile<CR>')                         -- rename file and update imports
  --   keymap.set('n', '<leader>oi', ':TypescriptOrganizeImports<CR>')                    -- organize imports (not in youtube nvim video)
  --   keymap.set('n', '<leader>ru', ':TypescriptRemoveUnused<CR>')                       -- remove unused variables (not in youtube nvim video)
  -- end
end

local clangd_on_attach = function(client, bufnr)
  local keymap = vim.keymap
  keymap.set('n', '<F4>', '<cmd>ClangdSwitchSourceHeader<cr>', opts)                       -- show documentation for what is under cursor
  base_on_attach(client, bufnr)
end


return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')

    lspconfig['clangd'].setup({
      on_attach = clangd_on_attach
    })
  end
}
