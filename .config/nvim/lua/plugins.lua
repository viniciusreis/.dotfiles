local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

local status, packer = pcall(require, "packer")

if not status then
  return
end

return packer.startup(function(use)

  use({"wbthomason/packer.nvim"})

  -- preferred colorscheme
  use({ "bluz71/vim-nightfly-colors", as = 'nightfly' })

  -- fuzzy finding
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
  use({"nvim-telescope/telescope.nvim",
       tag = "0.1.4",
       requires = {{'nvim-lua/plenary.nvim'}}})

  -- treesitter configuration
  use("nvim-treesitter/nvim-treesitter", {run = ':TSUpdate'})
  use({"nvim-treesitter/playground"})

  use({"mbbill/undotree"})
  use({"tpope/vim-fugitive"})

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator")
  use("szw/vim-maximizer") -- maximizes and restores current window

  -- essential plugins
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

  -- managing & installing lsp servers
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- configuring lsp servers
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp") -- display lsp entries in autocompletion
  use({"glepnir/lspsaga.nvim", branch = "main"}) -- enhance ui for lsp
  use("jose-elias-alvarez/typescript.nvim") -- feature like renaming file and updating imports
  use("onsails/lspkind.nvim") -- icons to autocompletion window

  -- autocompletion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')

  -- snippets
  use ('mattn/emmet-vim')
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  -- commenting with gc
  use("numToStr/Comment.nvim")

--   -- file explorer
--   use("nvim-tree/nvim-tree.lua")

 -- icons
 use("kyazdani42/nvim-web-devicons")

 -- statusline
 use("nvim-lualine/lualine.nvim")

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

 if packer_bootstrap then
   require('packer').sync()
 end

end)
