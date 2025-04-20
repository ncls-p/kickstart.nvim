# Plan: Enhance Neovim to be VSCode-like

This plan outlines the steps to configure Neovim to provide an experience closer to VSCode, focusing on the user's priorities: Visual Git, Visuals (UI), Keymappings, Error Handling, and Copilot.

## Current Status Summary

- **Visual Git:** Basic gutter signs (`gitsigns.nvim`) present. Lacks a full visual interface (staging, committing, branches).
- **Visuals (UI):** VSCode-like file explorer (`neo-tree.nvim`) configured. Theme/statusline okay but not explicitly reviewed against VSCode.
- **Keymappings:** VSCode-like keybindings exist (`lua/keymaps/vscode.lua`) but are only active when running inside VSCode.
- **Error Handling (LSP):** Basic diagnostics (gutter signs, hover) configured. Lacks inline errors and a "Problems" panel.
- **Copilot:** Suggestions (`copilot.vim`) and chat (`CopilotChat.nvim`) are integrated.

## Proposed Steps

1.  **Activate VSCode Keybindings:**
    - Modify `lua/keymaps/init.lua` to unconditionally load keybindings from `lua/keymaps/vscode.lua`.
2.  **Enhance Visual Git:**
    - Add the `Neogit` plugin (`NeogitOrg/neogit`) to `lua/plugins/editor.lua` (or a dedicated git file if preferred).
    - Configure basic `Neogit` keybindings (e.g., `<leader>gg` to open).
3.  **Refine Error Display:**
    - Add `nvim-lint` (`mfussenegger/nvim-lint`) to `lua/plugins/lsp.lua` for inline diagnostics (virtual text). Configure it to run on relevant events (e.g., `BufWritePost`, `BufEnter`).
    - Add `trouble.nvim` (`folke/trouble.nvim`) to `lua/plugins/ui.lua` (or lsp/editor). Configure keybindings to toggle the panel (e.g., `<leader>xx` for workspace diagnostics, `<leader>xd` for document diagnostics).
4.  **Review UI Theme:**
    - Examine `lua/plugins/ui/themes.lua`.
    - Identify the currently active theme(s).
    - (If necessary) Explore and potentially switch to a theme closer to the default VSCode look (e.g., a popular theme like `tokyonight`, `catppuccin`, or search for VSCode-specific themes).
5.  **Verification:**
    - Restart Neovim.
    - Test VSCode keybindings (F2, F12, Ctrl+P, etc.).
    - Test Neogit interface (`<leader>gg`).
    - Check for inline linting errors.
    - Test the Trouble panel (`<leader>xx`, `<leader>xd`).
    - Verify Copilot suggestions and chat (`<leader>cc`).
    - Confirm the overall look and feel.

## Plan Visualization

```mermaid
graph TD
    A[Start: Ensure VSCode-like Experience] --> B[Analyze Config (Done)];
    B --> C[Status: Git Signs OK, Needs Full UI];
    B --> D[Status: Explorer OK, Theme/Statusline?];
    B --> E[Status: VSCode Keys Exist, Not Active];
    B --> F[Status: Basic Diagnostics OK];
    B --> G[Status: Copilot OK];

    E --> H[Step 1: Activate VSCode Keymaps];
    C --> I[Step 2: Add Neogit for Visual Git];
    F --> J[Step 3: Add Inline Errors/Problems Panel (nvim-lint, trouble.nvim)];
    D --> K[Step 4: Review/Change Theme];
    H & I & J & K --> L[Step 5: Verify All Features];

    L --> M[Goal Achieved];
```
