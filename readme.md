<h1 align="center">⚡ Fkvim</h1>

<p align="center">
<a href="https://github.com/TheFlashCodes/FKvim">
  <img src="https://img.shields.io/badge/FkVim-Ecosystem-blueviolet.svg?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTkuODYgMy41bDIuNjcgMy43NEwxNC40OCAzLjVoMy41MkwxMiAxMy4yOCAzLjk4IDMuNWg5Ljg4ek0xMiAxNS4wNGwtMy44NyA1LjQ2aDcuNzVsLTMuODgtNS40NnoiIGZpbGw9IiNmZmYiLz48L3N2Zz4=" alt="FkVim Ecosystem"/>
</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Made%20with-Lua-blue.svg?style=for-the-badge&logo=lua" />
  <img src="https://img.shields.io/badge/Powered%20by-Neovim-green.svg?style=for-the-badge&logo=neovim" />
  <a href="https://github.com/TheFlashCodes/FKvim/stargazers"><img src="https://img.shields.io/github/stars/TheFlashCodes/FKvim?style=for-the-badge" /></a>
  <a href="https://github.com/TheFlashCodes/FKvim/blob/main/LICENSE"><img src="https://img.shields.io/github/license/TheFlashCodes/FKvim?style=for-the-badge" /></a>
</p>

> A modern, minimal, and lightning-fast Neovim setup — designed for performance, aesthetics, and developer productivity.

<img width="1305" alt="image" src="https://github.com/user-attachments/assets/f083ebfa-d89a-4831-86bf-19aed7fdf309" />

---

## ✨ Features

