" NOTES
" check mapping with :verbose map ____

" Unmappings
  " nunmap <space>ft
  nnoremap <c-z> <nop>

" Move to word
  map  <C-f> <Plug>(easymotion-bd-w)
  nmap <C-f> <Plug>(easymotion-overwin-w)

" Stay centered
  nnoremap m zz

" Terminal mappings
  nnoremap <C-t> :FloatermToggle<CR>
  tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>
  " nnoremap  <leader>t :tab ter<CR>
  " noremap! <leader>t <Esc>:FloatermToggle<CR>i
  " tnoremap  <leader>d <C-\><C-n>:bd!<CR>

" Better nav for omnicomplete
  inoremap <expr> <c-j> ("\<C-n>")
  inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
  nnoremap <M-h>    :vertical resize -2<CR>
  nnoremap <M-l>    :vertical resize +2<CR>
  " nnoremap <M-j>    :resize -2<CR>
  " nnoremap <M-k>    :resize +2<CR>

" remap Y to what it should be
  nnoremap <S-y> y$
  
" remap Return to save
  nmap <CR> <plug>(vimtex-context-menu)

" Drag lines
  vnoremap <M-j> :m'>+<CR>gv
  vnoremap <M-k> :m-2<CR>gv
  nnoremap <M-j> ddp
  nnoremap <M-k> ddkP
  inoremap <M-j> <esc>ddp
  inoremap <M-k> <esc>ddkP
  " xnoremap <silent> <M-k> :call wincent#mappings#visual#move_up()<CR>
  " xnoremap <silent> <M-j> :call wincent#mappings#visual#move_down()<CR>
  " vnoremap <M-j> :m '>+1<CR>gv
  " vnoremap <M-k> :m '<-2<CR>gv
  " nnoremap <M-j> <S-v> :m '>+1<CR>gv<esc>
  " nnoremap <M-k> <S-v> :m '<-2<CR>gv<esc>
  " inoremap <M-j> <esc><S-v> :m '>+1<CR>gv<esc>
  " inoremap <M-k> <esc><S-v> :m '<-2<CR>gv<esc>
  " vnoremap <M-j> dpgv
  " vnoremap <M-k> dkPgv
  " inoremap <M-j> <esc>:m'>+<CR>
  " inoremap <M-k> <esc>:m-2<CR>

" Backspace moves to next buffer
  " NOTE: TAB and <C-i> amount to the same in the terminal and so best to
  " avoid remapping TAB so as to preserve the functionality of <C-i>
  " SHIFT-TAB will go back a buffer
  nnoremap <BS> :bnext<CR>
  nnoremap <S-TAB> :bprevious<CR>

" <TAB>: completion.
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" jump to end of previous word
  nnoremap E ge

" better tabbing
  vnoremap > >gv
  vnoremap < <gv
  nnoremap > <S-v>><esc>
  nnoremap < <S-v><<esc>

" Better window navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

" Horizontal line movement
  nnoremap <S-h> g^
  nnoremap <S-l> g$
  vnoremap <S-h> g^
  vnoremap <S-l> g$

" Open Manual for word
  nnoremap <M-m> :execute "help " . expand("<cword>")<cr>
  " noremap <C-m> :call <SNR>23_show_documentation()<CR>
  " noremap <C-m> :help expand("<cword>")<cr>

" Display line movements
  nnoremap <S-k> gk
  nnoremap <S-j> gj
  vnoremap <S-k> gk
  vnoremap <S-j> gj

" Comment out line
  nnoremap <C-\> :Commentary<CR>
  vnoremap <C-\> :Commentary<CR>

" Fuzzy Search
  nnoremap <C-p> :Files<CR>

" Kill search on escape
  nnoremap <esc> :noh<return><esc>

" Spelling: http://vimdoc.sourceforge.net/htmldoc/spell.html
  nnoremap <C-s> a<C-X><C-S>
  " function! FzfSpellSink(word)
  "   exe 'normal! "_ciw'.a:word
  " endfunction
  " function! FzfSpell()
  "   let suggestions = spellsuggest(expand("<cword>"))
  "   return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
  " endfunction
  " nnoremap z= :call FzfSpell()<CR>


  inoremap <silent><expr> <C-j>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gr <Plug>(coc-references)
  " nmap <silent> gy <Plug>(coc-type-definition)
  " nmap <silent> gi <Plug>(coc-implementation)

" Markdown
  let g:markdown_mapping_switch_status = '<Space>ms'
  " nnoremap <Space>ft <Space>mf
  " nmap <C-s> <Plug>MarkdownPreview
  " nmap <M-s> <Plug>MarkdownPreviewStop
  " nmap <C-p> <Plug>MarkdownPreviewToggle

" Snippets in Coc
  " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)
  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<CR>'
  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<TAB>'
  " scroll through autocomplete in commandline tab-menu
    cnoremap <C-o> <C-n>

  " Move to previous/next
    nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
    nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
    " Re-order to previous/next
    nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
    nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
    " Goto buffer in position...
    nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
    nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
    nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
    nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
    nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
    nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
    nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
    nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
    nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
    nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
    " Pin/unpin buffer
    nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
    " Close buffer
    nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
    " Wipeout buffer
    "                          :BufferWipeout
    " Close commands
    "                          :BufferCloseAllButCurrent
    "                          :BufferCloseAllButPinned
    "                          :BufferCloseAllButCurrentOrPinned
    "                          :BufferCloseBuffersLeft
    "                          :BufferCloseBuffersRight
    " Magic buffer-picking mode
    nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
    " Sort automatically by...
    nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
    nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
    nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
    nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

    " Other:
    " :BarbarEnable - enables barbar (enabled by default)
    " :BarbarDisable - very bad command, should never be used
