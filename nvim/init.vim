:set nu
:set rnu
:set shiftwidth=4
:set tabstop=4
:set autoindent
:set smarttab
:set softtabstop=4
:set mouse=a
:set clipboard=unnamed

call plug#begin()

	" NeuralNine
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ryanoasis/vim-devicons'
" Plug 'https://github.com/tc50cal/vim-terminal'
" Plug 'https://github.com/wincent/terminus'
Plug 'https://github.com/PangPangPangPangPang/vim-terminal'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/neoclide/coc.nvim', {'do': { -> coc#util#install() } }
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Brodie Robertson
Plug 'https://github.com/alvan/vim-closetag'
" COC-Pairs
" Vim-surround

	" Monsterlessons Academy
Plug 'https://github.com/Yggdroot/indentLine'
Plug 'https://github.com/machakann/vim-highlightedyank'
" COC-prettier
" COC-eslint

	" Essential Tools
Plug 'https://github.com/jistr/vim-nerdtree-tabs'
" Plug 'https://github.com/baopham/vim-nerdtree-unfocus'
Plug 'https://github.com/leafOfTree/vim-matchtag'
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/prettier/vim-prettier'
Plug 'https://github.com/junegunn/rainbow_parentheses.vim'
Plug 'https://github.com/adi/vim-indent-rainbow'
" Plug 'https://github.com/ycm-core/YouCompleteMe'
" Plug 'https://github.com/lukhio/vim-mapping-conflicts'

	" Syntax Highlighting`
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/hail2u/vim-css3-syntax'
" Plug 'https://github.com/fremff/vim-css-syntax'
" Plug 'https://github.com/mxw/vim-jsx'
" Plug 'https://github.com/mgechev/vim-jsx'
" Plug 'https://github.com/neoclide/vim-jsx-improve'
Plug 'https://github.com/maxmellon/vim-jsx-pretty'


call plug#end()

silent! colorscheme molokai

" autocmd vimenter * TerminalSplit bash
" autocmd vimenter * terminal

nmap <F8> :TagbarToggle<CR>

	" ///Nerd Tree///
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-q> :NERDTreeRefreshRoot<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

" autocmd vimenter * NERDTreeTabsOpen
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowHidden=1

	" ///Conquer of completion///

let g:coc_global_extensions = [
\ 'coc-ultisnips',
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-css',
\ 'coc-highlight',
\ 'coc-pairs',
\ 'coc-emmet',
\ 'coc-eslint',
\ 'coc-prettier',
\ ]

	" ///Closetag///

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.tsx'

let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.jsx,*.tsx'

let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx,tsx'

let g:closetag_xhtml_filetypes = 'xhtml,js,jsx,tsx'

let g:closetag_emptyTags_caseSensitive = 1

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

let g:closetag_shortcut = '>'

let g:closetag_close_shortcut = '<leader>>'

	" ///Raibow Parentheses///

augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,javascript,javascriptreact,typescript,typescriptreact RainbowParentheses
augroup END

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{','}']]

" List of colors that you do not want. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234]

" command! -nargs=0 Prettier :CocCommand prettier.formatFile "COC-Prettier

	" ///XSEL///
vnoremap <C-c> :w !xsel -i -b<CR><CR>
" noremap <C-v> :w !xsel -o -b<CR><CR>

	" ///Tabs///
map <S-A-t> :tabnew<CR>
map <S-A-w> :tabclose<CR>
map <S-A-PageDown> :tabnext<CR>
map <S-A-PageUp> :tabprevious<CR>
map <S-A-m> :tabmove<CR>

map <A-f> :noh<CR>

	" ///Line-Jump///
map <C-Up> 5k
map <C-k> 5k
noremap <C-Down> 5j
map <C-j> 5j

" map <C-h> <C-Left>
" map <C-l> <C-Right>

	" ///Terminal///
map <A-t> :VSTerminalOpenNew<CR>
map ` :VSTerminalToggle<CR>

map <A-1> :VSTerminalOpenWithIndex 1<CR>
map <A-2> :VSTerminalOpenWithIndex 2<CR>
map <A-3> :VSTerminalOpenWithIndex 3<CR>
map <A-4> :VSTerminalOpenWithIndex 4<CR>
map <A-5> :VSTerminalOpenWithIndex 5<CR>
map <A-6> :VSTerminalOpenWithIndex 6<CR>
map <A-7> :VSTerminalOpenWithIndex 7<CR>
map <A-8> :VSTerminalOpenWithIndex 8<CR>
map <A-9> :VSTerminalOpenWithIndex 9<CR>

map <C-1> :VSTerminalDeleteWithIndex 1<CR>
map <C-2> :VSTerminalDeleteWithIndex 2<CR>
map <C-3> :VSTerminalDeleteWithIndex 3<CR>
map <C-4> :VSTerminalDeleteWithIndex 4<CR>
map <C-5> :VSTerminalDeleteWithIndex 5<CR>
map <C-6> :VSTerminalDeleteWithIndex 6<CR>
map <C-7> :VSTerminalDeleteWithIndex 7<CR>
map <C-8> :VSTerminalDeleteWithIndex 8<CR>
map <C-9> :VSTerminalDeleteWithIndex 9<CR>

" map <S-Esc> 

tnoremap <Esc> <C-\><C-n>


	" ///Buffer Switching///
map <M-k> <C-w><Up>
" tnoremap <C-S-Up> <C-w><Up>
map <M-j> <C-w><Down>
map <M-h> <C-w><Left>
map <M-l> <C-w><Right>

	" ///Disable quote concealing in JSON files///
let g:vim_json_syntax_conceal = 0
let g:indentLine_setConceal = 0


	" ///Prettier///
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

	" ///COC-Prettier/Official///

map <C-S-f> :Prettier<CR>

vmap <C-f>  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
