# Neovim Configuration

A clean, modular, and well-organized Neovim configuration.

## Structure

This configuration is organized into the following modules:

### Core (`lua/core/`)

Contains the basic Neovim settings, independent from plugins:

- `init.lua` - Main core module that loads all core settings
- `options.lua` - Basic Neovim options
- `autocmds.lua` - Autocommands

### Keymaps (`lua/keymaps/`)

Contains all keyboard mappings:

- `init.lua` - Main keymaps module with general keybindings
- `vscode.lua` - VSCode-specific keybindings

### Plugins (`lua/plugins/`)

Contains all plugin configurations, organized by category:

- `init.lua` - Main plugin module that loads all plugin specs
- `core/` - Core functionality plugins
  - `init.lua` - Core plugins loader
  - `buffers.lua` - Buffer management plugins
  - `editing.lua` - Text editing plugins
  - `keybindings.lua` - Keybinding-related plugins
- `ui/` - UI and appearance plugins
  - `init.lua` - UI plugins loader
  - `dashboard.lua` - Dashboard plugins
  - `explorer.lua` - Explorer plugins
  - `notifications.lua` - Notification plugins
  - `statusline.lua` - Status line plugins
  - `themes.lua` - Themes and colorschemes
  - `windows.lua` - Window management plugins
- `lsp/` - LSP, completion, and formatting
  - `init.lua` - LSP plugins loader
  - `completion.lua` - Completion plugins
  - `core.lua` - Core LSP plugins
  - `formatting.lua` - Code formatting plugins
  - `servers.lua` - Language server configurations
- `editor/` - Editor tools
  - `init.lua` - Editor plugins loader
  - `explorer.lua` - File explorer plugins
  - `git.lua` - Git integration plugins
  - `telescope.lua` - Telescope plugins
  - `terminal.lua` - Terminal plugins
  - `todo.lua` - Todo comment plugins
  - `treesitter.lua` - Treesitter configs

### Config (`lua/config/`)

Contains custom configurations:

- `init.lua` - Main config module
- `copilot.lua` - Copilot configuration

### Custom (`lua/custom/`)

Contains language-specific settings:

- `python.lua` - Python-specific settings
- `plugins/` - Language-specific plugins
  - `copilot-chat.lua` - GitHub Copilot Chat plugins
  - `devops-tools.lua` - DevOps tool plugins
  - `go-tools.lua` - Go language plugins
  - `init.lua` - Language plugin loader
  - `markdown-tools.lua` - Markdown plugins
  - `python-tools.lua` - Python plugins
  - `rust-tools.lua` - Rust plugins
  - `scala-tools.lua` - Scala plugins
  - `solidity-tools.lua` - Solidity plugins
  - `typescript-tools.lua` - TypeScript plugins
  - `web-tools.lua` - Web development plugins

## Entry Point

The main `init.lua` file in the root directory is the entry point that loads all modules in the correct order.

## Features

- Modular structure for easy maintenance
- Clean separation of concerns
- Easy to extend with new plugins and configurations
- VSCode-like keybindings for a familiar experience
- Comprehensive plugin setup for a modern development environment

## Usage

1. Clone this repository to your Neovim configuration directory:

   ```
   git clone https://github.com/ncls-p/kickstart.nvim.git ~/.config/nvim
   git clone git@github.com:ncls-p/kickstart.nvim.git ~/.config/nvim
   ```

2. Start Neovim:

   ```
   nvim
   ```

3. The plugin manager will automatically install all plugins on the first run.

## Customization

To add your own customizations:

1. For new plugins, add them to the appropriate file in `lua/plugins/` or create a new file in `lua/custom/plugins/`.
2. For new keybindings, add them to `lua/keymaps/init.lua`.
3. For new options, add them to `lua/core/options.lua`.
4. For new autocommands, add them to `lua/core/autocmds.lua`.

## License

MIT
