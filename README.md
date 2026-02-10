# Neovim 설정 가이드

## 기본 설정

### 에디터 설정

- **Leader Key**: Space (`<leader>`)
- **탭/인덴트**: 2 spaces
- **클립보드**: 시스템 클립보드 연동 (unnamedplus)

### 일반 단축키

- **매크로 실행**:
    - `q + 레지스트명` (qa, qb, ...) → `q` 종료
    - `@ + 레지스트명` 또는 `숫자 + @ + 레지스트명` (반복 실행)
    - `@@` (직전 매크로 실행)
- **설정 다시 로드**: `:source %`

---

## 플러그인 목록 및 사용법

### 1. **Alpha** - 스타트업 대시보드

- **패키지**: `goolord/alpha-nvim`
- **기능**: Neovim 시작 시 격자무늬 대시보드 표시
- **단축키**: 없음 (자동 실행)

### 2. **Catppuccin** - 컬러 테마

- **패키지**: `catppuccin/nvim`
- **기능**: Catppuccin 컬러 스키마 적용
- **단축키**: 없음 (자동 적용)

### 3. **Completion** - 자동완성 엔진

- **패키지**: `hrsh7th/nvim-cmp` (+ cmp-nvim-lsp, LuaSnip, friendly-snippets)
- **기능**: LSP 기반 자동완성, 스니펫 지원
- **단축키**:
    - `<Tab>`: 다음 완성 항목 선택
    - `<S-Tab>`: 이전 완성 항목 선택
    - `<C-b>`: 문서 위로 스크롤
    - `<C-f>`: 문서 아래 스크롤
    - `<C-e>`: 자동완성 취소
    - `<CR>`: 완성 항목 선택 확인

### 4. **Debugging** - DAP (Debug Adapter Protocol)

- **패키지**: `mfussenegger/nvim-dap` (+ nvim-dap-ui, nvim-dap-ruby)
- **기능**: Ruby, Lua 등 디버깅 지원
- **단축키**:
    - `<Leader>dt`: 중단점 토글
    - `<Leader>dc`: 디버깅 계속 실행
    - `<Leader>dx`: 디버깅 종료
    - `<Leader>do`: 다음 줄로 이동 (Step Over)

### 5. **Floaterm** - 부동 터미널

- **패키지**: `nvzone/floaterm`
- **기능**: 에디터 위에 떠있는 터미널 윈도우
- **단축키**:
    - `<C-t>`: 부동 터미널 토글

### 6. **LSP Config** - 언어 서버 설정

- **패키지**: `williamboman/mason.nvim`, `mason-lspconfig.nvim`, `neovim/nvim-lspconfig`
- **설치된 LSP**: Lua (lua_ls), TypeScript (ts_ls), Ruby (ruby_lsp)
- **기능**: 언어별 자동완성, 정의 점프, 코드 액션
- **단축키**:
    - `K`: 호버 문서 표시 (타입/설명)
    - `gd`: 정의로 이동
    - `<Leader>ca`: 코드 액션 제시

### 7. **Lualine** - 상태 줄

- **패키지**: `nvim-lualine/lualine.nvim`
- **기능**: 하단에 모드, 파일명, 줄/열 정보 표시
- **테마**: Dracula
- **단축키**: 없음 (자동 표시)

### 8. **Neo-tree** - 파일 탐색기

- **패키지**: `nvim-neo-tree/neo-tree.nvim`
- **기능**: 좌측 사이드바에서 파일/폴더 탐색
- **단축키**:
    - `<C-n>`: Neo-tree 토글

### 9. **None-ls** - 포맷팅 및 린팅

- **패키지**: `nvimtools/none-ls.nvim`
- **지원 포맷터/린터**:
    - Stylua (Lua)
    - Prettier (JavaScript, TypeScript, CSS, HTML, JSON, Markdown)
    - Black, isort (Python)
    - Rubocop (Ruby - 포맷팅 + 린팅)
- **단축키**:
    - `<Leader>gf`: 파일 포맷팅
- **설치 필요**:
    ```bash
    brew install stylua
    brew install ripgrep
    :MasonInstall rubocop
    ```

### 10. **Smartbufs** - 스마트 버퍼 관리

- **패키지**: `johann2357/nvim-smartbufs`
- **기능**: 탭라인 표시, 버퍼 간 쉬운 이동, 터미널 관리
- **단축키**:
    - `<Leader>1-9`: 버퍼 1-9로 이동
    - `<Left>`: 이전 버퍼로 이동
    - `<Right>`: 다음 버퍼로 이동
    - `<Leader>c1-4`: 터미널 버퍼 1-4로 이동
    - `<Leader>qq`: 현재 버퍼 닫기
    - `<Leader>q1-9`: 버퍼 1-9 닫기

### 11. **Telescope** - 파일/텍스트 검색

- **패키지**: `nvim-telescope/telescope.nvim` (+ telescope-ui-select)
- **기능**: 퍼지 검색으로 파일/텍스트 찾기
- **단축키**:
    - `<Leader>ff`: 프로젝트 내 파일 찾기
    - `<Leader>fg`: 파일 내용 검색 (Live Grep)

### 12. **Treesitter** - 구문 분석 (AST)

- **패키지**: `nvim-treesitter/nvim-treesitter`
- **기능**: 정확한 구문 강조, 들여쓰기, 모션
- **자동 설치**: 활성화 (auto_install)
- **명령어**:
    - `:TSUpdate`: 모든 파서 업데이트
    - `:TSInstall html css ...`: 특정 언어 파서 설치

---

## 사용 팁

1. **플러그인 업데이트**: Lazy.nvim 플러그인 매니저 사용
2. **LSP와 완성치 함께 사용**: LSP 설정 후 자동완성이 활성화됨
3. **포맷팅 전 확인**: 포맷터 설치 여부 확인 후 `<Leader>gf` 사용
4. **디버깅 시**: DAP 시작 전 중단점 설정 (`<Leader>dt`) 후 실행 (`<Leader>dc`)
