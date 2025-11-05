## Neovim 플러그인 사용 가이드 (현재 설정 기준)

아래 내용은 이 설정에 실제로 포함된 플러그인들의 사용법과 단축키를 요약합니다. 리더 키는 공백(스페이스)입니다.

- **리더 키**: `<leader>` = Space
- **기본 키 정보**: 상대번호, 시스템 클립보드 연동, 마우스 사용 가능

---

### 🎨 UI & 테마

- **Alpha (대시보드)**
  - 설치만 되어 있으며 시작 화면을 제공합니다. 추가 키맵은 없습니다.

- **Catppuccin (테마)**
  - 자동 적용됩니다. 색상 스킴: `catppuccin`

- **Lualine (상태바)**
  - 자동 적용됩니다. 테마: `dracula`

---

### 📁 파일 탐색

- **Neo-tree (파일 탐색기)**
  - 키맵: `<C-n>` — 탐색기 토글

---

### 🔍 검색

- **Telescope**
  - `<leader>ff` — 파일 찾기
  - `<leader>fg` — 내용 검색 (live grep)

---

### 🔧 LSP (Language Server)

- 관리: Mason, mason-lspconfig, nvim-lspconfig 사용
- 기본 제공 LSP 서버: `lua_ls`, `biome`, `pylsp`, `solargraph`
- 키맵:
  - `K` — 심볼 문서/호버
  - `gd` — 정의로 이동
  - `<leader>ca` — 코드 액션

---

### 🌳 Treesitter

- 지원 언어: `lua`, `python`, `javascript`, `html`, `markdown`, `ruby`
- 하이라이트/인덴트 활성화됨

---

### ✍️ 자동완성 & 스니펫

- **nvim-cmp** (+ LuaSnip, friendly-snippets, buffer/path/LSP 소스)
  - `<C-Space>` — 수동 완성 트리거
  - `<C-b>` / `<C-f>` — 문서 스크롤
  - `<C-e>` — 취소, `<Esc>` — 닫기
  - `<CR>` — 선택 확정 (자동 선택 허용)
  - `<C-n>` / `<C-p>` — 항목 이동
  - 스니펫: `<C-d>` — 확장/점프, `<C-u>` — 이전 점프

- **Copilot (inline 제안)**
  - `<C-l>` — 전체 제안 수락
  - `<C-w>` — 단어 단위 수락
  - `<C-j>` — 라인 단위 수락
  - `<C-]>` — 다음 제안
  - `<C-\>` — 이전 제안
  - `<C-q>` — 제안 취소
  - 패널: `<C-CR>` — 열기, `[[`/`]]` — 패널 이동, `gr` — 새로고침, `<CR>` — 수락

- **CopilotChat (AI 채팅)**
  - `<leader>cc` — 채팅 열기/닫기 (비주얼 모드에서도 사용 가능)
  - 퀵 액션:
    - `<leader>ce` — 코드 설명
    - `<leader>cr` — 코드 리뷰
    - `<leader>cf` — 코드 수정
    - `<leader>co` — 코드 최적화
    - `<leader>cd` — 문서 생성
    - `<leader>ct` — 테스트 생성
    - `<leader>cF` — 진단 오류 수정
    - `<leader>cC` — 커밋 메시지 생성

---

### 🛠️ 포매터 & 린터

- **Conform (format-on-save)**
  - 언어별 포매터: `stylua`, `isort`+`black`, `prettierd`/`prettier`, `rubocop`
  - 저장 시 자동 포매팅 활성화
  - `<leader>mp` — 수동 포매팅 (비주얼 모드 범위 지원)

- **None-ls (null-ls)**
  - 포매팅: `stylua`, `prettier`, `black`, `isort`, `rubocop`
  - 진단: `rubocop`
  - `<leader>gf` — LSP 포맷 호출

---

### 🐛 디버깅 (nvim-dap + dap-ui + ruby)

- `<leader>dt` — 브레이크포인트 토글
- `<leader>dc` — 계속 실행
- `<leader>dx` — 종료
- `<leader>do` — 스텝 오버
- 디버깅 시작/종료 시 UI 자동 열림/닫힘

---

### 📝 Git 통합 (vim-fugitive)

- `<leader>gs` — Git 상태
- `<leader>gb` — Git blame
- `<leader>gc` — Git commit
- `<leader>gd` — Git diff
- `<leader>gp` — Git push
- `<leader>gl` — Git pull
- `<leader>ga` — 현재 파일 add (Gwrite)
- `<leader>gt` — 현재 파일 add (대안: `Git add %`)
- `<leader>gA` — 전체 add (`Git add .`)

---

### 🖥️ 터미널 (Floaterm)

- `<C-t>` — 플로팅 터미널 토글

---

### 📋 버퍼 관리 (nvim-smartbufs + 커스텀 탭라인)

- 버퍼 이동/점프
  - `<leader>1-9` — 버퍼 1-9로 이동
  - `<Right>` / `<Left>` — 다음/이전 버퍼
- 터미널 버퍼
  - `<leader>c1-4` — 터미널 1-4로 이동
- 버퍼 닫기
  - `<leader>qq` — 현재 버퍼 닫기
  - `<leader>q1-9` — 지정 버퍼 닫기

---

### 💾 세션 관리 (auto-session)

- `<leader>ls` — 세션 검색/로드
- `<leader>ss` — 세션 저장
- `<leader>sr` — 세션 복원
- `<leader>sd` — 세션 삭제
- 종료 시 자동 저장(특정 디렉토리 제외)

---

### 📌 팁

- 플러그인 관리: `:Lazy`, `:Lazy update`, `:Lazy sync`
- Treesitter 업데이트: `:TSUpdate`
- Mason UI: `:Mason`
- 설정 리로드: `:source %`


