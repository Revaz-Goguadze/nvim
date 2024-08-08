require('telescope').setup {
  defaults = {

    prompt_prefix = "  ",
    selection_caret = " ",
    path_display = { "smart" },
    pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
    file_browser = {
      -- theme = "ivy",
      -- require("telescope.themes").get_dropdown {
      --   previewer = false,
      --   -- even more opts
      -- },
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        previewer = false,
        -- even more opts
      },
    },
  },
}
-- local builtin = require('telescope.builtin')
-- local bind = vim.keymap.set
-- bind('n', '<leader>sf', builtin.find_files, {desc = 'Find Files'})
-- bind('n', '<leader>sg', builtin.live_grep, {desc = 'Live Grep'})
-- bind('n', '<leader>sb',builtin.buffers, {desc = 'Buffers'})
-- bind('n', '<leader>sh',builtin.help_tags, {desc = 'Help Tags'})
-- bind('n', '<leader>sgf', builtin.git_files, {desc = 'Git Files'})
-- bind('n', '<leader>sgs', builtin.git_status, {desc = 'Git Status'})
-- bind('n', '<leader>sgb', builtin.git_branches, {desc = 'Git Branches'})
-- bind('n', '<leader>sgc', builtin.git_commits, {desc = 'Git Commits'})
-- bind('n', '<leader>ss', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)
-- bind('n', '<leader>skm', builtin.keymaps, {})
