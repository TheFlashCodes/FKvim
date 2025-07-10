
# ⚡ FKvim

> A modern, minimal, and lightning-fast Neovim setup — designed for performance, aesthetics, and developer productivity.

![FKvim Dashboard](https://raw.githubusercontent.com/Flash-codes/fkvim/main/assets/dashboard.png)

---

## 🚀 Features

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
````

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

<details><summary>🎯 Dashboard</summary>
<br>
<img src="https://raw.githubusercontent.com/Flash-codes/fkvim/main/assets/dashboard.png" width="800"/>
<br><em>Minimal FKvim Dashboard with project access and shortcuts</em>
</details>

<details><summary>🔍 Telescope Fuzzy Finder</summary>
<br>
<img src="https://raw.githubusercontent.com/Flash-codes/fkvim/main/assets/telescope.png" width="800"/>
<br><em>Fast fuzzy searching for files, text, buffers, and more</em>
</details>

<details><summary>📁 Neo-tree File Explorer</summary>
<br>
<img src="https://raw.githubusercontent.com/Flash-codes/fkvim/main/assets/neotree.png" width="800"/>
<br><em>Sidebar with Git integration, diagnostics, and icons</em>
</details>

<details><summary>🧠 LSP + Autocomplete</summary>
<br>
<img src="https://raw.githubusercontent.com/Flash-codes/fkvim/main/assets/lsp.png" width="800"/>
<br><em>Smart completions with LSP, snippets, and inline docs</em>
</details>

<details><summary>🔔 Noice + Notify UI</summary>
<br>
<img src="https://raw.githubusercontent.com/Flash-codes/fkvim/main/assets/noice.png" width="800"/>
<br><em>Modern command-line and notification UI</em>
</details>

<details><summary>📌 Bufferline Tabs</summary>
<br>
<img src="https://raw.githubusercontent.com/Flash-codes/fkvim/main/assets/bufferline.png" width="800"/>
<br><em>Visual buffer navigation with Git and diagnostics</em>
</details>

<details><summary>🧬 Treesitter Highlighting</summary>
<br>
<img src="https://raw.githubusercontent.com/Flash-codes/fkvim/main/assets/treesitter.png" width="800"/>
<br><em>Accurate and beautiful syntax highlighting</em>
</details>

<details><summary>🧪 Floating Terminal</summary>
<br>
<img src="https://raw.githubusercontent.com/Flash-codes/fkvim/main/assets/terminal.png" width="800"/>
<br><em>Open htop, Git, Python, or anything inside Neovim</em>
</details>

<details><summary>🎨 Transparent Theme</summary>
<br>
<img src="https://raw.githubusercontent.com/Flash-codes/fkvim/main/assets/transparency.png" width="800"/>
<br><em>True transparency + Catppuccin Mocha Theme</em>
</details>

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

## 🧑‍💻 Contributing

We welcome contributions!
Fork the repo, create a branch, and open a pull request.
Feel free to suggest features, report bugs, or improve the documentation.

---

## ⭐️ Show Your Support

If you enjoy using FKvim, please consider:

* Giving the repo a ⭐ on GitHub
* Sharing it with your developer friends
* Contributing to the project

> FKvim – Developed by [Mayank Kumar Jha](https://github.com/flashcodes-themayankjha)


