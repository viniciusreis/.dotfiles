local vim = vim

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system {
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        }
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, 'packer')
if not status then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup(function(use)

  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used by lots of plugins

  -- preferred colorscheme
  use 'lunarvim/darkplus.nvim'
  use 'folke/tokyonight.nvim'

  -- fuzzy finding
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use {'nvim-telescope/telescope.nvim',
       tag = '0.1.4',
       requires = {{'nvim-lua/plenary.nvim'}}}

  -- treesitter configuration
  use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}
  use 'nvim-treesitter/playground'

  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'

  -- tmux & split window navigation
  use 'christoomey/vim-tmux-navigator'
  use 'szw/vim-maximizer'                         -- maximizes and restores current window

  -- essential plugins
  use 'tpope/vim-surround'
  use 'vim-scripts/ReplaceWithRegister'

  -- LSP
  use 'neovim/nvim-lspconfig'                     -- enable LSP
  use 'williamboman/mason.nvim'                   -- simple to use language server installer
  use 'williamboman/mason-lspconfig.nvim'         -- simple to use language server installer
  use 'jose-elias-alvarez/null-ls.nvim'           -- LSP diagnostics and code actions

  -- configuring lsp servers
  -- use {'glepnir/lspsaga.nvim', branch = 'main'}   -- enhance ui for lsp
  use 'jose-elias-alvarez/typescript.nvim'        -- feature like renaming file and updating imports
  use 'onsails/lspkind.nvim'                      -- icons to autocompletion window

  -- autocompletion
  -- cmp plugins
  use 'hrsh7th/nvim-cmp'                          -- The completion plugin
  use 'hrsh7th/cmp-buffer'                        -- buffer completions
  use 'hrsh7th/cmp-path'                          -- path completions
  use 'hrsh7th/cmp-cmdline'                       -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip'                  -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp'                      -- lsp entries in completions
  use 'hrsh7th/cmp-nvim-lua'                      -- lsp entries in completions

  -- snippets
  use 'L3MON4D3/LuaSnip'                          --snippet engine
  use 'rafamadriz/friendly-snippets'              -- a bunch of snippets to use
  use 'mattn/emmet-vim'
  use 'joeveiga/ng.nvim'

  -- commenting with gc
  use 'numToStr/Comment.nvim'

  ---- file explorer
  --use('nvim-tree/nvim-tree.lua')

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- statusline
  use 'nvim-lualine/lualine.nvim'

  -- auto closing
  use 'windwp/nvim-autopairs'                               -- autoclose parens, brackets, quotes, etc...
  use {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'} -- autoclose tags

  use 'dmmulroy/tsc.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end

end)
