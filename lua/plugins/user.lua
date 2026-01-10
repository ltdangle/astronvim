-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  { "catppuccin/nvim", name = "catppuccin" },
  {
    "Pocco81/auto-save.nvim",
    config = function() require("auto-save").setup {} end,
    lazy = false,
  },
  {
    "stevearc/oil.nvim",
    config = function() require("oil").setup { default_file_explorer = false } end,
    lazy = false,
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  },
  {
    "chrisbra/csv.vim",
    -- You can configure it further if needed
    -- ft = { "csv", "tsv" }, -- Optional: load only for these filetypes
  },
  {
    "ricardoramirezr/blade-nav.nvim",
    dependencies = { -- totally optional
      "hrsh7th/nvim-cmp", -- if using nvim-cmp
      { "ms-jpq/coq_nvim", branch = "coq" }, -- if using coq
      "saghen/blink.cmp", -- if using blink.cmp
    },
    ft = { "blade", "php" }, -- optional, improves startup time
    opts = {
      -- This applies for nvim-cmp and coq, for blink refer to the configuration of this plugin
      close_tag_on_complete = true, -- default: true
    },
  },
  -- Laravel blade plugin
  { "jwalton512/vim-blade" },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    lazy = false,
  },
}
