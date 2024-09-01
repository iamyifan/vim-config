[toc]

# Vim Notebook

## Reference

- [Vimrc Configuration Guide - How to Customize Your Vim Code Editor with Mappings, Vimscript, Status Line, and More](https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/)
- [VIMRC File - What is a .vimrc file and how do I open it?](https://fileinfo.com/extension/vimrc)
- [Learn Vim the Smart Way - Buffers, Windows, and Tabs](https://learnvim.irian.to/basics/buffers_windows_tabs)
- [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)
- [vi Complete Key Binding List](https://hea-www.harvard.edu/~fine/Tech/vi.html)
- [RegrexOne - Learn Regular Expressions](https://regexone.com/)
- [Regrex 101 - Dev Community](https://dev.to/thecoollearner/regex-101-3cba)
- [Vim Statusline Generator](https://www.tdaly.co.uk/projects/vim-statusline-generator/)
- [Fold | Learn Vim](https://learnvim.irian.to/basics/fold)



## What is `.vimrc`?

`.vimrc` served as customised configurations for Vim. For macOS, it's normally saved under the user's home directory as a hidden file. In other cases, Vim checks the other potential paths in the following order:

1. $VIMINIT`
2. `$HOME/.vimrc`
3. `$HOME/.vim/vimrc`
4. `$EXINIT`
5. `$HOME/.exrc`
6. `$VIMRUNTIME/default.vim`

When Vim is opened, the first matched `.vimrc` will be loaded and the rest will be ignored.

In general, a `.vimrc` includes:
- Plugins
- Settings
- Custom functions
- Custom commands
- Mappings


## Buffers, windows and tabs

- Buffer: An in-memory space associated with files opened in Vim. One buffer is tied with one file.

  | Operation    | Command                     |
  | :----------- | :-------------------------- |
  | List | `:buffers`, `:ls`, `:files` |
  |Navigate|`:bnext`/`:bn`, `:bprevious`/`:bp`,  `:buffer`+`buffer_num`/`:b`+`buffer_num`|
  |Delete |`:bdelete`[+`buffer_num`]/`:bd`[+`buffer_num`]|
  |Exit all|`:qall`/`:qa`, `:qall!`/`:qa!`, `:wqall`/`:wqa`|

- Window: A viewport onto a buffer. One buffer can have multiple views.

  | Operation | Command                                                      |
| --------- | ------------------------------------------------------------ |
  | Split     | `:split`[+`file_path`]/`:sp`[+`file_path`]/`ctrl`+`w`+`s`, `:vsplit`[+`file_path`]/:`vsp`[+`file_path`]/ `ctrl`+`w`+`v` |
| Navigate  | `ctrl`+`w`+`h`(left)/`l`(right)/`j`(down)/`k`(up)/`w`(next)  |
  | Close     | `:quit`/`:q`/`ctrl`+`w`+`o`(only keep the current window)    |

- Tab: A collection of windows. One tab contains multiple windows.

  | Operation | Command                                             |
  | --------- | --------------------------------------------------- |
  | List      | `:tabs`                                             |
  |Create|`:tabnew`+`file_path`|
  | Close     | `:tabclose`                                         |
  | Navigate  | `:tabn`+`tab_num`, `:tabnext`/`:tabn`, `:tabprevious`/`:tabp`, `:tablast`/`:tabl`, `:tabfirst` |
  | Open with a tab | `vim -p`+`file_1 file_2 file_3 ...` |
  

When closing windows/tabs, only the views of the buffers are closed, the buffers themselves still exist.

## Key binding and mapping

Mapping syntax: `mapping_mode new_key old_key`

- `nnoremap`: mappings in normal mode
- `inoremap`: mappings in insert mode
- `vnoremap`: mappings in visual mode

A `mapleader` is an unused key conjucted with other keys to create new mappings. The default `mapleader` is `\`. To set a new `mapleader`: `let mapleader=new_leader_key`.

## Regrex Cheatsheet

| Pattern | Note    |
| ------- | ------- |
| `abc...` | Letters |
|`123...`|Digits|
|`\d`|Any digit|
|`\D`|Any non-digit|
|`.`|Any character|
|`\.`|Period|
|`[abc]`|Only a, b or c|
|`[^abc]`|Not a, b nor c|
|`[a-z]`|Letters from a to z|
|`[0-9]`|Digits from 0 to 9|
|`\w`|Any alphanumeric (letters & digits) character|
|`\W`|Any non-alphanumeric character|
|`{m}`|m times repetitions|
|`{m,n}`|m to n times repetitions|
|`*`|0 or more repetitions|
|`+`|1 or more repetitions|
|`?`|Optional character|
|`\s`|Any whitespace|
|`\S`|Any non-whitespace|
|`^...$`|Start and end|
|`(...)`|Group capture|
|`(a(bc))`|Subgroup capture|
|`(.*)`|Any group capture|
|`(abc|def)`|Match abc or def|

## Plug-ins Management via `vim-plug`
