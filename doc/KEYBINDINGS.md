# Neovim Keybindings

This document provides an overview of the keybindings configured in this Neovim setup.

## General

| Keybinding   | Description               |
| ------------ | ------------------------- |
| `<Space>`    | Leader key                |
| `<Esc>`      | Clear search highlighting |
| `<C-s>`      | Save file                 |
| `<leader>qq` | Quit                      |
| `<leader>qa` | Quit all                  |
| `<leader>wq` | Write and quit            |
| `<leader>so` | Source current file       |

## Navigation

| Keybinding   | Description          |
| ------------ | -------------------- |
| `<leader>ff` | Find files           |
| `<leader>fg` | Find in files (grep) |
| `<leader>fb` | Find buffers         |
| `<leader>fh` | Find help            |
| `<leader>fr` | Find recent files    |
| `<leader>fc` | Find commands        |
| `<leader>ft` | Find TODOs           |

## File Explorer

| Keybinding  | Description          |
| ----------- | -------------------- |
| `<leader>e` | Toggle file explorer |
| `<leader>o` | Focus file explorer  |

## Code Actions and Navigation

| Keybinding   | Description              |
| ------------ | ------------------------ |
| `<leader>ca` | Code actions             |
| `<leader>cf` | Format code              |
| `<leader>cr` | Rename symbol            |
| `gd`         | Go to definition         |
| `gD`         | Go to declaration        |
| `gi`         | Go to implementation     |
| `gr`         | Go to references         |
| `K`          | Show hover documentation |

## VSCode-like Keybindings

| Keybinding  | Description                                  |
| ----------- | -------------------------------------------- |
| `<D-p>`     | Find files (VSCode: Cmd+P)                   |
| `<D-F>`     | Find in files (VSCode: Cmd+Shift+F)          |
| `<D-P>`     | Command palette (VSCode: Cmd+Shift+P)        |
| `<D-s>`     | Save file (VSCode: Cmd+S)                    |
| `<D-w>`     | Close buffer (VSCode: Cmd+W)                 |
| `<D-o>`     | Open file (VSCode: Cmd+O)                    |
| `<D-b>`     | Toggle sidebar (VSCode: Cmd+B)               |
| `<D-/>`     | Toggle comment (VSCode: Cmd+/)               |
| `<D-d>`     | Select next occurrence (VSCode: Cmd+D)       |
| `<D-L>`     | Select all occurrences (VSCode: Cmd+Shift+L) |
| `<F2>`      | Rename symbol (VSCode: F2)                   |
| `<F12>`     | Go to definition (VSCode: F12)               |
| `<S-F12>`   | Go to references (VSCode: Shift+F12)         |
| `<C-Space>` | Trigger completion (VSCode: Ctrl+Space)      |
| `<C-`>`     | Toggle terminal (VSCode: Ctrl+`)             |
| `<C-Tab>`   | Next buffer (VSCode: Ctrl+Tab)               |
| `<C-S-Tab>` | Previous buffer (VSCode: Ctrl+Shift+Tab)     |

## Comments

| Keybinding  | Description                  |
| ----------- | ---------------------------- |
| `<leader>/` | Toggle comment               |
| `gcc`       | Toggle comment (normal mode) |
| `gc`        | Toggle comment (visual mode) |

## Diagnostics

| Keybinding  | Description                   |
| ----------- | ----------------------------- |
| `<leader>q` | Open diagnostic quickfix list |
| `[d`        | Go to previous diagnostic     |
| `]d`        | Go to next diagnostic         |
| `<leader>d` | Show diagnostic message       |

## Terminal

| Keybinding   | Description        |
| ------------ | ------------------ |
| `<leader>tt` | Open terminal      |
| `<Esc><Esc>` | Exit terminal mode |

## Window Navigation

| Keybinding | Description                    |
| ---------- | ------------------------------ |
| `<C-h>`    | Move focus to the left window  |
| `<C-l>`    | Move focus to the right window |
| `<C-j>`    | Move focus to the lower window |
| `<C-k>`    | Move focus to the upper window |

## Window Splitting

| Keybinding   | Description               |
| ------------ | ------------------------- |
| `<leader>ws` | Split window horizontally |
| `<leader>wv` | Split window vertically   |
| `<leader>wq` | Close window              |

## Resize Windows

| Keybinding  | Description            |
| ----------- | ---------------------- |
| `<C-Up>`    | Decrease window height |
| `<C-Down>`  | Increase window height |
| `<C-Left>`  | Decrease window width  |
| `<C-Right>` | Increase window width  |

## Buffer Management

| Keybinding   | Description           |
| ------------ | --------------------- |
| `<leader>bc` | Close selected buffer |
| `<leader>bp` | Previous buffer       |
| `<leader>bn` | Next buffer           |
| `<leader>bo` | Close other buffers   |
| `[b`         | Previous buffer       |
| `]b`         | Next buffer           |

## Tab Management

| Keybinding   | Description      |
| ------------ | ---------------- |
| `<leader>tn` | New tab          |
| `<leader>tc` | Close tab        |
| `<leader>to` | Close other tabs |
| `<S-l>`      | Next tab         |
| `<S-h>`      | Previous tab     |

## Move Lines

| Keybinding       | Description         |
| ---------------- | ------------------- |
| `<A-j>`          | Move line down      |
| `<A-k>`          | Move line up        |
| `<A-j>` (visual) | Move selection down |
| `<A-k>` (visual) | Move selection up   |

## Indenting

| Keybinding   | Description                             |
| ------------ | --------------------------------------- |
| `<` (visual) | Decrease indent and stay in visual mode |
| `>` (visual) | Increase indent and stay in visual mode |

## UI Toggles

| Keybinding   | Description                 |
| ------------ | --------------------------- |
| `<leader>uf` | Change filetype             |
| `<leader>uz` | Toggle zen mode             |
| `<leader>ut` | Toggle trouble              |
| `<leader>us` | Toggle spellcheck           |
| `<leader>uw` | Toggle word wrap            |
| `<leader>ul` | Toggle invisible characters |
| `<leader>mm` | Toggle minimap              |
| `<leader>ts` | Theme selector              |

## Copilot

| Keybinding   | Description         |
| ------------ | ------------------- |
| `<leader>cc` | Toggle Copilot Chat |
