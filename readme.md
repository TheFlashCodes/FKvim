
# 🌐 FKvim - Web Development Tool Kit (WDK)

> A blazing-fast Neovim configuration tailored for modern web development.  
> Powered by ⚡ Lua, 🔥 Treesitter, 🧠 LSP, and FKvim’s minimal UX.

---

## 🚀 What's FKvim WDK?

**FKvim WDK** is a plug-and-play Neovim setup optimized for full-stack web development with support for:

- 🟨 JavaScript / TypeScript
- ⚛️ React / Next.js / Vue / Svelte
- 💅 CSS / SCSS / Tailwind
- 🌐 HTML
- 📦 Node.js
- 🧪 Prettier, ESLint, and Vitest integration

---

## ✨ Features

✅ Fully configured **LSP** (via `mason.nvim`)  
✅ Rich syntax highlighting with **nvim-treesitter**  
✅ Auto-formatting with **Prettier**  
✅ Auto-linting with **ESLint**  
✅ **Telescope** for fuzzy finding  
✅ **nvim-cmp** for powerful autocompletion  
✅ Git support via **gitsigns**  
✅ Project root detection & file explorer  
✅ Fast startup and minimal bloat  
✅ Built-in keymaps and helper commands

---

## 📦 Preinstalled Tooling

| Tool        | Purpose                  |
|-------------|---------------------------|
| `tsserver`  | JavaScript & TypeScript LSP |
| `html-lsp`  | HTML support               |
| `css-lsp`   | CSS, SCSS, Tailwind        |
| `eslint_d`  | Linting                    |
| `prettierd` | Auto-formatting            |
| `emmet-ls`  | Emmet HTML/CSS shortcuts   |

---

## 🧰 Requirements

Make sure you have the following:

- [Neovim 0.9+](https://neovim.io/)
- [Node.js](https://nodejs.org/) (v16+)
- Git

Recommended (optional):

```bash
npm install -g typescript eslint_d prettierd
````

---

## 🛠 Installation

Clone FKvim and switch to Web Dev Kit branch:

```bash
git clone https://github.com/yourname/FKvim ~/.config/nvim
cd ~/.config/nvim
git checkout fkvim-wdk
```

Then launch Neovim:

```bash
nvim
```

Run `:Lazy` to install plugins.

---

## 🔑 Key Features & Shortcuts

| Action                 | Shortcut            |
| ---------------------- | ------------------- |
| Open File Explorer     | `<leader>e`         |
| Format file (Prettier) | `<leader>f`         |
| Open Telescope         | `<leader>ff`        |
| Show LSP info          | `<leader>li`        |
| Rename symbol          | `<leader>rn`        |
| Toggle diagnostics     | `<leader>xx`        |
| Git status / blame     | `<leader>gs` / `gb` |

---

## 🧠 Tips

* Use `:Mason` to manage LSP servers.
* Press `Tab`/`Shift-Tab` to auto-complete and jump through snippets.
* Use `:Telescope projects` to switch projects quickly.
* For tailwind support, make sure the `tailwindcss-language-server` is installed.

---

## 📸 Preview

> *(optional) Insert screenshot or terminal GIF showcasing your WDK UI.*

---

## 🧠 Maintained By

**Mayank Kumar Jha**
🚀 [FlashCodes](https://github.com/orgs/Flash-codes/repositories) · 🧩 FKvim Series

---

## 📄 License

MIT License © 2025 [Mayank Jha](https://github.com/flashcodes-themayankjha)



