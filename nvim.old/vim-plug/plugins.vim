" GENERAL

" auto-install plugins upon starting
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')


" TEXT SUPPORT

" LaTeX Support
    Plug 'lervag/vimtex'

" Markdown
    Plug 'gabrielelana/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    
" Pandoc: conflict with markdown auto-indent and syntax highlighting
    " Plug 'vim-pandoc/vim-pandoc'
    " Plug 'vim-pandoc/vim-pandoc-syntax' " Syntax not as good

" Better Syntax Support
   Plug 'sheerun/vim-polyglot'

" Treesitter
   Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" FILE MANAGEMENT

" Startup Screen
   Plug 'mhinz/vim-startify'
   " Plug 'goolord/alpha-nvim'

" File Explorer
   Plug 'ryanoasis/vim-devicons' "adds icons to coc-explorer
   " Plug 'kyazdani42/nvim-web-devicons'
   " Plug 'kyazdani42/nvim-tree.lua'
    
" Fuzzy Finder
   " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
   " Plug 'junegunn/fzf.vim'
    " Plug 'jremmen/vim-ripgrep'
    " Plug 'ctrlpvim/ctrlp.vim' " Not as elegant as FZF

" Telescope
   Plug 'nvim-lua/plenary.nvim'
   Plug 'nvim-telescope/telescope.nvim'
    
" Git Integration
    " Plug 'mhinz/vim-signify'
    " Plug 'airblade/vim-gitgutter'
    " Plug 'tpope/vim-fugitive'
    " Plug 'tpope/vim-rhubarb'
    " Plug 'junegunn/gv.vim'

" AUTOCOMPLETE

" Intellisense
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
      " Keeping up to date with master
      " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
   Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
    " Plug 'Valloric/YouCompleteMe'
    
" Snippets
   Plug 'SirVer/ultisnips'

" Auto pairs and surround for '(' '[' '{' etc.
   Plug 'jiangmiao/auto-pairs' 
   Plug 'tpope/vim-surround' 
   Plug 'machakann/vim-sandwich' 
   Plug 'tpope/vim-repeat' 
    

" ADDITIONAL FUNCTIONS

" Comments
    Plug 'tpope/vim-commentary'

" Quick Movements in Text
    " Plug 'unblevable/quick-scope'
    " Plug 'easymotion/vim-easymotion'
    " Plug 'justinmk/vim-sneak'
    
" Terminal
    Plug 'voldikss/vim-floaterm'
    
" Undo tree
    Plug 'mbbill/undotree'
    
" Multiple Cursors
    " Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    " Plug 'terryma/vim-multiple-cursors'
    
"  Hexokinase
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" MAPPINGS

" Look Up Key Bindings
    Plug 'liuchengxu/vim-which-key'

" APPEARANCE

" Themes 
    Plug 'folke/tokyonight.nvim'  " Source grubox theme
    
" Status Line
    Plug 'itchyny/lightline.vim'

" Barbar
    Plug 'romgrk/barbar.nvim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
