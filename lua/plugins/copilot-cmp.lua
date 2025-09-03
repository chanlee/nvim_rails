return {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  config = function() 
    require("copilot_cmp").setup()
  end,
  dependencies = {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require("copilot").setup({
        suggestion = { 
          enabled = true,  -- inline suggestion 활성화
          auto_trigger = true,
          debounce = 75,
          keymap = {
            -- Copilot inline suggestion용 키맵 (ESC와 충돌하지 않도록 수정)
            accept = "<C-l>",        -- Ctrl+l: 전체 제안 수락
            accept_word = "<C-w>",   -- Ctrl+w: 단어 단위 수락
            accept_line = "<C-j>",   -- Ctrl+j: 라인 단위 수락
            next = "<C-]>",          -- Ctrl+]: 다음 제안
            prev = "<C-\\>",         -- Ctrl+\: 이전 제안 (ESC와 충돌 방지)
            dismiss = "<C-q>",       -- Ctrl+q: 제안 취소
          },
        },
        panel = { 
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<C-CR>"  -- Ctrl+Enter: 패널 열기
          },
          layout = {
            position = "bottom", -- bottom, top, left, right
            ratio = 0.4
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
}