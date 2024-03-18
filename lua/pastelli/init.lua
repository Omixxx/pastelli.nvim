local M = {} -- M stands for module, a naming convention
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local hex_colors = require("pastelli.hex_colors")
local telescope = require("telescope.builtin")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

function M.buffer()
  print("Buffer")
end

function M.telescope(opts)
  opts = opts or {}
  pickers
      .new(opts, {
        prompt_title = "colors",
        finder = finders.new_table({
          results = hex_colors.colors,
        }),
        sorter = conf.generic_sorter(opts),
      })
      :find()
end

function M.setup()
  vim.cmd("command! PastelliTelescope lua require('pastelli').telescope()")
  vim.cmd("command! PastelliBuffer lua require('pastelli').buffer()")
end

return M
