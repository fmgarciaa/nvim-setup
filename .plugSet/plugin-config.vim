" Nerdtree Configuration
let g:indentLine_char_list = ['┊']
let g:NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks = 1   " Show the bookmarks table
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinSize = 31        " Set panel width to 31 columns

" AirLine Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme           = 'molokai'
let g:airline_section_z       = '%3p%%'
let g:airline_powerline_fonts = 1
let g:airline#extensions#default#section_truncate_width={
  \ 'b' : 88,
  \ 'x' : 110,
  \ 'y' : 130,
  \ 'z' : 88
  \ }
" let g:airline#extensions#ctrlp#color_template = 'replace'
let airline#extensions#tmuxline#snapshot_file = '~/.tmux/tmuxline.conf'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:bufferline_echo           = 0
let g:bufferline_rotate         = 1
let g:bufferline_fixed_index    = -1
let g:bufferline_solo_highlight = 1

" Dev Icons Configuration
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" TagBar Configuration
" Focus the panel when opening it
let g:tagbar_autofocus = 1
" Highlight the active tag
let g:tagbar_autoshowtag = 1
" Make panel vertical and place on the right
let g:tagbar_position = 'botright vertical'

" Ctrlsf Configuration
" Use the ack tool as the backend
let g:ctrlsf_backend = 'ack'
" Auto close the results panel when opening a file
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
" Immediately switch focus to the search window
let g:ctrlsf_auto_focus = { "at":"start" }
" Don't open the preview window automatically
let g:ctrlsf_auto_preview = 0
" Use the smart case sensitivity search scheme
let g:ctrlsf_case_sensitive = 'smart'
" Normal mode, not compact mode
let g:ctrlsf_default_view = 'normal'
" Use absoulte search by default
let g:ctrlsf_regex_pattern = 0 
" Position of the search window
let g:ctrlsf_position = 'right'
" Width or height of search window
let g:ctrlsf_winsize = '46'
" Search from the current working directory
let g:ctrlsf_default_root = 'cwd'

" =========== ALE Configuration =======================
"Disable ALE's LSP in favour of standalone LSP plugin"
let g:ale_disable_lsp = 1

"Show linting errors with highlights" 
"* Can also be viewed in the loclist with :lope"
let g:ale_set_signs = 1
let g:ale_set_highlights = 1
let g:ale_virtualtext_cursor = 1
highlight ALEError ctermbg=none cterm=underline

"Define when to lint"
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_change = 'never'

"Set linters for individual filetypes"
let g:ale_linters_explicit = 1
let g:ale_linters = {
    \ 'go': ['gofmt', 'gopls', 'govet', 'gobuild'],
    \ 'python': ['ruff', 'mypy', 'pylsp'],
\ }
"Specify fixers for individual filetypes"
let g:ale_fixers = {
    \ '*': ['trim_whitespace'],
    \ 'python': ['ruff'],
    \ 'go': ['gopls', 'goimports', 'gofmt', 'gotype', 'govet'],
\ }
"Don't warn about trailing whitespace, as it is auto-fixed by '*' above"
let g:ale_warn_about_trailing_whitespace = 0
"Show info, warnings, and errors; Write which linter produced the message"
let g:ale_lsp_show_message_severity = 'information'
let g:ale_echo_msg_format = '[%linter%] [%severity%:%code%] %s'
"Specify Containerfiles as Dockerfiles"
let g:ale_linter_aliases = {"Containerfile": "dockerfile"}

"--- WhichKey settings ---------------------------------------------"
"Put this before a qny of the other plugin-specific config"
let g:mapleader = "\<Space>"
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
set timeoutlen=300

let g:gitgutter_enabled = 0

" ==== Lua Configuration ======
lua << EOF
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { 
  indent = { highlight = highlight },
}

require("ibl").overwrite {
  exclude = { filetypes = {"help", "terminal", "dashboard"} }
}

require('Comment').setup()

function SetupDashboard()
    require('dashboard').setup({
    theme='hyper',
    shortcut_type='number',
    config={
      week_header={enable = true}
    }
    })
end

vim.cmd('autocmd VimEnter * lua SetupDashboard()')
require("toggleterm").setup()
require("mason").setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'bashls',
    'rust_analyzer',
    'dockerls',
    'docker_compose_language_service',
    'lua_ls',
    'marksman',
    'pyright',
    'yamlls'
  }
})

-- ========================
 -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['bashls'].setup{capabilities=capabilities}
  require('lspconfig')['rust_analyzer'].setup{capabilities=capabilities}
  require('lspconfig')['dockerls'].setup{capabilities=capabilities}
  require('lspconfig')['docker_compose_language_service'].setup{capabilities=capabilities}
  require('lspconfig')['lua_ls'].setup{capabilities=capabilities}
  require('lspconfig')['marksman'].setup{capabilities=capabilities}
  require('lspconfig')['pyright'].setup{capabilities=capabilities}
  require('lspconfig')['yamlls'].setup{capabilities=capabilities}

vim.diagnostic.config({
  virtual_text = false,
  signs = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.cmd('highlight LspDiagnosticsWarning guifg=#FFA500')
EOF
