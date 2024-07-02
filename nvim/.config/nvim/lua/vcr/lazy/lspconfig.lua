local basic_on_attach = function(event)
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
  end
  map('gd', require('telescope.builtin').lsp_definitions, '[g]oto [d]efinition')
  map('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
  map('gr', require('telescope.builtin').lsp_references, '[g]oto [r]eferences')
  map('gI', require('telescope.builtin').lsp_implementations, '[g]oto [I]mplementation')
  map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[d]ocument [s]ymbols')
  map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[w]orkspace [s]ymbols')
  map('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
  map('<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')
  map('K', vim.lsp.buf.hover, 'Hover Documentation') --  See `:help K` for why this keymap.

  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if client and client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = event.buf,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = event.buf,
      callback = vim.lsp.buf.clear_references,
    })
  end
  -- if event.data.client_id == 'clangd' then
  --   map('<F4>', '<cmd>ClangdSwitchSourceHeader<cr>', 'Switch between header and source files');
  -- end
end

local clangd_on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<F4>', '<cmd>ClangdSwitchSourceHeader<cr>', opts)                       -- show documentation for what is under cursor
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = basic_on_attach
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      neocmake = {},
      bashls = {},
      arduino_language_server = {},
      asm_lsp = {},
      cssls = {},
      dockerls = {},
      docker_compose_language_service = {},
      emmet_ls = {},
      graphql = {},
      html = {},
      marksman = {},
      tailwindcss = {},
      terraformls = {},
      tsserver = {},
      clangd = {},
      pyright = {},
      rust_analyzer = {},
      lua_ls = {
        setting = {
          Lua = {
            completion = {
              callSinppet = 'Replace'
            }
          }
        }
      }
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
    })

    require('mason-tool-installer').setup{ ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    require('lspconfig')['clangd'].setup({
      on_attach = clangd_on_attach
    })
  end
}
