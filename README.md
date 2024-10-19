# po.nvim

Neovim plugin for editing GNU gettext PO files

## Features

- Commands for PO file editing
- Component for [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) which prints the current translation status of the PO file

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
return {
    "toku-sa-n/po.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
    }
}
```

## Usage

### Commands

This plugin provides the following commands:

- `:Po jump next` - Jump to the next untranslated or fuzzy message
- `:Po jump prev` - Jump to the previous untranslated or fuzzy message

### po.nvim component for lualine.nvim

Add the `po` component to your lualine.nvim configuration:

```lua
lualine.setup({
    opts = {
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { "po", "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    }
})
```

## License

Copyright (C) 2024 Hiroki Tokunaga

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>.
