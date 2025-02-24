--[[ return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = false,
          async=true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = true,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end
  } ]]

  return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- for file icons
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true, -- Close Neo-tree if it's the last window
        enable_git_status = true,
        enable_diagnostics = false, -- Disable diagnostics in tree for performance
        filesystem = {
          follow_current_file = {
            enabled = true, -- Keep tree focused on the current file
          },
          hijack_netrw = true, -- Replace netrw with Neo-tree
          use_libuv_file_watcher = true, -- Detect file changes
        },
        window = {
          width = 35,
          mappings = {
            ["<space>"] = "toggle_node",
            ["<CR>"] = "open",
            ["<esc>"] = "cancel", -- Close Neo-tree with Escape
            ["l"] = "open",
            ["h"] = "close_node",
            ["R"] = "refresh",
          },
        },
        buffers = {
          follow_current_file = true, -- Show open buffers in the tree
        },
      })
  
      -- Keybindings
      local keymap = vim.keymap.set
      keymap("n", "<leader>ee", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })
      keymap("n", "<leader>ef", "<cmd>Neotree reveal<CR>", { desc = "Show current file in explorer" })
      keymap("n", "<leader>ec", "<cmd>Neotree close<CR>", { desc = "Close file explorer" })
      keymap("n", "<leader>er", "<cmd>Neotree refresh<CR>", { desc = "Refresh file explorer" })
    end,
  }
