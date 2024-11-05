return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function ()
    CustomOilBar = function()
      local path = vim.fn.expand "%"
      path = path:gsub("oil://", "")

      return "  " .. vim.fn.fnamemodify(path, ":.")
    end
    require("oil").setup {
        columns = {},
        view_options = {
            show_hidden = true,
        }
    }

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end
}
