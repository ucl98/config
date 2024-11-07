## Shortcuts
#### Vim
- `:e` - reload document (discard changes)

#### Search
- `space \` - Grep serach in buffer
- `spcae s \` - Grep search in open files 
- `space s n` - Search in my workflows
- `space s h` - Search help tags
- `space s k` - Search keymaps
- `space s f` - Search files
- `space s s` - Search select Telescope
- `space s w` - Search current word
- `space s g` - Search by grep
- `space s d` - Search diagnostics
- `space s r` - Search resume
- `space s .` - Search recent files
- `space space` - Find existing buffers

#### LSP (Language Server Protocol)
- `g d` - Go to definition
- `g r` - Go to references
- `g I` - Go to implementation
- `K` - show definition
- `space D` - Type definition
- `space d s` - Docment symbols
- `space w s` - Workspace symbols
- `space r n` - Rename
- `space c a` - Code action

#### Vi - multi-cursor
- `ctrl v` - allows selecting multiple lines
- `I` - inserts at the beginning
- `A` - inserts at the end
- `ctrl v } $ A` allows adding characters to the end of all lines

#### Others
- `space f` - auto-format
- `ctrl o` - jump back

### Known Commands
#### Cosmetics
- `space t t` - toggle transperancy

#### Leap
- `s <charc` - search for character forward
- `S <charc` - search for character backward

#### Tmux
- `ctrl a v` - split vertically
- `ctrl a s` - split horizontally
- `ctrl a S` - overview over all windows and panels
    - cloe a window using `x` and accept with `y`
- `ctrl a ctrl x` - close panel
- `ctrl a ctrl d` - detach tmux session
- `ctrl a z` - focus panel
- `ctrl a c` - create a new window
- `ctrl a ctrl w` - move to previous window
- `ctrl a ctrl r` - move to next window
- `ctrl a <h, j, k , v>` - navigate the panels
- `ctrl a [` - enter vi copy mode to access vi-motions in the terminal
- `:new -s <name>` - create a new window
- `:rename <new_name>` - renames windown
- `:swap-pane -U` - swap panes upside down
- `:list-sessions` - list all the current sessions
- `ctrl a [` - enter copy mode
    - `space` - go into select mode
    - `enter` - exit copy mode
- `ctrl b ]` - paste content

#### Terminal
- `ctrl c` - copy to clipboard
- `ctrl v` - paste from clibpoard
- `ctrl x` - cancel input
- `sudo E -s` - switches to root (allows nvim to execute with root priv.)

#### Vim
- `ctrl w q` - close a window
- `ctrl w o` - close all other windows
- `ctrl w s` - split window horizontally
- `ctrl w v` - split window vertically
- `ctrl w <h, j, k, v>` - navigate the 
- `z z` - center
    - `z t`: center top
    - `z b`: center bottom
- `m <key>` - set a marker at key
- `' <key>` - jump to set marker
- `:marker` - view on all the markers
- `" <key> y` - yank to key
- `" <key> p` - past from key
- `ctrl >` - move window to the right
    - can be used with `ctrl <num> >`
- `ctrl <` - move window to the left
- `gc` - command highlighted text or use vi-motions
    - `gc` + ` >` - indent line
- `K` - hover definition
- `:s/\<word\>/replacement/g` - replace only an entire word

<!-- #### Treesitter -->
<!-- - `space f f` - fuzzy-search files -->
<!-- - `space f m` - navigate harpoon marker -->
<!-- - `space f d` - search across files -->
<!-- - `spcae f b` - navigate buffer -->

#### Undotree
- `space r r` - Toggles the Undotree

#### Harpoon
- `space m m` - add file to harppon 
- `space h t` - view/manipulate all harpoon files
- `ctrl <q, e>` - show previous/next harpoon file
- `<1, 2, 3, 4>` - navigate to the respective harpoon file

#### ChatGPT
- `space g t` - toggle chat
- `space g r` - new window

#### Codewindow
- `space m o` - open mini-map
- `space m c` - close mini-map
<!-- - `space m o` - toggle code window -->

#### Posix
- `where <app>` - path to the app
- `eval "$(<command>)"` - executes given command (useful  for .zshrc)

#### Conda
- `conda create -n <env_name> python=<version> <depenencies> -c conda-forge`
- `conda env remove --name <env_name>`


