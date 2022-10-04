local util = require("formatter.util")

local M = {}
-- table of formatters where key is the name of the mason package
-- and value is the args for formatter.nvim
M.formatters = {
	prettier = {
		exe = "prettier",
		args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
		stdin = true,
	},
	["clang-format"] = {
		exe = "clang-format",
		args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
		stdin = true,
		cwd = vim.fn.expand("%:p:h"),
	},
	stylua = {
		exe = "stylua",
		args = {
			"--search-parent-directories",
			"--stdin-filepath",
			util.escape_path(util.get_current_buffer_file_path()),
			"--",
			"-",
		},
		stdin = true,
	},
	autopep8 = {
		exe = "autopep8",
		args = {
			"--in-place --aggressive --aggressive",
			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = false,
	},
	-- NOTE: these formatter are not available in mason yet
	gofmt = {
		exe = "gofmt",
		args = {},
		stdin = true,
	},
	rustfmt = {
		exe = "rustfmt",
		args = { "--emit=stdout", "--edition=2021" },
		stdin = true,
	},
	["prisma-fmt"] = {
		exe = "prisma-fmt",
		args = { "format", "-i", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
		stdin = true,
	},
}

local DEFAULT_FILETYPE_MAPPINGS = {
	javascript = M.formatters.prettier,
	javascriptreact = M.formatters.prettier,
	typescript = M.formatters.prettier,
	typescriptreact = M.formatters.prettier,
	markdown = M.formatters.prettier,
	html = M.formatters.prettier,
	css = M.formatters.prettier,
	json = M.formatters.prettier,
	yaml = M.formatters.prettier,
	cpp = M.formatters["clang-format"],
	lua = M.formatters.stylua,
	python = M.formatters.autopep8,
	prisma = M.formatters["prisma-fmt"],
	rust = M.formatters.rustfmt,
	go = M.formatters.gofmt,
}

M._DEFAULT_FILETYPE_MAPPINGS = DEFAULT_FILETYPE_MAPPINGS
M.filetype_mapping = M._DEFAULT_FILETYPE_MAPPINGS

return M
