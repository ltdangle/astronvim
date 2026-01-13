-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
        winbar = "%F",
        shada = "!,'100,<50,s10,h", -- peristent marks
        --  execute aliases in command line
        shell = "/bin/bash",
        shellcmdflag = "-ic",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- Pbcopy current file path
        ["<leader>cp"] = { "<cmd>! echo %:p | pbcopy<CR>", desc = "Pbcopy current file path" },
        ["<leader>cd"] = { "<cmd>! echo %:p:h | pbcopy<CR>", desc = "Pbcopy current file dir" },

        -- Bind number keys to global marks
        ["1"] = { "`A", desc = "Jump to mark A" },
        ["2"] = { "`B", desc = "Jump to mark B" },
        ["3"] = { "`C", desc = "Jump to mark C" },
        ["4"] = { "`D", desc = "Jump to mark D" },
        ["5"] = { "`E", desc = "Jump to mark E" },
        ["6"] = { "`F", desc = "Jump to mark F" },
        ["7"] = { "`G", desc = "Jump to mark G" },
        ["8"] = { "`H", desc = "Jump to mark H" },
        ["9"] = { "`I", desc = "Jump to mark I" },
        ["0"] = { "`J", desc = "Jump to mark J" },
        ["<Leader>1"] = { "mA", desc = "Set mark A" },
        ["<Leader>2"] = { "mB", desc = "Set mark B" },
        ["<Leader>3"] = { "mC", desc = "Set mark C" },
        ["<Leader>4"] = { "mD", desc = "Set mark D" },
        ["<Leader>5"] = { "mE", desc = "Set mark E" },
        ["<Leader>6"] = { "mF", desc = "Set mark F" },
        ["<Leader>7"] = { "mG", desc = "Set mark G" },
        ["<Leader>8"] = { "mH", desc = "Set mark H" },
        ["<Leader>9"] = { "mI", desc = "Set mark I" },
        ["<Leader>0"] = { "mJ", desc = "Set mark J" },
        ["<Leader>dm"] = { "<cmd>delmarks A-J<cr>", desc = "Clear all number marks" },

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Show full diagnostics (trouble) in quickfix window
        ["<leader>lt"] = { "<cmd>Trouble<CR>", desc = "Trouble" },

        -- Search  workspace symbols (lsp)
        ["<leader>fd"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "Search workspace symbols" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,

        -- Move line
        ["<C-k>"] = { ":m-2<cr>", desc = "Move line up" },
        ["<C-j>"] = { ":m+<cr>", desc = "Move line down" },
        -- oil.nvim mappings
        ["-"] = { "<cmd>Oil<cr>", desc = "Oil: open current directory" },
      },
    },
  },
}
