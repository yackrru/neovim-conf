# Neovim conf
My personal configurations of Neovim.

## Prerequirements
- Neovim

## Set up
Install dein.vim.
```
git clone https://github.com/yackrru/neovim-conf.git ~/.config/nvim
~/.config/nvim/install.sh
```
Start Neovim and the plugin will be installed automatically.
```
nvim
```

## Keymaps
### Standard
- `Leader`: `;`
### Custom
|Key|Command|Description|
|:---|:---|:---|
|Space|`:b#`|Switch to the last buffer.|

## Plugins

### [NERDTree](https://github.com/preservim/nerdtree)
#### Custom key bindings as follows.
|Key|Command|Description|
|:---|:---|:---|
|Ctrl-t|`:NERDTree`|Open or Switch to NERDTree window.|
|Ctrl-c|`:NERDTreeClose`|Close NERDTree window.|
#### Key often used
|Key|Description|
|:---|:---|
|i|Open file with splitting window horizontally.|
|s|Open file with splitting window vertically.|
|O|Open directories recursively.|
|x|Close directories under focusing file or directory.|

### [NERD Commenter](https://github.com/preservim/nerdcommenter)
>The NERDTree is a file system explorer for the Vim editor. Using this plugin, users can visually browse complex directory hierarchies, quickly open files for reading or editing, and perform basic file system operations.

### [surround.vim](https://github.com/tpope/vim-surround)
>Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
The plugin provides mappings to easily delete, change and add such surroundings in pairs.

### [vim-airline](https://github.com/vim-airline/vim-airline)
If you want to display the `>` and `<` symbols in the status bar, install [Powerline](https://github.com/powerline/fonts#quick-installation) fonts.
Configure powerline/fonts on your terminal.
Finally add `let g:airline_powerline_fonts=1` to your `.config/nvim/local.vim`.
#### Custom key bindings as follows.
|Key|Command|Description|
|:---|:---|:---|
|Ctrl-p|`:bprevious`|Change buffer to previous tab.|
|Ctrl-n|`:bnext`|Change buffer to next tab.|

### [EasyMotion](https://github.com/easymotion/vim-easymotion)
>EasyMotion provides a much simpler way to use some motions in vim. It takes the <number> out of <number>w or <number>f{char} by highlighting all possible choices and allowing you to press one key to jump directly to the target.

### [vim-lsp](https://github.com/prabirshrestha/vim-lsp)
Multiple LanguageServers are automatically supported by using [vim-lsp-settings](https://github.com/mattn/vim-lsp-settings).  
However, `:LspInstallServer` command must be run for each file type.
#### Custom key bindings as follows.
|Key|Command|Description|
|:---|:---|:---|
|leader-d|`:LspDefinition`|Go to definition.|
|leader-f|`:LspDocumentFormat`|Format the entire document.|
|leader-h|`:LspHover`|Gets the hover information and displays it in the `preview-window`.|
|leader-i|`:LspImplementation`|Find all implementation of interface.|
|leader-n|`:LspRename`|Rename the symbol.|
|leader-r|`:LspReferences`|Find all references.|
#### Command often used
|Key|Description|
|:---|:---|
|`:LspInstallServer`|Automatically installs LanguageServer based on file type.|

### [previm](https://github.com/previm/previm)
Markdown can be implemented while previewing in the browser.
#### Command often used
|Key|Description|
|:---|:---|
|`:PrevimOpen`|Start realtime preview.|
