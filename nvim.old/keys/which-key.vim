" GENERAL

" Map leader to which_key
  nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
  vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
  let g:which_key_map =  {}

" Define a separator
  let g:which_key_sep = '→'

" Not a fan of floating windows for this
  let g:which_key_use_floating_win = 0

" Change the colors if you want
  highlight default link WhichKey          Operator
  highlight default link WhichKeySeperator DiffAdded
  highlight default link WhichKeyGroup     Identifier
  highlight default link WhichKeyDesc      Function

" Hide status line
  autocmd! FileType which_key
  autocmd  FileType which_key set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" SINGLE MAPPINGS
let g:which_key_map['d'] = [ ':bd!'                  , 'delete buffer']
let g:which_key_map['e'] = [ ':CocCommand explorer'  , 'explorer' ]
let g:which_key_map['q'] = [ ':wqa!'                  , 'quit' ]
let g:which_key_map['w'] = [ ':w'                    , 'write' ]
let g:which_key_map['c'] = [ 'VimtexCompile'         , 'compile' ]
let g:which_key_map['p'] = [ 'VimtexView'            , 'preview' ]
let g:which_key_map['i'] = [ 'VimtexTocOpen'         , 'index' ]
let g:which_key_map['k'] = [ 'VimtexClean'           , 'kill aux' ]
let g:which_key_map['l'] = [ 'VimtexErrors'          , 'error log' ]
let g:which_key_map['r'] = [ ':source $MYVIMRC'      , 'reload config' ]
let g:which_key_map['u'] = [ 'UndotreeToggle'        , 'undo' ]
let g:which_key_map['k'] = [ ':Commentary'        , 'comment' ]
let g:which_key_map['d'] = [ ':copen'        ,'diagnostics' ]
let g:which_key_map['D'] = [ ':ccl'        , 'close diagnostics' ]
" let g:which_key_map['t'] = [ ':OnlineThesaurusCurrentWord<CR>'      , 'thesaurus' ]
" let g:which_key_map['j'] = [ '<Plug>(easymotion-prefix)' , 'motion' ]


" GROUP MAPPINGS

" P is for PANDOC
let g:which_key_map.P = {
  \ 'name' : '+pandoc' ,
  \ 'w' : [':FloatermNew! --disposable pandoc %:p -o %:p:r.docx' , 'word'],
  \ 'm' : [':FloatermNew! --disposable pandoc %:p -o %:p:r.md'   , 'markdown'],
  \ 'h' : [':FloatermNew! --disposable pandoc %:p -o %:p:r.html' , 'html'],
  \ 'l' : [':FloatermNew! --disposable pandoc %:p -o %:p:r.tex'  , 'latex'],
  \ 'p' : [':FloatermNew! --disposable pandoc %:p -o %:p:r.pdf'  , 'pdf'],
  \ 'x' : [':FloatermNew! echo "run: unoconv -f pdf path-to.docx"'  , 'word to pdf'],
  \ }

  " \ 'w' : [':Pandoc docx'           , 'to word from open'],
  " \ 'm' : [':Pandoc md'             , 'to markdown from open'],
  " \ 'h' : [':Pandoc html'           , 'to html from open'],
  " \ 'l' : [':Pandoc latex'          , 'to latex from open'],
  " \ 'p' : [':Pandoc pdf'            , 'to pdf from open'],

" b is for BUFFER 
let g:which_key_map.b = {
  \ 'name' : '+buffer' ,
  \ 'p' : [':BufferPick' ,     'Pick Buffer'],
  \ 'c' : [':BufferClose',    'Close Buffer'],
  \ 'b' : [':BufferOrderByBufferNumber',    'Order by Buffer Number'],
  \ 'd' : [':BufferOrderByDirectory',    'Order by Directory'],
  \ 'l' : [':BufferOrderByLanguage',    'Order by Language'],
  \ 'w' : [':BufferOrderByWindowNumber',    'Order by Number'],
  \ }

" s is for SESSIONS
let g:which_key_map.S = {
  \ 'name' : '+session' ,
  \ 's' : [':SSave'                , 'save session'],
  \ 'd' : [':SDelete!'              , 'delete session'],
  \ }

" m is for MARKDOWN
let g:which_key_map.m = {
  \ 'name' : '+markdown' ,
  \ 'a' : [':call PdfAnnots()<CR>'               , 'annotate'],
  \ 'k' : ['<Plug>MarkdownPreviewStop'           , 'kill preview'],
  \ 'p' : ['<Plug>MarkdownPreview'               , 'preview'],
  \ 's' : [':call markdown#SwitchStatus()<CR>'   , 'select item'],
  \ }

" COMMAND: pdfannots -o Beauty.md Beauty.pdf

  " \ 'F' : ['zA'                                  , 'fold all'],
  " \ 'f' : ['za'                                  , 'fold current'],

" y is for you SURROUND
let g:which_key_map.s = {
  \ 'name' : '+surround' ,
  \ 's' : ['<Plug>Ysurround'         , 'surround'],
  \ 'c' : ['<Plug>Csurround'         , 'change'],
  \ 'd' : ['<Plug>Dsurround'         , 'delete'],
  \ 'k' : ['dss'                     , 'kill'],
  \ }

" v is for VIEW
let g:which_key_map.v = {
  \ 'name' : '+view' ,
  \ 'y' : [':CocList -A --normal yank'               , 'yanks'],
  \ 'p' : ['Startify'                               , 'projects'],
  \ 'v' : [':FloatermNew! --disposable vifm'         , 'vifm'],
  \ }

  " \ 'l' : [':VimtexErrors'                           , 'build log' ],
  " \ 'a' : [':VimtexClean'                            , 'kill aux'],
  " \ 'i' : [':VimtexTocOpen'                          , 'index' ],

" a is for ACTIONS
let g:which_key_map.a = {
  \ 'name' : '+actions' ,
  \ 'b' : [':terminal bibexport -o %:p:r.bib %:p:r.aux'  , 'bib export'],
  \ 'g' : [':e ~/.config/nvim/templates/Glossary.tex', 'edit glossary'],
  \ 'e' : [':e ~/.config/nvim/snips/tex.snippets'    , 'edit snippets'],
  \ 't' : [':FloatermKill!'                          , 'kill terminals'],
  \ 'v' : [':FloatermNew! --disposable cd ~/.local/share/nvim/swap && ls -a', 'view swap'],
  \ 'k' : [':FloatermNew! --disposable cd ~/.local/share/nvim/swap && rm *.swp', 'kill swap'],
  \ 'd' : [':CocDisable'                             , 'delete coc'],
  \ 'r' : [':CocEnable'                              , 'restore coc'],
  \ }

" f is for FIND
let g:which_key_map.f = {
  \ 'name' : '+find' ,
  \ 'f' : [':Telescope current_buffer_fuzzy_find',     'in file'],
  \ 'c' : [':Telescope keymaps',                      'command'],
  \ 'd' : [':Telescope find_files',             'files in current directory'],
  \ 'p' : [':Telescope live_grep',                 'in project'],
  \ 'b' : [':Telescope buffers',                       'buffer'],
  \ 'r' : [':Telescope oldfiles',               'recent files'],
  \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
