# ncls-p/kickstart.nvim

A modular, clean, and feature-rich Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), customized with a focus on organization and better keybindings.

## Features

- **Modular Structure**: Configuration split into logical components
- **VSCode-like Keybindings**: Familiar key mappings for an easier transition
- **Core Settings Separated**: Options and autocommands cleanly organized
- **Custom Plugin Configurations**: Enhanced plugin setup for better workflow

## Directory Structure

```
.
├── init.lua                # Main entry point
├── lua/
│   ├── core/              # Core Neovim configuration
│   │   ├── autocmds.lua   # Autocommands
│   │   └── options.lua    # Basic options
│   ├── custom/            # Custom configurations
│   │   └── plugins/       # Custom plugin settings
│   ├── keymaps/           # Keyboard mappings
│   │   ├── init.lua       # General keymaps
│   │   └── vscode.lua     # VSCode-like keymaps
│   ├── kickstart/         # Original kickstart configurations
│   │   └── plugins/       # Plugin configurations
│   └── plugins/           # Plugin management
│       └── init.lua       # Plugin loader
└── doc/                   # Documentation
```

## Installation

### Prerequisites

- Neovim 0.8.0+
- Git
- [ripgrep](https://github.com/BurntSushi/ripgrep) for telescope search
- A Nerd Font (optional, for icons)
- Language servers (for the languages you work with)

### Setup

1. Backup your existing Neovim configuration if you have one:

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   mv ~/.local/share/nvim ~/.local/share/nvim.bak
   mv ~/.local/state/nvim ~/.local/state/nvim.bak
   mv ~/.cache/nvim ~/.cache/nvim.bak
   ```

2. Clone this repository (one-line install):

   ```bash
   # macOS/Linux
   git clone https://github.com/ncls-p/kickstart.nvim.git ~/.config/nvim

   # Windows (PowerShell)
   git clone https://github.com/ncls-p/kickstart.nvim.git $env:LOCALAPPDATA\nvim
   ```

   Or use this one-liner for macOS/Linux:

   ```bash
   rm -rf ~/.config/nvim && git clone https://github.com/ncls-p/kickstart.nvim.git ~/.config/nvim
   ```

3. Start Neovim:

   ```bash
   nvim
   ```

   The plugin manager will automatically install all plugins on the first run.

## Key Features

- **Modular Organization**: Each aspect of the configuration is in its own file for easy maintenance
- **VSCode Compatibility**: Keybindings that will feel familiar to VSCode users
- **Lazy Loading**: Plugins are loaded only when needed for fast startup
- **Clean Core**: Essential settings are separate from plugin configurations

## Customization

This configuration is designed to be extended. To add your own customizations:

1. Modify files in the `lua/custom` directory for your personal plugins and settings
2. Adjust keybindings in `lua/keymaps` directory
3. Core Neovim options can be changed in `lua/core/options.lua`

## Documentation

Refer to the [KEYBINDINGS.md](./doc/KEYBINDINGS.md) file for a complete list of keyboard shortcuts and commands.

## Credits

This configuration is based on the excellent [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) project, with structural modifications and enhancements.

## License

MIT
