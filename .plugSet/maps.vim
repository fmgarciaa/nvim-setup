autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


let mapleader=" "
inoremap jk <Esc>


" -------------- Manage files --------------------
" Close Files
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>Q :q!<CR>
inoremap qq <Esc>:q<CR>
" Save Files
inoremap zz <Esc>:update<CR>:echo "Saved!!💾"<CR>a
nnoremap zz :update<CR>:echo "Saved!!💾"<CR>

" ------------- NerdTree -------------------------
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
map <Leader>nt :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ------------- Taps Navigation ------------------
nmap <silent> <leader>1 :bfirst<CR>
nmap <silent> <leader>2 :bfirst<CR>:bn<CR>
nmap <silent> <leader>3 :bfirst<CR>:2bn<CR>
nmap <silent> <leader>4 :bfirst<CR>:3bn<CR>
nmap <silent> <leader>5 :bfirst<CR>:4bn<CR>
nmap <silent> <leader>6 :bfirst<CR>:5bn<CR>
nmap <silent> <leader>7 :bfirst<CR>:6bn<CR>
" Close actual Tab
nnoremap <silent> <C-q> :bd <CR>

" ------------- Terminal Config ------------------
nnoremap <silent> <leader>/ :ToggleTerm <CR>

" ------------- GitGutter Config -----------------
nnoremap <silent>gt :GitGutterToggle <CR>

" --------------- Telescope Config -----------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" --------------- Open TagBar ----------------------
nmap <silent> <F8> :TagbarToggle<CR>

" --------------- CtrSF Config ---------------------
" (Ctrl+F) Open search prompt (Normal Mode)
nmap <C-F>f <Plug>CtrlSFPrompt 
" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
xmap <C-F>f <Plug>CtrlSFVwordPath
" (Ctrl-F + F) Perform search with selection (Visual Mode)
xmap <C-F>F <Plug>CtrlSFVwordExec
" (Ctrl-F + n) Open search prompt with current word (Normal Mode)
nmap <C-F>n <Plug>CtrlSFCwordPath
" (Ctrl-F + o )Open CtrlSF window (Normal Mode)
nnoremap <C-F>o :CtrlSFOpen<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
nnoremap <C-F>t :CtrlSFToggle<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

"Mapping to run fixers on file"
nnoremap <leader>L :ALEFix<CR>
