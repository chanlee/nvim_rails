## Neovim 플러그인 사용 가이드 (현재 설정 기준)

아래 내용은 이 설정에 실제로 포함된 플러그인들의 사용법과 단축키를 요약합니다. 리더 키는 공백(스페이스)입니다.

- **리더 키**: `<leader>` = Space
- **기본 옵션**: 상대번호, 시스템 클립보드 연동(`unnamedplus`), 마우스(`mouse=a`), `termguicolors`
- **인덴트**: `tabstop=shiftwidth=softtabstop=2`, `expandtab`, `smartindent`
- **Ruby 파일**: 동일하게 2-space, `autoindent`/`smartindent` 적용

---

### 🎨 UI & 테마

- **Alpha (대시보드)**
  - `startify` 테마로 자동 적용. 추가 키맵 없음.
- **Catppuccin (테마)**
  - 자동 적용. 색상 스킴: `catppuccin`
- **Lualine (상태바)**
  - 자동 적용. 테마: `dracula`

---

### 📁 파일 탐색

- **Neo-tree**
  - `<C-n>` — 탐색기 토글

---

### 🔍 검색 (Telescope)

- `<leader>ff` — 파일 찾기
- `<leader>fg` — 내용 검색 (live grep)
- `telescope-ui-select` 확장 활성화 (dropdown 테마)

---

### 🔧 LSP (Language Server)

- 관리: Mason + mason-lspconfig + nvim-lspconfig
- 기본 활성화 서버: `lua_ls`, `biome`, `pylsp`, `solargraph`
- 키맵:
  - `K` — 심볼 호버/문서
  - `gd` — 정의로 이동
  - `<leader>ca` — 코드 액션

---

### 🌳 Treesitter

- 지원 언어: `lua`, `python`, `javascript`, `html`, `markdown`, `ruby`
- 하이라이트/인덴트 활성화

---

### ✍️ 자동완성 & 스니펫

- **nvim-cmp** (+ LuaSnip, friendly-snippets, LSP/buffer/path 소스)
  - `<C-x>` — 수동 완성 트리거
  - `<C-b>` / `<C-f>` — 문서 스크롤
  - `<C-e>` — 완성 취소
  - `<Esc>` — 완성 팝업 닫기
  - `<CR>` — 선택 확정 (자동 선택 허용)
  - `<C-n>` / `<C-p>` — 다음/이전 항목 선택
  - 스니펫: `<C-d>` — 확장/점프, `<C-u>` — 이전 점프
  - 소스: `nvim_lsp`, `buffer`, `path`, `luasnip`
    - ※ Copilot은 cmp 팝업이 아니라 인라인 제안으로만 제공됩니다.

- **Copilot (인라인 제안)**
  - **자동 트리거 비활성** — 단축키로만 제안을 요청합니다.
  - `<C-]>` — 제안 요청 / 다음 제안
  - `<C-\>` — 이전 제안
  - `<C-l>` — 전체 제안 수락
  - `<C-j>` — 라인 단위 수락
  - `<C-w>` — 단어 단위 수락
  - `<C-q>` — 제안 취소
  - 패널: `<C-CR>` — 열기, `[[` / `]]` — 패널 내 이동, `gr` — 새로고침, `<CR>` — 수락
  - 비활성 파일타입: `yaml`, `markdown`, `help`, `gitcommit`, `gitrebase`, `hgcommit`, `svn`, `cvs`

---

### 🛠️ 포매터 & 린터

- **Conform (format-on-save)**
  - 언어별 포매터: `lua → stylua`, `python → isort + black`, `javascript/typescript → prettierd/prettier`, `ruby → rubocop --autocorrect-all`
  - 저장 시 자동 포매팅 (timeout 500ms, LSP fallback)
  - `<leader>mp` — 수동 포매팅 (비주얼 모드 범위 지원)

- **None-ls (null-ls)**
  - 포매팅: `stylua`, `prettier`, `black`, `isort`, `rubocop`
  - 진단: `rubocop`
  - `<leader>gf` — LSP 포맷 호출 (`vim.lsp.buf.format`)

---

### 📝 Markdown

- **markdown-preview.nvim**
  - `<leader>mp` — 미리보기 토글 (`MarkdownPreviewToggle`)
    - ⚠️ Conform의 `<leader>mp`(수동 포매팅)와 키가 겹칩니다. markdown 파일을 열면 markdown-preview가 로드되며, 충돌 시 마지막에 등록된 매핑이 우선됩니다.
  - 명령: `:MarkdownPreview`, `:MarkdownPreviewStop`
- **render-markdown.nvim**
  - `<leader>mr` — 인-에디터 렌더링 토글 (`RenderMarkdown toggle`)

---

### 🐛 디버깅 (nvim-dap + dap-ui + dap-ruby)

- `<leader>dt` — 브레이크포인트 토글
- `<leader>dc` — 계속 실행
- `<leader>dx` — 세션 종료
- `<leader>do` — 스텝 오버
- 디버깅 시작/종료 시 dap-ui 자동 열림/닫힘

---

### 📝 Git 통합 (vim-fugitive)

- `<leader>gs` — Git 상태 (`:Git`)
- `<leader>gb` — Git blame
- `<leader>gc` — Git commit
- `<leader>gd` — Git diff
- `<leader>gp` — Git push
- `<leader>gl` — Git pull
- `<leader>ga` — 현재 파일 add (`Gwrite`)
- `<leader>gt` — 현재 파일 add 대안 (`Git add %`)
- `<leader>gA` — 전체 add (`Git add .`)
- fugitive 버퍼 내부: `s` — `Git add %:p`, `u` — `Git reset HEAD %:p`
- 커스텀 명령: `:Gadd [path]` — 경로 지정 시 `Git add <path>`, 미지정 시 `Gwrite`

---

### 🖥️ 터미널 (Floaterm)

- `<C-t>` — 플로팅 터미널 토글 (`:FloatermToggle`)

---

### 📋 버퍼 관리 (nvim-smartbufs + 커스텀 탭라인)

- 항상 탭라인 표시(`showtabline=2`), 마우스 클릭으로 버퍼 전환 가능
- 버퍼 이동/점프
  - `<leader>1` ~ `<leader>9` — 해당 인덱스 버퍼로 이동
  - `<Right>` / `<Left>` — 다음/이전 버퍼
- 터미널 버퍼
  - `<leader>c1` ~ `<leader>c4` — 터미널 1~4로 이동
- 버퍼 닫기
  - `<leader>qq` — 현재 버퍼 닫기
  - `<leader>q1` ~ `<leader>q9` — 지정 인덱스 버퍼 닫기

---

### 💾 세션 관리 (auto-session)

- `<leader>ls` — 세션 검색/로드 (`AutoSession search`)
- `<leader>ss` — 세션 저장 (`AutoSession save`)
- `<leader>sr` — 세션 복원 (`AutoSession restore`)
- `<leader>sd` — 세션 삭제 (`AutoSession delete`)
- 종료 시 자동 저장 — 제외 디렉토리: `~/`, `~/workspace`, `~/labs`, `/`

---

### 📌 명령어 팁

- 플러그인 관리: `:Lazy`, `:Lazy update`, `:Lazy sync`
- Treesitter 업데이트: `:TSUpdate`
- Mason UI: `:Mason`
- 설정 리로드: `:source %`
