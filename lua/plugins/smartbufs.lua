return {
  'johann2357/nvim-smartbufs',
  dependencies = { "echasnovski/mini.icons" }, -- optional: required for file icons
  config = function()
    -- Tabline 표시 설정
    vim.o.showtabline = 2 -- 항상 tabline 표시 (0=never, 1=when needed, 2=always)
    
    -- 커스텀 tabline 함수 정의
    local function custom_tabline()
      local buflist = vim.api.nvim_list_bufs()
      local current = vim.api.nvim_get_current_buf()
      local tabline = ''
      local index = 1
      
      for _, buf in ipairs(buflist) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
          local name = vim.api.nvim_buf_get_name(buf)
          local filename = vim.fn.fnamemodify(name, ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          
          -- 현재 버퍼 하이라이트
          local hi = buf == current and '%#TabLineSel#' or '%#TabLine#'
          local modified = vim.bo[buf].modified and '[+]' or ''
          
          -- 클릭 가능한 탭 추가
          tabline = tabline .. hi .. '%' .. buf .. 'T' .. ' ' .. index .. ':' .. filename .. modified .. ' '
          index = index + 1
        end
      end
      
      return tabline .. '%#TabLineFill#%T'
    end
    
    -- 전역 함수로 등록하고 tabline에 적용
    _G.smartbufs_tabline = custom_tabline
    vim.o.tabline = '%!v:lua.smartbufs_tabline()'
    
    -- 마우스 클릭으로 버퍼 전환 활성화
    vim.o.mouse = 'a'

    -- 버퍼 인덱스로 점프 (터미널 버퍼 제외)
    vim.keymap.set('n', '<Leader>1', function() require('nvim-smartbufs').goto_buffer(1) end, { desc = 'Go to buffer 1' })
    vim.keymap.set('n', '<Leader>2', function() require('nvim-smartbufs').goto_buffer(2) end, { desc = 'Go to buffer 2' })
    vim.keymap.set('n', '<Leader>3', function() require('nvim-smartbufs').goto_buffer(3) end, { desc = 'Go to buffer 3' })
    vim.keymap.set('n', '<Leader>4', function() require('nvim-smartbufs').goto_buffer(4) end, { desc = 'Go to buffer 4' })
    vim.keymap.set('n', '<Leader>5', function() require('nvim-smartbufs').goto_buffer(5) end, { desc = 'Go to buffer 5' })
    vim.keymap.set('n', '<Leader>6', function() require('nvim-smartbufs').goto_buffer(6) end, { desc = 'Go to buffer 6' })
    vim.keymap.set('n', '<Leader>7', function() require('nvim-smartbufs').goto_buffer(7) end, { desc = 'Go to buffer 7' })
    vim.keymap.set('n', '<Leader>8', function() require('nvim-smartbufs').goto_buffer(8) end, { desc = 'Go to buffer 8' })
    vim.keymap.set('n', '<Leader>9', function() require('nvim-smartbufs').goto_buffer(9) end, { desc = 'Go to buffer 9' })

    -- 개선된 버퍼 이동 (터미널 버퍼 제외)
    vim.keymap.set('n', '<Right>', function() require('nvim-smartbufs').goto_next_buffer() end, { desc = 'Next buffer' })
    vim.keymap.set('n', '<Left>', function() require('nvim-smartbufs').goto_prev_buffer() end, { desc = 'Previous buffer' })

    -- 터미널 버퍼 관리 (숨김 설정으로 삭제 방지)
    vim.keymap.set('n', '<Leader>c1', function() require('nvim-smartbufs').goto_terminal(1) end, { desc = 'Go to terminal 1' })
    vim.keymap.set('n', '<Leader>c2', function() require('nvim-smartbufs').goto_terminal(2) end, { desc = 'Go to terminal 2' })
    vim.keymap.set('n', '<Leader>c3', function() require('nvim-smartbufs').goto_terminal(3) end, { desc = 'Go to terminal 3' })
    vim.keymap.set('n', '<Leader>c4', function() require('nvim-smartbufs').goto_terminal(4) end, { desc = 'Go to terminal 4' })

    -- 현재 버퍼 삭제 (이전 버퍼로 이동)
    vim.keymap.set('n', '<Leader>qq', function() require('nvim-smartbufs').close_current_buffer() end, { desc = 'Close current buffer' })

    -- 인덱스별 버퍼 삭제
    vim.keymap.set('n', '<Leader>q1', function() require('nvim-smartbufs').close_buffer(1) end, { desc = 'Close buffer 1' })
    vim.keymap.set('n', '<Leader>q2', function() require('nvim-smartbufs').close_buffer(2) end, { desc = 'Close buffer 2' })
    vim.keymap.set('n', '<Leader>q3', function() require('nvim-smartbufs').close_buffer(3) end, { desc = 'Close buffer 3' })
    vim.keymap.set('n', '<Leader>q4', function() require('nvim-smartbufs').close_buffer(4) end, { desc = 'Close buffer 4' })
    vim.keymap.set('n', '<Leader>q5', function() require('nvim-smartbufs').close_buffer(5) end, { desc = 'Close buffer 5' })
    vim.keymap.set('n', '<Leader>q6', function() require('nvim-smartbufs').close_buffer(6) end, { desc = 'Close buffer 6' })
    vim.keymap.set('n', '<Leader>q7', function() require('nvim-smartbufs').close_buffer(7) end, { desc = 'Close buffer 7' })
    vim.keymap.set('n', '<Leader>q8', function() require('nvim-smartbufs').close_buffer(8) end, { desc = 'Close buffer 8' })
    vim.keymap.set('n', '<Leader>q9', function() require('nvim-smartbufs').close_buffer(9) end, { desc = 'Close buffer 9' })
  end
}
