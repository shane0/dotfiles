" sdothum - 2016 (c) wtfpl

" Edit
" ▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂

  " Line ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " .............................................................. Insert line

      " continue inserting in new line a la textmate command-enter
      " ctrl-enter only works with gvim due to terminal limitation :-(
      " inoremap <C-CR>               <C-o>o
      " similarly, open curly braces and continue inserting in indented body
      inoremap <S-CR>                 <CR><C-o>O<Tab>

      " break line (in .wiki)
      nnoremap <silent><leader><S-CR> :silent set paste<CR>i<CR><ESC>:silent set nopaste<CR>i

      " insert blank line above/below
      nnoremap <silent><leader><Up>   :silent set paste<CR>m`O<Esc>``:silent set nopaste<CR>
      nnoremap <silent><leader><Down> :silent set paste<CR>m`o<Esc>``:silent set nopaste<CR>

    " ...................................................... Reformat paragraghs

      " select all
      nnoremap <C-a>            ggVG
      " retain cursor position for insert mode reformatting
      inoremap <silent><F4>     <Esc>lmZ{jv}kJvgq`Z:delmarks Z<CR>i
      " otherwise advance cursor to next paragraph
      nnoremap <F4>             {jv}kJvgq}}{j
      vnoremap <F4>             Jvgqj

    " .............................................................. Delete line

      " delete blank line above/below
      nnoremap <silent><C-Up>   m`:silent -g/\m^\s*$/d<CR>``:silent nohlsearch<CR>
      nnoremap <silent><C-Down> m`:silent +g/\m^\s*$/d<CR>``:silent nohlsearch<CR>

  " Text shift ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " .............................................................. Select text

      " extend paragraph selection
      vmap     <A-PageUp>   {
      vmap     <A-PageDown> }

    " .................................................................... Shift

      nnoremap <S-Left>     <<
      nnoremap <S-Right>    >>
      inoremap <S-Left>     <C-d>
      inoremap <S-Right>    <C-t>
      " preserve selection when indenting
      vnoremap <S-Right>    >gv
      vnoremap <S-Left>     <gv

      " move visual block with automatic alignment!
      vnoremap L            :m '<-2<CR>gv=gv
      vnoremap N            :m '>+1<CR>gv=gv

  " Text manipulation ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " ............................................................. Convert tabs

      :command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
      :command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

      nmap     <silent><leader><tab>         :silent retab<CR>
      nmap     <silent><leader><leader><tab> :silent Space2Tab<CR>
      vmap     <silent><leader><leader><tab> :silent Space2Tab<CR>
      nmap     <silent><leader><tab><Space>  :silent Tab2Space<CR>
      vmap     <silent><leader><tab><Space>  :silent Tab2Space<CR>

    " .................................................. Quote enclose selection

      " extend enclosing %V 1 char right to enclose last character of block
      vnoremap '                             :s/\%V\(.*\%V.\)/'\1'/<CR>:noh<CR>`>l
      vnoremap "                             :s/\%V\(.*\%V.\)/"\1"/<CR>:noh<CR>`>l

" edit.vim
