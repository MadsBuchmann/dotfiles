" My commands and aliases 

" Open current file with default application 
command! Finder !open % -a finder

" Open current file in nerd tree
command -nargs=* -complete=file NF :NERDTreeFind

" Open same file with different line ending 
command -nargs=1 -complete=file -bar Vex :vsplit %:r.<args>
command -nargs=1 -complete=file -bar Oex :e %:r.<args>
command -nargs=* -complete=file -bar Oh :Oex html
command -nargs=* -complete=file -bar Vh :Vex html
command -nargs=* -complete=file -bar Oc :Oex scss
command -nargs=* -complete=file -bar Vc :Vex scss
command -nargs=* -complete=file -bar Ot :Oex ts
command -nargs=* -complete=file -bar Vt :Vex ts
command -nargs=* -complete=file -bar Ocomp :Oh|:Vc|:Vt

" Shortcut for Vertical Resize 
command -nargs=1 -complete=file VR :vertical resize <args>

" Run prettier on current file 
 command! -nargs=0 Prettier :CocCommand prettier.formatFile 
