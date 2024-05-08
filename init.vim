" Load plugins, configuration plugins and key mappings
so ~/.config/nvim/.plugSet/plugins.vim            " Loads the 'plugins.vim' file located in '~/.vim'
so ~/.config/nvim/.plugSet/plugin-config.vim      " Loads the 'plugin-config.vim' file located in '~/.vim'
so ~/.config/nvim/.plugSet/maps.vim               " Loads the 'maps.vim' file located in '~/.vim'

" General Settings
syntax on                   " Enables syntax highlighting
set number                  " Displays line numbers on the left side
set mouse=a                 " Enables mouse usage in all modes
set numberwidth=1           " Sets the width of the line number column to 1
set clipboard=unnamed       " Uses the system clipboard and unnamed register
"set showcmd                " Partially shows commands in the status line
set ruler                   " Displays the cursor position in the status line
"set cursorline             " Highlights the line where the cursor is
set encoding=utf-8          " Sets the file encoding to UTF-8
set showmatch               " Shows matching parentheses/braces when typing
set sw=2                    " Sets the indent width to 2 spaces
set relativenumber          " Displays line numbers relative to the current line
set termguicolors           " Enable TrueColor support for richer and more accurate colors in the terminal.
set hidden                  " Allows switching between files without saving changes immediately.
set wildmenu                " Enables the autocompletion menu
set wildoptions=pum         " Configures the autocompletion menu options as a popup menu
set splitbelow              " Always split below
set laststatus=2	    " Always display the status line
set noshowmode 		    " Hide the mode indicator in the status line

" Theme
color gruvbox-material
set background=dark

"" Searching
set hlsearch               " Highlights matches during searco
set incsearch              " Incremental search
set ignorecase             " Searches are case insensitive

set smartcase              " Searches are case sensitive if they contain at least one capital letter
" Hiden ~ in empty line
highlight EndOfBuffer ctermfg=bg guifg=bg
autocmd ColorScheme * runtime plugin/diagnostic.vim
" Configure the background color of virtual text for errors
hi DiagnosticVirtualTextError guifg=#A91D3A guibg=#000000 gui=italic

" Configure the background color of virtual text for warnings
hi DiagnosticVirtualTextWarning guifg=#ff8000 guibg=#000000 gui=italic

" Configure the background color of virtual text for information
hi DiagnosticVirtualTextInfo guifg=#0080ff guibg=#000000 gui=italic
" Configure the background color of virtual text for hints
hi DiagnosticVirtualTextHint guifg=#00ff00 guibg=#000000 gui=italic
hi DiagnosticUNderlineError guifg=#A91D3A guifg=#A91D3A 
