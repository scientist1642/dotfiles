
" Pathogen script
execute pathogen#infect()

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Rebind <Leader> key
let mapleader = ","

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" map esc to jj
" inoremap jk <esc>
" inoremap kj <esc>

" enable jinja color highliting
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" unfold everything (if folding is enabled) in the beginning
set foldlevel=99

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Color settings
colorscheme hybrid
"color scheme gruvbox
"set bg=dark  "only for gruvbox
hi Directory ctermfg=3 ctermbg=4 " change directory colors
set guifont=Menlo\ Regular:h14"
"set guifont=PragmataPro\ Regular:h14"

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
"" noremap <C-n> :nohl<CR>
" vnoremap <C-n> :nohl<CR>
" inoremap <C-n> :nohl<CR>

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

"superTab
let g:SuperTabDefaultCompletionType = "context"
"autocmd FileType python let g:SuperTabDefaultCompletionType = "<C-space>"

" ===========NERDTREEE ===============
autocmd VimEnter * NERDTree                         " open NerdTree
autocmd VimEnter * wincmd p                         " set cursor in window
autocmd BufEnter * NERDTreeMirror                  " open NerdTree in every Tab  
let NERDTreeShowBookmarks=1

" mapping windows navigation keys
map <C-H> <C-W>h 
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-C> <C-W>c

" Json Plugin
let g:vim_json_syntax_conceal = 0  "consider double quotes

" Settings for jedi-vim
"let g:jedi#auto_initialization = 0

"Syntastic
"" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
"" set lints for syntastic
let g:syntastic_json_checkers=['jsl', 'jsonlint']


"let g:jedi#usages_command = "<leader>z"
"let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Quit whenever nerdtree is only one window left
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
      if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                    q
            endif
      endif
   endif
endfunction




" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim

"set completeopt=longest,menuone
"function! OmniPopup(action)
"    if pumvisible()
"        if a:action == 'j'
"            return "\<C-N>"
"        elseif a:action == 'k'
"            return "\<C-P>"
"        endif
"    endif
"    return a:action
"endfunction

"inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

"autocomplete python
"http://stackoverflow.com/questions/6396880/how-do-i-get-auto-suggestions-for-array-options-when-typing-in-vim
"not needed at this point, jedi takes care of autocompletion
"autocmd FileType python set completefunc=pythoncomplete#Complete 


" Use CTRL-S for saving, also in Insert mode
"noremap <C-S> :update<CR>
"vnoremap <C-S> <C-C>:update<CR>
"inoremap <C-S> <C-O>:update<CR>
"nmap <C-S>:w<CR>  "saving the file
"mapping split options
map <C-V> <C-W>v
map <C-S> <C-W>s
"map <C-P> '[gq'] 
"
"
" Save and view text for current html file.
"nnoremap <Leader>H :update<Bar>call ViewHtmlText(expand('%:p'))<CR>
" View text for visually selected url.
"vnoremap <Leader>h y:call ViewHtmlText(@@)<CR>
" View text for URL from clipboard.
" On Linux, use @* for current selection or @+ for text in clipboard.
"nnoremap <Leader>h :call ViewHtmlText(@+)<CR>
"===================snipmate option =================
"let g:acp_behaviorPerlOmniLength = 1
"let g:clang_close_preview = 1
"let g:clang_complete_copen = 1   "quick fix windows open 
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt =menu,menuone,longest  "hides preview windows
"set pumheight =15
"let g:clang_complete_auto =1

"====================Template option===================
"autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e


"================(OLD remove later!!!)compile and run====="
"function! MakeAndRun()
"        silent make %:r
"        redraw!
"        if len(getqflist()) == 1
"          !./%:r
"        else
"          for i in getqflist()
"            if i['valid']
"                 cwin
"                 winc p
"                 return
"            endif
"          endfor
"        endif
"endfunction
"nmap <F5> :call MakeAndRun()<cr>


"============(OLD remove later!!!) to open in browser====
"function! ViewHtmlText(url)
"  if !empty(a:url)
"    new
"    setlocal buftype=nofile bufhidden=hide noswapfile
"    execute 'r !w3m ' . ' -dump ' . a:url   
" 	1d
"  endif
"endfunction

