local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- Elementary plugins
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "kyazdani42/nvim-web-devicons"

  -- Visuals
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    }
  }
  use "romgrk/barbar.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }
  -- use "mhinz/vim-startify"

  -- Colorscheme
  use "folke/tokyonight.nvim"

  -- Vimtex
  use {"lervag/vimtex",
    -- opt = true,
    config = function ()
        vim.g.vimtex_view_method = "zathura"
  end}

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {}
      end
  }

  -- Surround
  -- use "tpope/vim-surround"
  use {
    "kylechui/nvim-surround",
    tag = "*",
    config = function ()
      require("nvim-surround").setup()
    end
  }

  -- Colorizer
  use "norcalli/nvim-colorizer.lua"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp with cmp
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use {
    "iurimateus/luasnip-latex-snippets.nvim",
    requires = { "L3MON4D3/LuaSnip", "lervag/vimtex"},
    config = function()
    require'luasnip-latex-snippets'.setup()
    end,
    ft = "tex",
  }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'
  use {"nvim-telescope/telescope-fzf-native.nvim",
      run = "make"
  }
  use { "nvim-telescope/telescope-file-browser.nvim",
    require("telescope").setup(),
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    --run = ":TSUpdate",
  }

  -- Comment
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- Which key 
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      }
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
