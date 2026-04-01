require "nvchad.autocmds"

-- NvimTree を起動時に開く
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
    vim.cmd "wincmd l"
  end,
})

-- NvimTree 以外のバッファがすべて閉じられたら終了
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local wins = vim.api.nvim_list_wins()
    local non_tree = 0
    for _, win in ipairs(wins) do
      local buf = vim.api.nvim_win_get_buf(win)
      local ft = vim.bo[buf].filetype
      if ft ~= "NvimTree" then
        non_tree = non_tree + 1
      end
    end
    if non_tree == 0 then
      vim.cmd "qa"
    end
  end,
})
