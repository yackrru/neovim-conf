# Neovim conf
My personal configurations of Neovim.

## Prerequisites
- python3

## Set up
Install components.
```
git clone https://github.com/yackrru/neovim-conf.git ~/.config/nvim
~/.config/nvim/install.sh
```
Configure python venv for Neovim.
```
~/.config/nvim/activate.sh
```
Start Neovim and the plugin will be installed automatically.
```
nvim
```
### Optional components
- [go-expr-completion](https://github.com/110y/go-expr-completion) (optional)
  - If you use `vim-go-expr-completion` plugin, you must install `go-expr-completion`.
  ```
  go install github.com/110y/go-expr-completion@latest
  ```
- [impl](https://github.com/josharian/impl) (optional)
  - If you use `vim-goimpl` plugin, you must install `impl`.
  ```
  go install github.com/josharian/impl@latest
  ```
- [go-test-name](https://github.com/110y/go-test-name) (optional)
  - If you use `gt` key mapping, you must install `go-test-name`.
  ```
  go install github.com/110y/go-test-name@latest
  ```
- [Tig](https://github.com/jonas/tig) (optional)
  - Can call tig on buffer with neovim-remote.

## Keymaps
### Standard
- `Leader`: `;`
### Custom
|Key|Command|Description|
|:---|:---|:---|
|Space|`:b#`|Switch to the last buffer.|
|`<leader>t`|-|Open new buffer of `tig`|
|`gt`|-|Run golang func for test under the cursor.|

## Plugins

### [defx.nvim](https://github.com/Shougo/defx.nvim)
File explorer.
#### Custom key bindings as follows
|Key|Command|Description|
|:---|:---|:---|
|`<C-t>`|`:Defx`|Toggle (Open or Close) Defx window.|
#### Custom key settings
Keys behave as follows on the Defx buffer.
|Key|Description|
|:---|:---|
|`<CR>`|Open file.|
|b|Move to parent directory.|
|~|Move to home directory.|
|i|Open file with splitting window horizontally.|
|s|Open file with splitting window vertically.|
|yy|Yank (copy) file/directory path.|
|C|Copy file.|
|P|Paste file.|
|M|Move file.|
|D|Delete file.|
|N|New file.|
|K|New directory.|
|R|Rename file.|

### [NERD Commenter](https://github.com/preservim/nerdcommenter)
>Comment functions so powerful—no comment necessary.
#### Key often used
|Key|Description|
|:---|:---|
|`<leader>cc`|Comment out the current line or text selected in visual mode.|
|`<leader>cu`|Uncomments the selected line(s).|

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
|`<C-p>`|`:bprevious`|Change buffer to previous tab.|
|`<C-n>`|`:bnext`|Change buffer to next tab.|

### [EasyMotion](https://github.com/easymotion/vim-easymotion)
>EasyMotion provides a much simpler way to use some motions in vim. It takes the <number> out of <number>w or <number>f{char} by highlighting all possible choices and allowing you to press one key to jump directly to the target.

### [vim-lsp](https://github.com/prabirshrestha/vim-lsp)
Multiple LanguageServers are automatically supported by using [vim-lsp-settings](https://github.com/mattn/vim-lsp-settings).  
However, `:LspInstallServer` command must be run for each file type.
#### Custom key bindings as follows.
|Key|Command|Description|
|:---|:---|:---|
|`<leader>d`|`:LspDefinition`|Go to definition.|
|`<leader>f`|`:LspDocumentFormat`|Format the entire document.|
|`<leader>h`|`:LspHover`|Gets the hover information and displays it in the `preview-window`.|
|`<leader>i`|`:LspImplementation`|Find all implementation of interface.|
|`<leader>n`|`:LspRename`|Rename the symbol.|
|`<leader>r`|`:LspReferences`|Find all references.|
#### Command often used
|Key|Description|
|:---|:---|
|`:LspInstallServer`|Automatically installs LanguageServer based on file type.|

### [vim-go-expr-completion](https://github.com/110y/vim-go-expr-completion)
>A Vim plugin to complete a left-hand side from given expression for Go.
#### Custom key bindings as follows.
|Key|Command|Description|
|:---|:---|:---|
|`ge`|`:call go#expr#complete()`|Completes the left-hand side for given expression.|

### [vim-goimpl](https://github.com/mattn/vim-goimpl)
Auto implementation go interface.
#### Command often used
|Key|Description|
|:---|:---|
|`:GoImpl [interface name]`|Implement interface under the cursor struct.|

### [previm](https://github.com/previm/previm)
Markdown can be implemented while previewing in the browser.
#### Command often used
|Key|Description|
|:---|:---|
|`:PrevimOpen`|Start realtime preview.|

### [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
>A Vim plugin which shows a git diff in the sign column.
It shows which lines have been added, modified, or removed.
#### Custom key bindings as follows.
|Key|Command|Description|
|:---|:---|:---|
|`gt`|`:GitGutterToggle`|Toggle GitGutter display.|
|`gh`|`:GitGutterLineHighlightsToggle`|Toggle GitGutter Line Highlights.|
