
" -PLUGINS----------------------------------------------------------------------

    " vim-plug https://github.com/junegunn/vim-plug
    call plug#begin()
        Plug 'neoclide/coc.nvim', {'branch': 'release' }
        " Plug 'ycm-core/YouCompleteMe'
        " deoplete // sucks
        " Plug 'Shougo/deoplete.nvim'
        " Plug 'roxma/nvim-yarp'
        " Plug 'roxma/vim-hug-neovim-rpc'
        " vimproc // required by ghcmod
        " Plug 'https://github.com/Shougo/vimproc.vim'
        " plug for C/C++
        " Plug 'bfrg/vim-cpp-modern'
        " plug for simple commenting
        Plug 'scrooloose/nerdcommenter'
        " plug for better folding
        Plug 'https://github.com/pseewald/vim-anyfold' " sucks
        " Plug 'https://github.com/tmhedberg/SimpylFold'
        " filelist
        Plug 'https://github.com/scrooloose/nerdtree'
        " ...with git support:
        Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
        " defining shortcuts like pref+kep_key
        Plug 'https://github.com/kana/vim-submode'
        " syntax support for Solidity (Etherum smart contracts)
        Plug 'https://github.com/tomlion/vim-solidity'
        " for DOT (graph description language)
        Plug 'https://github.com/wannesm/wmgraphviz.vim'
        " for PlatformIO
        Plug 'normen/vim-pio'
    call plug#end()


