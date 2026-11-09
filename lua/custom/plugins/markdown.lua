vim.pack.add({
  { src = "https://github.com/obsidian-nvim/obsidian.nvim", version = vim.version.range("*") },
  -- Optional but recommended: a picker for search/quick-switch
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim", -- telescope needs this
})

require("obsidian").setup({
  legacy_commands = false, -- use the new `:Obsidian <sub>` command style
  workspaces = {
    { name = "notes", path = "~/vault" }, -- ← your vault path
  },
  picker = { name = "telescope.nvim" },
  daily_notes = { folder = "daily" },
  ui = { enable = false },
})

-- Obsidian-style rendering of links and checkboxes needs conceal
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function() vim.opt_local.conceallevel = 2 end,
})

-- Keymaps
local map = vim.keymap.set
map("n", "<leader>on", "<cmd>Obsidian new<cr>",          { desc = "New note" })
map("n", "<leader>oo", "<cmd>Obsidian quick_switch<cr>", { desc = "Find note" })
map("n", "<leader>os", "<cmd>Obsidian search<cr>",       { desc = "Grep vault" })
map("n", "<leader>ot", "<cmd>Obsidian today<cr>",        { desc = "Today's daily" })
map("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>",    { desc = "Backlinks" })
map("n", "<leader>oc", "<cmd>Obsidian toggle_checkbox<cr>", { desc = "Toggle checkbox" })

-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
--   group = lint_augroup,
--   callback = function()
--     if not vim.bo.modifiable then return end
--     local root = vim.fs.root(0, {
--       '.markdownlint.json', '.markdownlint.jsonc',
--       '.markdownlint.yaml', '.markdownlint.yml', '.markdownlintrc',
--     })
--     lint.try_lint(nil, { cwd = root })
--   end,
-- })


vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("render-markdown").setup({
  file_types = { "markdown" },
  completions = { lsp = { enabled = true } },
  latex = { enabled = false }, -- snacks handles math
})


vim.pack.add { 'https://github.com/folke/snacks.nvim' }

require("snacks").setup({
  image = {
    enabled = true,
    doc = { enabled = true, inline = true, float = true },
    math = { enabled = true, latex = {
        font_size = 'large',
        tpl = [[
\documentclass[preview,border=0pt,varwidth,12pt]{standalone}
\usepackage{${packages}}
\begin{document}
${header}
{ \${font_size} \selectfont
  \color[HTML]{${color}}
  \boldmath
${content}}
\end{document}]],
      },
    },  -- e.g. 'normalsize', 'large', 'Large', 'LARGE'
  },
})
