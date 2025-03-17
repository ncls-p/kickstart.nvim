# Neovim Configuration

A clean, modular, and easy-to-maintain Neovim configuration.

## Structure

The configuration is organized into the following directories:

```
.
├── init.lua                 # Main entry point
├── lua/
│   ├── config/              # Main configuration modules
│   │   ├── init.lua         # Main configuration setup
│   │   └── copilot.lua      # Copilot-specific configuration
│   ├── core/                # Core Neovim settings
│   │   ├── options.lua      # Basic Neovim options
│   │   └── autocmds.lua     # Autocommands
│   ├── keymaps/             # Keybindings
│   │   ├── init.lua         # Main keymaps module
│   │   └── vscode.lua       # VSCode-like keybindings
│   ├── plugins/             # Plugin configurations
│   │   ├── init.lua         # Plugin manager setup
│   │   ├── core/            # Core plugins
│   │   │   ├── init.lua     # Core plugins initialization
│   │   │   ├── keybindings.lua # Keybinding-related plugins
│   │   │   ├── editing.lua  # Core editing plugins
│   │   │   └── buffers.lua  # Buffer management plugins
│   │   ├── editor/          # Editor plugins
│   │   │   ├── init.lua     # Editor plugins initialization
│   │   │   ├── git.lua      # Git integration
│   │   │   ├── telescope.lua # Fuzzy finder
│   │   │   ├── explorer.lua # File explorer
│   │   │   ├── treesitter.lua # Syntax highlighting
│   │   │   ├── terminal.lua # Terminal integration
│   │   │   └── todo.lua     # Todo comments
│   │   ├── lsp/             # LSP plugins
│   │   │   ├── init.lua     # LSP plugins initialization
│   │   │   ├── core.lua     # Core LSP configuration
│   │   │   ├── servers.lua  # LSP server configurations
│   │   │   ├── completion.lua # Autocompletion
│   │   │   └── formatting.lua # Formatting
│   │   └── ui/              # UI plugins
│   │       ├── init.lua     # UI plugins initialization
│   │       ├── themes.lua   # Themes and colorschemes
│   │       ├── statusline.lua # Status line and bufferline
│   │       ├── dashboard.lua # Dashboard
│   │       ├── explorer.lua # File explorer
│   │       ├── notifications.lua # Notifications
│   │       └── windows.lua  # Window management
│   ├── custom/              # Custom configurations
│   │   └── plugins/         # Custom plugin configurations
│   └── kickstart/           # Kickstart configurations
│       └── plugins/         # Kickstart plugin configurations
└── doc/                     # Documentation
    └── KEYBINDINGS.md       # Keybindings documentation
```

## Features

- Modular structure for easy maintenance
- Clean separation of concerns
- Easy to extend with new plugins and configurations
- VSCode-like keybindings for a familiar experience
- Comprehensive plugin setup for a modern development environment

## Usage

1. Clone this repository to your Neovim configuration directory:

   ```
   git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
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
