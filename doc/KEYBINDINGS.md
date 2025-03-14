# Keyboard Shortcuts Reference

This document provides a comprehensive list of all keyboard shortcuts available in ncls-p/kickstart.nvim.

## Table of Contents

- [VSCode-like Shortcuts](#vscode-like-shortcuts)
- [Navigation](#navigation)
- [Editing](#editing)
- [File Operations](#file-operations)
- [Window Management](#window-management)
- [Buffer Management](#buffer-management)
- [Tab Management](#tab-management)
- [Terminal](#terminal)
- [Diagnostics & LSP](#diagnostics--lsp)
- [Search & Find](#search--find)
- [Miscellaneous](#miscellaneous)

## VSCode-like Shortcuts

These shortcuts mimic the behavior of VSCode for a familiar experience.

| Shortcut               | Mode             | Description                           |
| ---------------------- | ---------------- | ------------------------------------- |
| `⌘P` / `Ctrl+P`        | Normal, Insert   | Find files (Quick open)               |
| `⌘⇧F` / `Ctrl+Shift+F` | Normal, Insert   | Find in files                         |
| `⌘⇧P`                  | Normal, Insert   | Command palette                       |
| `⌘/`                   | Normal, Visual   | Toggle comment                        |
| `⌘S` / `Ctrl+S`        | Normal, Insert   | Save file                             |
| `⌘W`                   | Normal, Insert   | Close buffer                          |
| `⌘O`                   | Normal, Insert   | Open file                             |
| `⌘B`                   | Normal, Insert   | Toggle sidebar (NvimTree)             |
| `⌘D`                   | Normal           | Select next occurrence                |
| `⌘⇧L`                  | Normal           | Select all occurrences                |
| `Ctrl+⇧E`              | Normal           | Explorer (file tree)                  |
| `Ctrl+,`               | Normal           | Open settings                         |
| `F2`                   | Normal           | Rename symbol                         |
| `F12`                  | Normal           | Go to definition                      |
| `Shift+F12`            | Normal           | Go to references                      |
| `Ctrl+Space`           | Insert           | Trigger completion                    |
| `Ctrl+``               | Normal, Terminal | Toggle terminal (in horizontal split) |
| `Ctrl+j`               | Normal, Terminal | Toggle terminal (alternative)         |
| `Ctrl+Tab`             | Normal, Insert   | Next buffer                           |
| `Ctrl+Shift+Tab`       | Normal, Insert   | Previous buffer                       |
| `Ctrl+G`               | Normal           | Go to line                            |

## Navigation

| Shortcut    | Mode   | Description                    |
| ----------- | ------ | ------------------------------ |
| `Ctrl+h`    | Normal | Move focus to left window      |
| `Ctrl+j`    | Normal | Move focus to lower window     |
| `Ctrl+k`    | Normal | Move focus to upper window     |
| `Ctrl+l`    | Normal | Move focus to right window     |
| `[d`        | Normal | Go to previous diagnostic      |
| `]d`        | Normal | Go to next diagnostic          |
| `<leader>q` | Normal | Open diagnostic quickfix list  |
| `<leader>e` | Normal | Show diagnostic error messages |

## Editing

| Shortcut | Mode   | Description                            |
| -------- | ------ | -------------------------------------- |
| `Alt+j`  | Normal | Move line down                         |
| `Alt+k`  | Normal | Move line up                           |
| `Alt+j`  | Visual | Move selection down                    |
| `Alt+k`  | Visual | Move selection up                      |
| `<`      | Visual | Decrease indent (stays in visual mode) |
| `>`      | Visual | Increase indent (stays in visual mode) |
| `Esc`    | Normal | Clear search highlighting              |

## File Operations

| Shortcut     | Mode   | Description                |
| ------------ | ------ | -------------------------- |
| `<leader>fe` | Normal | Open file explorer (netrw) |
| `<leader>so` | Normal | Source current file        |

## Window Management

| Shortcut     | Mode   | Description            |
| ------------ | ------ | ---------------------- |
| `Ctrl+Up`    | Normal | Decrease window height |
| `Ctrl+Down`  | Normal | Increase window height |
| `Ctrl+Left`  | Normal | Decrease window width  |
| `Ctrl+Right` | Normal | Increase window width  |

## Buffer Management

| Shortcut     | Mode   | Description     |
| ------------ | ------ | --------------- |
| `<leader>bd` | Normal | Delete buffer   |
| `<leader>bn` | Normal | Next buffer     |
| `<leader>bp` | Normal | Previous buffer |
| `<leader>bl` | Normal | List buffers    |

## Tab Management

| Shortcut     | Mode   | Description          |
| ------------ | ------ | -------------------- |
| `<leader>tn` | Normal | New tab              |
| `<leader>tc` | Normal | Close tab            |
| `<leader>to` | Normal | Close all other tabs |
| `<leader>tl` | Normal | List tabs            |
| `Shift+l`    | Normal | Next tab             |
| `Shift+h`    | Normal | Previous tab         |

## Terminal

| Shortcut  | Mode             | Description                           |
| --------- | ---------------- | ------------------------------------- |
| `Ctrl+``  | Normal, Terminal | Toggle terminal (in horizontal split) |
| `Ctrl+j`  | Normal, Terminal | Toggle terminal (alternative)         |
| `Esc Esc` | Terminal         | Exit terminal mode                    |

## Diagnostics & LSP

| Shortcut    | Mode   | Description                    |
| ----------- | ------ | ------------------------------ |
| `<leader>e` | Normal | Show diagnostic error messages |
| `<leader>q` | Normal | Open diagnostic quickfix list  |
| `[d`        | Normal | Go to previous diagnostic      |
| `]d`        | Normal | Go to next diagnostic          |
| `F2`        | Normal | Rename symbol                  |
| `F12`       | Normal | Go to definition               |
| `Shift+F12` | Normal | Go to references               |

## Search & Find

| Shortcut               | Mode           | Description            |
| ---------------------- | -------------- | ---------------------- |
| `⌘P` / `Ctrl+P`        | Normal, Insert | Find files             |
| `⌘⇧F` / `Ctrl+Shift+F` | Normal, Insert | Find in files          |
| `Ctrl+G`               | Normal         | Find in current buffer |

## Miscellaneous

| Shortcut     | Mode   | Description    |
| ------------ | ------ | -------------- |
| `<leader>qq` | Normal | Quit           |
| `<leader>qa` | Normal | Quit all       |
| `<leader>wq` | Normal | Write and quit |

## Legend

- `⌘` (Command key on macOS)
- `⇧` (Shift key)
- `<leader>` is set to Space by default
- `Ctrl` (Control key)
- `Alt` (Option key on macOS)

## Customizing Keybindings

You can customize these keybindings by editing:

1. General keymaps: `lua/keymaps/init.lua`
2. VSCode-like keymaps: `lua/keymaps/vscode.lua`

To add a new keybinding, use the `keymap` function:

```lua
keymap('mode', 'key', 'action', { desc = 'Description' })
```

Where:

- `mode` is 'n' (normal), 'i' (insert), 'v' (visual), etc.
- `key` is the key combination
- `action` is the command to execute
- `desc` is a description of what the keybinding does
