---@type PluginSpec
local Spec = { "akinsho/toggleterm.nvim" }

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local shell = vim.o.shell
  if vim.fn.executable "pwsh" == 1 then
    shell = "pwsh"
  end

  require("toggleterm").setup {
    open_mapping = "<F12>",
    close_on_exit = true,
    ---@type string | "vertical" | "horizontal" | "tab" | "float"
    direction = "horizontal",
    shell = shell,
    float_opts = {
      border = "rounded",
      winblend = 25,
    },
  }
end

return Spec
