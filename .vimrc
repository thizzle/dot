" General Editor Configuration {{{
set autoindent    " detect indentation automatically on new lines
set backspace=2   " allow backspacing over autoindent, line breaks, etc.
set expandtab     " use spaces instead of tabs in Insert mode
set laststatus=2  " display status line always
set mouse=a       " enable mouse support in all modes
set nocompatible  " be iMproved, required
set number        " show line numbers
set wildmenu      " visual auto-complete
set showmatch     " visually match parenthetical characters
set tabstop=2 shiftwidth=2 softtabstop=2
set foldenable
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested fold max
set foldmethod=syntax " syntax highlighting determines fold levels

set grepprg=ag\ --vimgrep " use ripgrep in place of grep

set background=dark
colorscheme slate

syntax on

filetype on
filetype indent on
filetype plugin on
" }}}

" Fuzzy file-locating with CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'ag %s -l --no-color -g ""'
" }}}

" Autocompletion with Neocomplete {{{
set completeopt-=preview

let g:acp_enableAtStartup = 0           " disable AutoComplPop
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
" }}}

" Tagbar {{{
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
" }}}

" Key Mappings - General {{{
nmap <F8> :TagbarToggle<CR>

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" }}}

" Key Mappings - File-type specific {{{
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au Filetype ruby nmap <Leader>t :call RunCurrentSpecFile()<CR>
au Filetype ruby nmap <Leader>s :call RunNearestSpec()<CR>
" }}}

" Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" general
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-dispatch'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" javascript
Plugin 'pangloss/vim-javascript'
Plugin 'flowtype/vim-flow'

" ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rails'

" go
Plugin 'fatih/vim-go'

call vundle#end()
" }}}

let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"

set rtp+=/usr/local/Cellar/powerline/2.3/lib/python2.7/site-packages/powerline/bindings/vim

" vim:foldmethod=marker:foldlevel=0
