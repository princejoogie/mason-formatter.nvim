`mason-formatter` bridges `mason.nvim` with the `formatter.nvim` plugin - making it easier to use both plugins together.

> 🚧 not ready for use, under dev

# Requirements

-   neovim `>= 0.7.0`
-   [`mason.nvim`](https://github.com/williamboman/mason.nvim)
-   [`formatter.nvim`](https://github.com/mhartington/formatter.nvim)

# Installation

## [Packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "williamboman/mason.nvim",
  "mhartington/formatter.nvim",
  "princejoogie/mason-formatter.nvim",
}
```

## vim-plug

```vim
Plug "williamboman/mason.nvim"
Plug "mhartington/formatter.nvim"
Plug "princejoogie/mason-formatter.nvim"
```

--- 

Made by Prince Carlo Juguilon
