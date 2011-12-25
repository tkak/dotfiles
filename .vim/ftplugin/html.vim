compiler tidy
setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ --gnu-emacs\ yes\ \"%\"
nmap <buffer> <special> <silent> <F11> :!tidy -config ~/.tidyrc -quiet -modify "%"<CR>
set expandtab
set tabstop=2
