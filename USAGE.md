## Neovim 플러그인 사용 가이드 (현재 설정 기준)

아래 내용은 이 설정에 실제로 포함된 플러그인들의 사용법과 단축키를 요약합니다. 리더 키는 공백(스페이스)입니다.

- **리더 키**: `<leader>` = Space
- **기본 옵션**: 상대번호, 시스템 클립보드 연동(`unnamedplus`), 마우스(`mouse=a`), `termguicolors`
- **인덴트**: `tabstop=shiftwidth=softtabstop=2`, `expandtab`, `smartindent`
- **Ruby 파일**: 동일하게 2-space, `autoindent`/`smartindent` 적용

> 키맵이 많아 외우기 어렵다면 `<leader>` 누르고 잠시 대기하면 **which-key**가 가능한 키를 보여줍니다.

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
- 기본 활성화 서버: `lua_ls`, `biome`, `pylsp`, `solargraph`, `ts_ls`
- 키맵:
  - `K` — 심볼 호버/문서
  - `gd` — 정의로 이동
  - `<leader>ca` — 코드 액션

---

### 🌳 Treesitter

- 지원 언어:
  - 기본: `lua`, `python`, `javascript`, `html`, `markdown`, `ruby`
  - Node/TS: `typescript`, `tsx`, `jsdoc`, `json`, `jsonc`, `yaml`, `css`, `scss`
  - Rails/Ruby: `embedded_template`(ERB), `eruby`, `rbs`
  - 공통: `bash`, `dockerfile`, `gitignore`, `gitcommit`, `diff`, `vim`, `vimdoc`, `regex`, `markdown_inline`
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

### 🛠️ 포매터 (Conform)

- 언어별 포매터:
  - `lua` → `stylua`
  - `python` → `isort` + `black`
  - `javascript`/`typescript` → `prettierd` (없으면 `prettier`)
  - `ruby` → `rubocop --autocorrect-all`
- 저장 시 자동 포매팅 (timeout 500ms, LSP fallback)
- `<leader>cf` — 수동 포매팅 (비주얼 모드 범위 지원)

> 이전에 있던 `none-ls`는 Conform과 기능이 중복되어 제거했습니다. rubocop 진단은 solargraph LSP에서 제공됩니다.

---

### 📝 Markdown

- **markdown-preview.nvim**
  - `<leader>mp` — 브라우저 미리보기 토글 (`MarkdownPreviewToggle`)
  - 명령: `:MarkdownPreview`, `:MarkdownPreviewStop`
- **render-markdown.nvim**
  - `<leader>mr` — 인-에디터 렌더링 토글 (`RenderMarkdown toggle`)

---

### 🐛 디버깅 (nvim-dap + dap-ui + dap-ruby + dap-python)

- `<leader>dt` — 브레이크포인트 토글
- `<leader>dc` — 계속 실행
- `<leader>dx` — 세션 종료
- `<leader>do` — 스텝 오버
- 디버깅 시작/종료 시 dap-ui 자동 열림/닫힘
- **Ruby**: `dap-ruby`(rdbg) — `bundle add debug` 필요
- **Python**: `dap-python`(debugpy) — `pip install debugpy` 또는 Mason으로 설치

---

### 📝 Git 통합

#### vim-fugitive (파일 단위)

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

#### gitsigns.nvim (hunk 단위, 인라인)

- 사인 컬럼에 `+/~/_` 표시 — 변경된 라인 인식
- `]c` / `[c` — 다음/이전 hunk 이동
- `<leader>hs` — hunk stage (visual 범위 지원)
- `<leader>hr` — hunk reset (visual 범위 지원)
- `<leader>hS` — 버퍼 전체 stage
- `<leader>hR` — 버퍼 전체 reset
- `<leader>hp` — hunk preview
- `<leader>hb` — 현재 라인 blame (full)
- `<leader>hd` — 현재 버퍼 diff
- `<leader>htb` — 라인 blame 표시 토글
- `<leader>htd` — 삭제된 라인 표시 토글

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

### ✂️ 편집 보조

- **nvim-surround** — 괄호/따옴표 둘러싸기
  - `ys{motion}{char}` — 추가 (`ysiw)` → 단어를 `()`로 감싸기)
  - `cs{old}{new}` — 변경 (`cs"'` → `"…"` → `'…'`)
  - `ds{char}` — 제거 (`ds"` → 감싼 `"` 제거)
- **nvim-autopairs** — 괄호/따옴표 자동 닫기 (Treesitter 인식)
- **Comment.nvim** — 코멘트 토글
  - `gcc` — 현재 줄 코멘트 토글
  - `gc{motion}` — 모션 범위 코멘트 (예: `gcap`)
  - 비주얼 모드: `gc` — 선택 범위 코멘트
  - ERB/JSX 등 임베디드 파일에서는 `ts-context-commentstring`가 자동으로 적절한 코멘트 문법 적용

---

### 🔑 which-key

- `<leader>` 누르고 잠시 대기 → 가능한 다음 키와 그룹 라벨이 팝업으로 표시
- `<leader>?` — 현재 버퍼에서 사용 가능한 키맵 전체 보기
- 등록된 그룹: `c`(Code/Conform), `d`(Debug), `f`(Find), `g`(Git), `h`(Hunk), `m`(Markdown), `q`(Buffer close), `s`(Session)

---

### 📌 명령어 팁

- 플러그인 관리: `:Lazy`, `:Lazy update`, `:Lazy sync`
- Treesitter 업데이트: `:TSUpdate`
- Mason UI: `:Mason`
- LSP 정보: `:LspInfo`
- Conform 포매터 정보: `:ConformInfo`
- 설정 리로드: `:source %`
