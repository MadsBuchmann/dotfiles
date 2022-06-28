# Useful (n)vim commands for my setup

- gd: go to definition. Related: ctrl-o will take you back.

## Movement
- [{: Go to start of block starting with {
- }]: Go to end of block enidng with }
- The above two can use any 
- ;: Repeat latest f, F, t or T
- ,: Repeat latest f, F, t or T in opposite direction

## Replace surrounding characters 
- cs'" changes a surrounding characters from 'word' to "word"
- cs"<p> changes surrounding characters from "word" to <p>word</p>
- cst' changes surrounding characters from <p>word</p> to 'word'. 

## Search & replace 
- `:windo <command>`: execute command in all visible windows 
- `:bufdo <command>`: execute command in all open buffers
- `:sball`: split screen to show all buffers
- `:windo %s/original/replace/g`: replace all instances of original with replace in all open windows

### Capture groups & reuse 
- `\(some regex expression in here\)`: enclose regex expression in capture group 
- `\0`: reuse entire search result 
- `\n`: reuse capture group n for example: `\1` to reuse capture group 1.

## Folding 
- zc: folds the current brackets 
- zo: open current fold
- zR: open all folds 

## Autocompletion (CoC)
- ctrl-n: next
- ctrl-p: previous

- ctrl-space: trigger auto-completion. If auto-completion is triggered, it will remove it (what i usually use esc for in vscode).
- shift-k: Show docs in preview window

## Other 
- \rn: rename variable globally
- :norm - execute normal mode sequence as a command. Useful for repeating same stuff on multiple lines

## Nerdtree 
- ctrl-n: toggle nerdtree
- :NerdTreeFind - open current buffer in file tree

## NERDCommenter 
- \c<space>: toggle comment, must be in visual mode

# Useful terminal commands 

## Git 
- git resolve conflict using incoming changes: `git checkout --theirs path/to/file`
- see first commit on branch `git log master..[branch] --oneline | tail -1`

## Imagemagick/mogrify
- convert heic image to jpg: `mogrify -format jpg IMG_1103.HEIC`

## Config versioning 
- `config [add/commit/any git command]`: used for version control of the dotfiles repository.
