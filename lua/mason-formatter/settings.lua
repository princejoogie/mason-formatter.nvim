local mappings = require("mason-formatter.mappings")

local M = {}

---@class MasonFormatterSettings
local DEFAULT_SETTINGS = {
	-- A list of sources to automatically install if they're not already installed. Example: { "stylua" }
	-- This setting has no relation with the `automatic_installation` setting.
	ensure_installed = {},
	filetype_mappings = mappings.filetype_mapping,
}

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = M._DEFAULT_SETTINGS

---@param opts MasonFormatterSettings
M.set = function(opts)
	M.current = vim.tbl_deep_extend("force", M.current, opts)
	vim.validate({
		ensure_installed = { M.current.ensure_installed, "table", true },
		filetype_mappings = { M.current.filetype_mappings, "table", true },
	})
end

return M
