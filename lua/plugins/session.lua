return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      auto_session_suppress_dirs = { "~/", "~/workspace", "~/labs", "/" },
      session_lens = {
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    })
    
    -- 세션 검색을 위한 키맵 (최신 방식)
    vim.keymap.set("n", "<leader>ls", "<cmd>AutoSession search<CR>", { 
      noremap = true, 
      desc = "Load Session" 
    })
  end,
}

