
# ⚡ FKvim

> A modern, minimal, and lightning-fast Neovim setup — designed for performance, aesthetics, and developer productivity.

<img width="1305" alt="image" src="https://github.com/user-attachments/assets/f083ebfa-d89a-4831-86bf-19aed7fdf309" />

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
## 🖼️ Previw
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


