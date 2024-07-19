---
title: "nvim://misc"
date: "2024-07-19"
description: "Miscellaneous nvim tips configs"
---


## Setup
i use [LazyVim](https://github.com/LazyVim/LazyVim).
I will update this as time goes.

## Neotree

For file previews when using Neotree i added the following to my lua/config/autocmds.lua:
```lua
require("neo-tree").setup({
  window = {
    mappings = {
      ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
    },
  },
})
```

## Lazygit keymaps
I added the following to my lua/config/keymaps.lua:
```lua
local map = vim.keymap.set

map("n", "<leader>gl", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit " })

map("n", "<leader>gL", function()
  LazyVim.lazygit({ args = { "log" } })
end, { desc = "Lazygit Log (cwd)" })
```
