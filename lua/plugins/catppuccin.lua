--@type PluginSpec
local Spec = { "catppuccin/nvim", as = "catppuccin" }

Spec.run = function()
  require("catppuccin").compile()
end

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("catppuccin", { clear = true }),
    pattern = "PackerCompileDone",
    callback = function()
      require("catppuccin").compile()
    end,
  })

  require("catppuccin").setup {
    transparent_background = false,
    term_colors = true,
    compile = {
      enable = true,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      coc_nvim = false,
      lsp_trouble = true,
      cmp = true,
      lsp_saga = false,
      gitgutter = true,
      gitsigns = true,
      leap = false,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = true,
        transparent_panel = false,
      },
      neotree = {
        enabled = false,
        show_root = true,
        transparent_panel = false,
      },
      dap = {
        enabled = false,
        enable_ui = false,
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = true,
      hop = false,
      notify = true,
      telekasten = true,
      symbols_outline = true,
      mini = false,
      aerial = false,
      vimwiki = true,
      beacon = true,
      navic = true,
      overseer = false,
    },
    color_overrides = {
      -- macchiato = {
      -- text = "#F4CDE9",
      -- subtext1 = "#DEBAD4",
      -- subtext0 = "#C8A6BE",
      -- overlay2 = "#B293A8",
      -- overlay1 = "#9C7F92",
      -- overlay0 = "#866C7D",
      -- surface2 = "#705867",
      -- surface1 = "#5A4551",
      -- surface0 = "#44313B",
      -- base = "#352939",
      -- mantle = "#211924",
      -- crust = "#1a1016",
      -- },
    },
    highlight_overrides = {
      all = function(colors)
        return {
          Comment = {fg = colors.pink},
          LineNr = {fg = colors.flamingo},
        }
      end
    },
  }

  ---@type string | "latte" | "frappe" | "macchiato" | "mocha"
  vim.cmd [[colorscheme catppuccin-macchiato]]
end

return Spec