- ⚡ **Fast Startup** – Powered by [`lazy.nvim`](https://github.com/folke/lazy.nvim)
- 🎨 **Modern UI** – Beautiful, transparent, and distraction-free
- 🧠 **LSP Ready** – Language Server Protocol and smart completion via `nvim-cmp`
- 📁 **Neo-tree** – Smooth file browsing with Git indicators
- 🔍 **Telescope** – Blazing fast fuzzy finder
- 🧩 **Treesitter** – Powerful syntax highlighting & better code understanding
- 🔔 **Custom Notifications** – Unified Noice UI with minimal alerts
- 🛠️ **Modular Structure** – Easy to configure, extend, and maintain
- 🧪 **Built-in Terminal**, breadcrumbs, Git signs, and much more...

---

## 🛠️ Tech Stack

![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)
![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)

---

## 🚀 Commands

FKvim provides the following custom commands:

| Command             | Description                                       | Keybinding      |
|---------------------|---------------------------------------------------|-----------------|
| `:FkGemini`         | Opens the Gemini AI assistant in a split window.  | `<leader>g`     |
| `:FkGemini update`  | Updates the Gemini CLI to the latest version.     |                 |
| `:FkInstall Gemini` | Installs the Gemini CLI.                          |                 |

---

## 📦 Requirements

Make sure you have the following installed:

| Tool          | Version     | Description                                 |
|---------------|-------------|---------------------------------------------|
| **Neovim**    | `>= 0.9.0`  | Core editor                                 |
| **Git**       | Latest      | For managing FKvim and plugin cloning       |
| **Nerd Font** | Recommended | For icons in status line and UI             |
| **Curl/Wget** | Optional    | For automated installation scripts          |

> 💡 _Use a terminal that supports true color and transparency for best visuals._

---

## 📥 Installation

```bash
git clone https://github.com/Flash-codes/fkvim.git ~/.config/nvim
nvim
```

> 🧠 On first launch, FKvim will auto-install all plugins via `lazy.nvim`.
> 📘 Need help? Visit the [FKvim Wiki](https://github.com/Flash-codes/fkvim/wiki/Getting-Started)

---

## 📁 Directory Structure

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── fk_plugins/
│   ├── fk_configs/
│   └── fk_autoscripts.lua
```

All configs are organized under `lua/` with proper namespaces for easy maintenance.

---

## 🔧 Configuration

FKvim is fully modular and easy to customize:

* Themes, transparency, keymaps, and plugins are modular
* Add plugins via `lazy.nvim` in `init.lua`
* Use `lua/fk_configs/` and `lua/fk_plugins/` for custom configuration

---

## 📚 Wiki

Explore the [📘 GitHub Wiki](https://github.com/Flash-codes/fkvim/wiki) to learn:

* ✅ Getting Started
* 🎨 Theme Customization
* 🔌 Plugin Development
* 🧠 LSP and Auto Completion
* 🛠️ Troubleshooting
* ❓ FAQ

---

## 🖼️ Preview
Below are interactive previews of FKvim features. Click to expand each section.

<details><summary>🎯 Dashboard</summary> <br> <img width="1687" alt="image" src="https://github.com/user-attachments/assets/e3c0002a-ae74-417d-8391-bb7094f20f06" width="800"/> <br> <em>Minimal FKvim Dashboard with project access, recent files, and shortcuts</em> </details>

<details> <summary>🔍 Telescope Fuzzy Finder</summary> <br> <img width="1695" alt="image" src="https://github.com/user-attachments/assets/ffd945c2-1b43-48dc-9b19-cb8f7f3d02d8" />
 <br> <em>Fast fuzzy searching for files, text, buffers, and more with Telescope</em> </details>

<details> <summary>📁 Fkvim Tree - File Explorer powered by Neo Tree</summary> <br> <img width="1707" alt="image" src="https://github.com/user-attachments/assets/8bd5ce1e-a206-4616-821d-8f55301c5288" />
 <br> <em>Modern sidebar with Git integration, diagnostics, and icons</em> </details>

<details> <summary>🧠 LSP + Autocomplete</summary> <br> <img width="1423" alt="image" src="https://github.com/user-attachments/assets/b932361a-b5d1-4f13-b303-b0115c58e47f" />
 <br> <em>Intelligent suggestions with LSP, snippets, and inline docs</em> </details>
 
<details> <summary>🔔 Noice + Notify UI</summary> <br> <img width="1674" alt="image" src="https://github.com/user-attachments/assets/5ba70126-6208-45c8-a071-05d9895f479b" />
<br> <em>Modern notification system and command-line interface using Noice + Notify</em> </details>

<details> <summary>📌 Bufferline Navigation</summary> <br> <img width="1710" alt="image" src="https://github.com/user-attachments/assets/f48c9395-10a3-49f0-8a2f-5fad7c71b871" />
 <br> <em>Visual tabs for each open buffer, with Git and diagnostic signs</em> </details>

<details> <summary>🧬 Treesitter Highlighting</summary> <br> <img width="1710" alt="image" src="https://github.com/user-attachments/assets/3432e449-6354-47b0-903f-43cc3079ab76" />
 <br> <em>Accurate and colorful syntax highlighting powered by Treesitter</em> 
</details>

<details> <summary>🧪 Floating Terminal</summary> <br> <img width="1709" alt="image" src="https://github.com/user-attachments/assets/2f794784-3a5a-459b-95db-3d6851030fb1" />
 <br> <em>Run terminals inside Neovim — Python, Git, htop, etc.</em> </details>

<details> <summary>🎨 Transparent Theme</summary> <br> <img width="1710" alt="image" src="https://github.com/user-attachments/assets/3ee9885a-11ca-466b-9262-c04cbd3bc0c9" />
 <br> <em>FKvim with True transparency and Default Catppuccin Mocha theme</em> </details>

---

## 🙏 Credits

FKvim is built with the help of awesome tools:

* [lazy.nvim](https://github.com/folke/lazy.nvim)
* [catppuccin](https://github.com/catppuccin/nvim)
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
* [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
* [noice.nvim](https://github.com/folke/noice.nvim)
* And many more...

---

## 🤝 Contributing

We love contributions from the community! Whether it's a bug report, a new feature, or a documentation improvement, we appreciate your help.

### How to Contribute

1.  **Fork the repository** and create a new branch for your changes.
2.  **Make your changes** and ensure everything is working as expected.
3.  **Submit a pull request** with a clear description of your changes.

### Found a Bug?

-   Check the [issue tracker](https://github.com/Flash-codes/fkvim/issues) to see if the bug has already been reported.
-   If not, open a new issue and provide as much detail as possible.

### Have a Feature Idea?

-   We'd love to hear it! Open an issue to discuss your idea.

---

## ⭐️ Show Your Support

If you enjoy using FKvim, please consider:

* Giving the repo a ⭐ on GitHub
* Sharing it with your developer friends
* Contributing to the project

> FKvim – Developed by [Mayank Kumar Jha](https://github.com/flashcodes-themayankjha)
