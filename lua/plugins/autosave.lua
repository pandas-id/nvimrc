local M = {}

function M.config()
  local autosave = require("autosave")

  autosave.setup(
      {
          enabled = true,
          execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
          events = {"InsertLeave"},
          conditions = {
              exists = true,
              filetype_is_not = {},
              modifiable = true
          },
          write_all_buffers = false,
          on_off_commands = true,
          clean_command_line_interval = 0,
      debounce_delay = 1.5
      }
  )
end

return M
