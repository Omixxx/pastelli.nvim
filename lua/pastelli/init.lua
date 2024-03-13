local M = {} -- M stands for module, a naming convention

local hex_colors = require("pastelli.hex_colors")
local telescope = require("telescope.builtin")

function M.telescope()
  -- Definisci una funzione di selezione per visualizzare correttamente gli elementi
  local function pick_color(prompt_bufnr, map)
    local entry = require("telescope.actions.state").get_selected_entry()
    require("telescope.actions").close(prompt_bufnr)
    vim.cmd("hi Normal guifg=" .. entry.value)
  end

  -- Utilizza Telescope per visualizzare i colori esadecimali
  telescope.find_files({
    prompt_title = "Hex Colors",
    finder = require("telescope.finders").new_table({
      results = hex_colors,
    }),
    sorter = require("telescope.config").values.generic_sorter({}),
  })
end

function M.buffer()
  print("Buffer")
end

function M.setup()
  vim.cmd("command! PastelliTelescope lua require('pastelli').telescope()")
  vim.cmd("command! PastelliBuffer lua require('pastelli').buffer()")
end

return M
