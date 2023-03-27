local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local colors = require("onedark.palette").darker


-- Statusline --
----------------
local Align = { provider = "%="}
local Separator = { provider = " "}

local ViMode = {
  init = function(self)
    self.mode = vim.fn.mode(1)
  end,
  static = {
    mode_names = {
      n = 'Normal',
      i = 'Insert',
      v = 'Visual',
      V = 'Visual L',
      R = 'Replace',
      c = 'Command',
      t = 'Term'
    },
    mode_colors = {
      n = "green" ,
      i = "blue",
      v = "cyan",
      V =  "cyan",
      c =  "orange",
      R =  "orange",
      t = "red"
    }
  },
  provider = function(self)
    return "  "
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character
    return { fg = "bg1", bg = self.mode_colors[mode], }
  end,
  update = {
    "ModeChanged",
  },
}

local Git = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  hl = { fg = "cyan" },
  {
    -- git branch name
    provider = function(self)
        return " " .. self.status_dict.head
    end,
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (" " .. count)
    end,
    hl = { fg = "green" }
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (" " .. count)
    end,
    hl = { fg = "orange" }
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (" " .. count)
    end,
    hl = { fg = "red" }
  },
}


local FileIcon = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
    local extension = vim.fn.fnamemodify(self.filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(self.filename, extension, { default = true })
  end,
  provider = function(self)
    if self.filename == "" then
      return ""
    end
    return self.icon
  end,
  hl = function(self)
    return { fg = self.icon_color, bold = false }
  end
}

local FileType = {
  init = function(self)
		self.filename = vim.fn.expand("%:t")
  end,
  provider = function(self)
		if vim.fn.empty(self.filename) == 1 then
			return ""
		end
    return vim.bo.filetype .. " "
  end,
  hl = { fg = "fg", bold = true },
}

local FileModifer = {
  condition = function()
    return vim.bo.modified
  end,
  provider = "",
  hl = { fg = "cyan", bold = true, force=true }
}

local End = {
	provider = " ",
	hl = {
		bg = "blue",
	},
}

local Statusline = {
  hl = { bg = 'bg1'},
  ViMode,
  Separator,
  FileType,
  FileIcon,
  Separator,
  FileModifer,
  Align,
  Git,
  Separator,
  End
}

require("heirline").setup({
  statusline = Statusline,
    opts = {
        colors = colors,
    }
})