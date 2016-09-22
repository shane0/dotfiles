" sdothum - 2016 (c) wtfpl

" User Interface
" ▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂

  " Behaviour ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " ................................................................ Attention

      set noerrorbells                      " don't beep
      set gcr=a:blinkon0                    " disable cursor blink
      set mousehide                         " hide mouse when typing
      set shortmess+=filmnrxoOtT            " abbrev. of messages (avoids "hit enter")
      set visualbell                        " no sounds

    " .................................................................. Display

      set t_Co=256                          " 256 color support
      set viewoptions=folds,options,cursor,unix,slash
      set virtualedit=block                 " allow virtual editing in Visual block mode
      " set virtualedit=onemore             " allow for cursor beyond last character
      set winminheight=0                    " windows can be 0 line high
      set wrap                              " wrap lines for viewing

    " ................................................................ Scrolling

      " set scrolljump=8                    " lines to scroll when cursor leaves screen
      if $HOST == 'monad'
        set scrolloff=3
      else
        set scrolloff=5
      endif
      let g:scrolloff = &scrolloff
      set sidescroll=1                      " smooth scrolling by 1 column
      set sidescrolloff=1
      " easier horizontal scrolling
      noremap zl             zL
      noremap zh             zH

      " space now commandeered as leader by spacemacs wannabe :-)
      " " manual jump scrolling
      " if $HOST == 'monad'
      "   nnoremap <Space>   10jzz
      "   nnoremap <S-Space> 10kzz
      " else
      "   nnoremap <Space>   30jzz
      "   nnoremap <S-Space> 30kzz
      " endif

  " Terminal ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " ..................................................................... Font

      scriptencoding utf-8
      set encoding=utf-8                    " necessary to show unicode glyphs

    " ................................................................... Cursor

      set cursorline                        " highlight current line

      set guicursor=a:block                 " mode aware cursors, see solarized functions.vim
      set guicursor+=o:hor50-Cursor
      set guicursor+=n:Cursor
      set guicursor+=i-ci-sm:ver25-InsertCursor
      set guicursor+=r-cr:hor15-ReplaceCursor
      set guicursor+=c:CommandCursor
      set guicursor+=v-ve:VisualCursor
      set guicursor+=a:blinkon0

    " ............................... Gvim Options (make it look like terminal!)

      set tabpagemax=10                     " want zero file tabs but defaults to 1 :-(
      set guioptions+=LlRrb                 " hide scrollbars
      set guioptions-=LlRrb
      set guioptions-=m                     " no menubar
      set guioptions-=T                     " no toolbar

      " Toggle full screen (for notion fkey compatibility)
      " map <silent><S-F12> :call system('wmctrl -ir ' . v:windowid . ' -b toggle,fullscreen')<CR>
      " Toggle Menu and Toolbar
      map <silent><F12>     :if &guioptions =~# 'T' <Bar>
        \ set guioptions-=T <Bar>
        \ set guioptions-=m <bar>
        \ else <Bar>
        \ set guioptions+=T <Bar>
        \ set guioptions+=m <Bar>
        \ endif<CR>

  " Look ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " ........................................................... Column margins

      " set colorcolumn=45,80               " highlight column
      set colorcolumn=0                     " highlight column
      " see ToggleColumn functions.vim
      " imap <S-F7>      <C-o>:set colorcolumn=
      " nmap <S-F7>      :set colorcolumn=
      nmap <leader><Bar> :set colorcolumn=

    " ............................................................. Line numbers

      set number                            " line numbers are good
      set relativenumber
      " autocmd! InsertEnter * :set number   " toggle relative line numbers
      " autocmd! InsertLeave * :set relativenumber " auto line numbers

    " ................................................... Status / command lines

      " see Lightline plugins.vim
      set laststatus=2                      " always show status line
      set ruler                             " show cursor position in status line
      set noshowcmd                         " show incomplete cmds in command line
      set noshowmode                        " show current mode in command line

  " Highlighting ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " ...................................................... White space markers

      set nolist                           " display tabs and trailing spaces visually
      set listchars="tab:▸\<Space>"

      " set listchars+=trail:_
      set listchars+=trail:·
      set listchars+=nbsp:.
      set listchars+=extends:>
      set listchars+=precedes:<
      " set listchars+=eol:¬

      " toggle trailing white space highlight, see ToggleSpaces functions.vim
      " nmap <silent><F2> :set list!<CR>

    " ...................................................... Syntax highlighting

      set omnifunc=syntaxcomplete#Complete
      syntax on                             " turn on syntax highlighting

" ui.vim
