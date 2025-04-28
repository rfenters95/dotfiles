local M = {}

function M.open()
  local buf = vim.api.nvim_create_buf(false, true)

  local width = vim.o.columns
  local height = vim.o.lines

  local win_width = math.ceil(width * 0.6)
  local win_height = math.ceil(height * 0.6)

  local row = math.ceil((height - win_height) / 2)
  local col = math.ceil((width - win_width) / 2)

  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "rounded",
  }

  vim.api.nvim_open_win(buf, true, opts)

  local header = {
    "███╗   ███╗██╗   ██╗██████╗ ",
    "████╗ ████║██║   ██║██╔══██╗",
    "██╔████╔██║██║   ██║██████╔╝",
    "██║╚██╔╝██║██║   ██║██╔═══╝ ",
    "██║ ╚═╝ ██║╚██████╔╝██║     ",
    "╚═╝     ╚═╝ ╚═════╝ ╚═╝     ",
    "",
    "    Welcome to MyDash!",
    "",
    "  [e] Edit config   [p] Plugins   [q] Quit",
  }

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, header)

  -- Setup simple keymaps
  vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = buf, nowait = true })
  vim.keymap.set("n", "e", "<cmd>edit ~/.config/nvim/init.lua<cr>", { buffer = buf, nowait = true })
  vim.keymap.set("n", "p", "<cmd>Lazy<cr>", { buffer = buf, nowait = true })
end

function M.setup()
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      if vim.fn.argc() == 0 then
        M.open()
      end
    end,
  })
end

return M
