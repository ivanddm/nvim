" General
augroup general_au
  autocmd!
  au BufLeave,FocusLost * :wa
  au FocusGained,BufEnter * :checktime
  " autocmd VimEnter * set cmdheight=1
augroup END

" Markdown autocmds
augroup markdow_files
  autocmd!
  " au FileType markdown setlocal nonumber nocursorline
  autocmd BufEnter,WinEnter *.md call clearmatches() " clears ColorColum highlight
  autocmd FileType markdown setlocal commentstring=<!--\ %s\ -->
augroup END

" javascript autocmds
augroup js_files
  autocmd!
  autocmd FileType javascript inoremap ,= <space>=><space>
augroup END

" " set numberwidth conditional on window width
augroup center_buffer
  autocmd!
  let b:bg_color = synIDattr(hlID("Normal"), 'bg', 'gui')
  " let g:win_count = winnr('$')
  " autocmd BufEnter,BufWinLeave,WinEnter,WinLeave,VimResized,VimEnter * if winwidth(0) > 160
  autocmd BufEnter,WinEnter,WinLeave,VimResized,VimEnter * if winwidth(0) > 150
    \ |   setlocal numberwidth=20 foldcolumn=12
    \ |   highlight FoldColumn guibg=b:bg_color guifg=b:bg_color
    \ | elseif winwidth(0) > 120
    \ |   setlocal numberwidth=10 foldcolumn=10
    \ |   highlight FoldColumn guibg=b:bg_color
    \ | elseif winwidth(0) > 85
    \ |   setlocal numberwidth=4 foldcolumn=0
    \ |   highlight FoldColumn guibg=b:bg_color
    \ | else
    \ |   setlocal numberwidth=3 foldcolumn=0
    \ | endif
augroup END

" Autospelling for tex and md files
augroup spell_tex_md
    autocmd!
    autocmd FileType tex setlocal spell spelllang=en_us
    autocmd FileType markdown setlocal spell spelllang=en_us
augroup END

" Run ruby, bash, python, javascript, markdown files in terminal
augroup AutoRun
    autocmd!
    autocmd FileType ruby nnoremap <buffer> <F5> :w<CR>:cd %:p:h<CR>:!ruby %<CR>
    autocmd FileType python nnoremap <buffer> <F5> :w<CR>:cd %:p:h<CR>:!python %<CR>
    autocmd FileType sh nnoremap <buffer> <F5> :w<CR>:cd %:p:h<CR>:!./%<CR>
    autocmd FileType markdown nnoremap <buffer> <F5> :w<CR>:silent !open -a Marked\ 2 "%"<CR>
    autocmd FileType markdown nnoremap <buffer> <S-F5> :w<CR>:silent !pandoc "%" -o "%:r.pdf"<CR>
    autocmd FileType markdown nnoremap <buffer> <leader>pb :w<CR>:silent
          \ !pandoc "%" -t beamer -o "%:r.pdf"<CR>
    " Reveal file in finder without changing the working dir in vim
    autocmd FileType * nnoremap <buffer> <leader>; :w<CR>:silent !open -R "%"<CR>
augroup END

