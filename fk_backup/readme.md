
# 🐍 FKvim - Python Development Kit (PDK)

> A lightweight, fast, and batteries-included Neovim setup tailored for Python developers.  
> Focused on clean visuals, LSP integration, and productivity.

---

## 🔧 What is FKvim PDK?

**FKvim PDK** is a ready-to-code Neovim configuration specifically optimized for Python development.  
Built on the FKvim core with a modular, minimal design and blazing fast performance.

---

## 🚀 Features

✅ Pre-configured **LSP** with `pyright`  
✅ Autocompletion with **nvim-cmp**  
✅ Virtualenv and conda support  
✅ Built-in **linting** (`ruff`, `flake8`)  
✅ **Auto-formatting** with `black`  
✅ Git integration with **gitsigns**  
✅ Fast fuzzy finding with **telescope.nvim**  
✅ Clean UI with catppuccin theme

---

## 🧰 Included Tooling

| Tool       | Purpose                     |
|------------|-----------------------------|
| `pyright`  | Python LSP                  |
| `black`    | Code formatting             |
| `ruff`     | Linting and style enforcement |
| `mypy`     | Type checking               |
| `isort`    | Import sorting              |

> All tools can be installed and managed via `mason.nvim`

---

## 📦 Requirements

- [Neovim 0.9+](https://neovim.io/)
- [Python 3.8+](https://www.python.org/)
- Git
- Optional: virtualenv or conda

To install required tools globally:

```bash
pip install black ruff mypy isort
````

---

## 🛠 Installation

```bash
git clone https://github.com/yourname/FKvim ~/.config/nvim
cd ~/.config/nvim
git checkout fkvim-pdk
```

Then open Neovim:

```bash
nvim
```

Run `:Lazy` to sync and install plugins.

---

## 🧪 LSP Setup

FKvim uses `mason.nvim` and `pyright` out-of-the-box:

```bash
:Mason
```

To verify the LSP is working, run:

```bash
:LspInfo
```

---

## ⌨️ Keybindings

| Action               | Shortcut     |
| -------------------- | ------------ |
| Format file          | `<leader>f`  |
| Rename symbol        | `<leader>rn` |
| LSP diagnostics      | `<leader>xx` |
| Run Python file      | `<leader>r`  |
| Toggle file explorer | `<leader>e`  |
| Telescope files      | `<leader>ff` |

---

## 🔍 Virtualenv Support

FKvim will detect your virtual environment or conda environment automatically.
Make sure you **activate** your environment before starting Neovim:

```bash
source venv/bin/activate
nvim
```

---

## 💡 Tips

* Use `:Mason` to install or upgrade language servers.
* Use `ruff` instead of `flake8` for better performance.
* Use `:checkhealth` to diagnose LSP, Treesitter, Python paths, etc.

---

## 📸 Preview

> *(Optional) Add a screenshot or terminal recording here.*
**Mayank Kumar Jha**
🚀 [FlashCodes](https://github.com/orgs/Flash-codes/repositories) · 🧩 FKvim Series

---

## 📄 License

MIT License © 2025 [Mayank Jha](https://github.com/flashcodes-themayankjha)



