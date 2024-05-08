call plug#begin('~/configs/nvim/.plugSet/plugged')

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Navigation Tree
Plug 'scrooloose/nerdtree'

" Dev Icons
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/glyph-palette.vim'

" Theme
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'shaunsingh/nord.nvim'

" Typing Tags
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" Temux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LSP Server
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" IDE
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'preservim/tagbar'
Plug 'dyng/ctrlsf.vim'
Plug 'dense-analysis/ale'
Plug 'liuchengxu/vim-which-key'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvimdev/dashboard-nvim' 
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

