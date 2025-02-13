# Useful (n)vim commands for my setup

- gd: go to definition. Related: ctrl-o will take you back.

## Movement
- [{: Go to start of block starting with {
- }]: Go to end of block enidng with }
- %: Go to end of currently hovered bock (gotta be on top of it)
- ;: Repeat latest f, F, t or T
- ,: Repeat latest f, F, t or T in opposite direction

## Replace surrounding characters 
- <leader>sr'": [R]eplaces a surrounding characters from 'word' to "word"
- <leader>sd': [D]eletes a surrounding characters ' from 'word'

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

## Splits 
- ctrl-w + v: open vertical split
- ctrl-w + s: open horizontal split

## Marks 
Marks allow you to jump through files like "bookmarks" 
- m[some character]: save bookmark on character, for example 'ma'.
- '[some character]: navigate to mark on character, for example 'a 

## Other 
- :norm - execute normal mode sequence as a command. Useful for repeating same stuff on multiple lines
- (in normal mode) gr: find references for variable

# Useful terminal commands 

## Git 
- git resolve conflict using incoming changes: `git checkout --theirs path/to/file`
- see first commit on branch `git log master..[branch] --oneline | tail -1`

## Imagemagick/mogrify
- convert heic image to jpg: `mogrify -format jpg IMG_1103.HEIC`

## Config versioning 
- `config [add/commit/any git command]`: used for version control of the dotfiles repository.