" -BASIC-SETTINGS---------------------------------------------------------------
    " required by YCM (in some cases)
    set encoding=utf-8

    " Change cursor shape to thin vertical bar in insert mode
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else   " for TMUX
        " Only for KDE4 (https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes)
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_SR = "\<Esc>]50;CursorShape=2\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
        " Only for KDE5 (https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes)
        " let &t_SI = "\<Esc>[6 q"
        " let &t_SR = "\<Esc>[4 q"
        " let &t_EI = "\<Esc>[2 q"
    endif

    " Timeoutlen is for mapping delays; ttimeoutlen is for key code delays
    set timeoutlen=1000 ttimeoutlen=0

    " fix Ctrl + arrow escape sequence
    map <Esc>[1;2A <C-up>
    map <Esc>[1;2B <C-down>
    map <Esc>[1;2C <C-right>
    map <Esc>[1;2D <C-left>
    " sometimes there's different esc sequence..???
    map <Esc>[1;5A <C-up>
    map <Esc>[1;5B <C-down>
    map <Esc>[1;5C <C-right>
    map <Esc>[1;5D <C-left>
    " yet different with shift
    map <Esc>[1;6A <C-up>
    map <Esc>[1;6B <C-down>
    map <Esc>[1;6C <C-right>
    map <Esc>[1;6D <C-left>

    syntax on                 " required by Anyfold
    filetype plugin indent on " required by Anyfold
    
    set nu " set numbering lines
    set mouse=a " set mouse all

    " command! Q qa " make Q quit all tabs and splits
    command! Q q " make Q works like q
    command! W w " make W works like w

    set ignorecase " ignore case while searching
    set smartcase  " ...but when the letter is big then only search for big
    
    set tabstop=4 " when indenting with '>', use N spaces width
    set shiftwidth=4 " On pressing tab, insert N spaces
    set expandtab
    " set autoindent
    " set cindent
    
    set clipboard=unnamedplus    " use system clipboard
    set directory=~/.vim/tmp,.   " set place for swaps
    
    " show filename constantly
    set laststatus=2
    " set statusline+=%F " filepath
    

    " make x delete instead of cut (no copy first)
    nnoremap x "_x
    vnoremap x "_x
    " xnoremap x "_x
    vnoremap p "_xP
    
    " code folding
    set foldmethod=indent
    " set foldcolumn=4
    " set foldnestmax=10
    " set nofoldenable
    " set foldlevel=2

    " tab handling
    nnoremap <C-w>t :tabnew<Enter>
    nnoremap t gt
    nnoremap T :tabp<Enter>
    nnoremap <C-w><left> :tabm-1<Enter>
    nnoremap <C-w><right> :tabm+1<Enter>


    " failed clorscheme settings
    " if (&ft=='c' || &ft=='cpp' || &ft=='cc' || &ft=='cu' || &ft=='h' || &ft=='hpp' || &ft=='py')
    " make colorschemes work in tmux (without `export TERM=screen-256color`)
    " set t_Co=256
    "set colorscheme
    " colorscheme sunburst
    " endif
    
    set t_Co=256
    " autocmd BufEnter * colorscheme default
    autocmd BufEnter * colorscheme sunburst


    " split window
    set splitright
    nnoremap <C-w>_ <C-w>n
    nnoremap <C-W><bar> :vnew<Enter>

    " make Alt+key being recognized not as <Esc>key
    " [200~https://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
    let c='a'
    while c <= 'z'
      exec "set <A-".c.">=\e".c
      exec "imap \e".c." <A-".c.">"
      let c = nr2char(1+char2nr(c))
    endw
    
    set timeout ttimeoutlen=50


" -OWN-NAVIGATION---------------------------------------------------------------

    " set '/' as leader and '\' for searching
    " nnoremap <Bslash> /
    " let mapleader = "/"

    " Wrap movement between lines
    set whichwrap+=<,>,h,l,[,]

    " make HJKL (Shift+hjkl) move with selection  // useless
    " nnoremap H vh
    " vnoremap H h
    " nnoremap J vj0
    " vnoremap J j
    " nnoremap K vk
    " vnoremap K k
    " nnoremap L vl
    " vnoremap L l
    
    " make Crtl+Shirt+jk move line(s) // Shift is not recognized :( 
    nnoremap <C-S-k> :m-2<CR>
    nnoremap <C-S-j> :m+<CR>
    inoremap <C-S-k> <Esc>:m-2<CR>i
    inoremap <C-S-j> <Esc>:m+<CR>i
    vnoremap <C-S-k> :m '<-2<CR>gv=gv
    vnoremap <C-S-j> :m '>+1<CR>gv=gv
    
    " Alt + hjkl movement in INSERT mode
    " inoremap <M-h> <left>
    " inoremap <M-j> <down>
    " inoremap <M-k> <up>
    " inoremap <M-l> <right>
    " doesnt work with current konsole :(
    " SOLUTION FOR THIS KONSOLE
    " make Alt+key being recognized not as <Esc>key
    " [200~https://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
    let c='a'
    while c <= 'z'
      exec "set <A-".c.">=\e".c
      exec "imap \e".c." <A-".c.">"
      let c = nr2char(1+char2nr(c))
    endw
    set timeout ttimeoutlen=50
    inoremap è <left>
    inoremap ê <down>
    inoremap ë <up>
    inoremap ì <right>


" -SUMBODE'S-SHORTCUTS----------------------------------------------------------

    " setting timeout
    let g:submode_timeoutlen = 650
    
    " " undo / redo with: g[-+]*
    " call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
    " call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
    " call submode#leave_with('undo/redo', 'n', '', '<Esc>')
    " call submode#map('undo/redo', 'n', '', '-', 'g-')
    " call submode#map('undo/redo', 'n', '', '+', 'g+')
    
    " horizontal resize split
    call submode#enter_with('hresize', 'n', '', '<C-w>H', '<C-w><')
    call submode#enter_with('hresize', 'n', '', '<C-w>L', '<C-w>>')
    call submode#leave_with('hresize', 'n', '', '<Esc>')
    call submode#map('hresize', 'n', '', 'H', '<C-w><')
    call submode#map('hresize', 'n', '', 'L', '<C-w>>')
    
    " vertical resize split
    call submode#enter_with('vresize', 'n', '', '<C-w>J', '<C-w>+')
    call submode#enter_with('vresize', 'n', '', '<C-w>K', '<C-w>-')
    call submode#leave_with('vresize', 'n', '', '<Esc>')
    call submode#map('vresize', 'n', '', 'J', '<C-w>+')
    call submode#map('vresize', 'n', '', 'K', '<C-w>-')


" -NERDCOMMENTER-SETTING--------------------------------------------------------

    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    
    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1
    
    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
    
    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1
    
    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1
    
    " Enable NERDCommenterToggle to check all selected lines is commented or not
    let g:NERDToggleCheckAllLines = 1


" -YouCompleteMe-SETTINGS--DELETED----------------------------------------------

    " let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
    " " let g:ycm_use_clangd = 0
    " " let g:ycm_clangd_binary_path = '/home/dawid/installpackages/clang/bin/clangd'
    " " let g:ycm_clang_binary_path = '/home/dawid/installpackages/clang/bin/clang'
    " " let g:ycm_server_python_interpreter = '/usr/bin/python2'
    "
    " " let g:ycm_max_diagnostics_to_display = 0
    "
    " let g:ycm_confirm_extra_conf=0
    " " let g:ycm_seed_identifiers_with_syntax = 1
    " " let g:ycm_collect_identifiers_from_tags_files = 1
    "
    " " let g:ycm_server_keep_logfiles = 1
    " " let g:ycm_server_log_level = 'debug'
    "
    " nnoremap f :YcmCompleter FixIt<Enter>


" -ANYFOLD-SETTINGS-------------------------------------------------------------

    autocmd Filetype * AnyFoldActivate               " activate for all filetypes
    " autocmd Filetype <your-filetype> AnyFoldActivate " activate for a specific filetype
    
    " set foldlevel=0  " close all folds
    " set foldlevel=2
    set foldlevel=99 " open all folds

    " set foldmethod=syntax


" -NERDTREE-SETTINGS------------------------------------------------------------

    nnoremap n :NERDTree<Enter>

    " autoopen when open vim on directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    
    " autoquit when only nerdtree left
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " let g:NERDTreeMapOpenVSplit = <Enter>


" -COC.nvim-SETTINGS------------------------------------------------------------

    " May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
    " utf-8 byte sequence
    set encoding=utf-8
    " Some servers have issues with backup files, see #649
    set nobackup
    set nowritebackup

    " Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
    " delays and poor user experience
    set updatetime=300

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call ShowDocumentation()<CR>

    function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
      else
        call feedkeys('K', 'in')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s)
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying code actions to the selected code block
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying code actions at the cursor position
    nmap <leader>ac  <Plug>(coc-codeaction-cursor)
    " Remap keys for apply code actions affect whole buffer
    nmap <leader>as  <Plug>(coc-codeaction-source)
    " Apply the most preferred quickfix action to fix diagnostic on the current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Remap keys for applying refactor code actions
    nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
    xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
    nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

    " Run the Code Lens action on the current line
    nmap <leader>cl  <Plug>(coc-codelens-action)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Remap <C-f> and <C-b> to scroll float windows/popups
    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Use CTRL-S for selections ranges
    " Requires 'textDocument/selectionRange' support of language server
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer
    command! -nargs=0 Format :call CocActionAsync('format')

    " Add `:Fold` command to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ------------------------------------------------------------------------------

