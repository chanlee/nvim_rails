# Neovim 설정 가이드

## 기본 사용법

### 최초 설치 (macOS)

1. **Homebrew 설치** (이미 설치되어 있다면 생략)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. **Neovim 설치**

```bash
brew install neovim
```

3. **필수 도구 설치**

```bash
brew install stylua      # Lua 포매터
brew install ripgrep     # 빠른 텍스트 검색
```

4. **설정 디렉토리 생성 및 복사**

```bash
mkdir -p ~/.config/nvim
# 이 저장소의 파일들을 ~/.config/nvim/ 디렉토리에 복사
```

5. **Neovim 실행 및 플러그인 설치**

```bash
nvim
# Neovim 실행 후 자동으로 플러그인이 설치됩니다
```

### 설정 업데이트

-   `:source %` - 현재 파일 리로드

---

## 플러그인 목록 및 사용법

### 🎨 UI & 테마

#### Alpha (대시보드)

-   **설치**: 자동 설치됨
-   **기능**: Neovim 시작 화면
-   **사용법**: Neovim 시작 시 자동으로 표시

#### Catppuccin (테마)

-   **설치**: 자동 설치됨
-   **기능**: 아름다운 컬러 테마
-   **사용법**: 자동으로 적용됨

#### Lualine (상태바)

-   **설치**: 자동 설치됨
-   **기능**: 하단 상태바 표시
-   **사용법**: 자동으로 표시됨

### 📁 파일 탐색

#### Neo-tree (파일 탐색기)

-   **설치**: 자동 설치됨
-   **기능**: 사이드바 파일 탐색기
-   **단축키**:
    -   `<C-n>` - 파일 탐색기 토글

#### Telescope (파일 검색)

-   **설치**: 자동 설치됨
-   **기능**: 파일 및 내용 검색
-   **단축키**:
    -   `<leader>ff` - 파일 이름으로 찾기
    -   `<leader>fg` - 파일 내용으로 찾기

### 🔧 개발 도구

#### LSP (Language Server Protocol)

-   **설치**: Mason을 통해 자동 설치
-   **지원 언어**: Lua, JavaScript/TypeScript, Python, Ruby
-   **단축키**:
    -   `K` - 문서 보기
    -   `<leader>gd` - 정의로 이동
    -   `<leader>ca` - 코드 액션

#### Mason (LSP 관리자)

-   **설치**: 자동 설치됨
-   **기능**: LSP 서버 자동 설치 및 관리
-   **사용법**: `:Mason` 명령어로 관리

#### Treesitter (구문 분석)

-   **설치**: 자동 설치됨
-   **지원 언어**: lua, python, javascript, html, markdown, ruby
-   **명령어**:
    -   `:TSUpdate` - Treesitter 업데이트
    -   `:TSInstall <언어명>` - 새 언어 설치

#### nvim-cmp (자동완성)

-   **설치**: 자동 설치됨
-   **기능**: LSP 기반 자동완성
-   **단축키**:
    -   `<C-Space>` - 자동완성 트리거
    -   `<C-n>` - 다음 항목
    -   `<C-p>` - 이전 항목
    -   `<CR>` - 선택 확인
    -   `<C-d>` - 스니펫 확장/이동
    -   `<C-u>` - 스니펫 이전으로 이동

### 🤖 AI 도구

#### Copilot (AI 코드 제안)

-   **설치**: 자동 설치됨
-   **기능**: AI 기반 코드 제안
-   **단축키**:
    -   `<C-l>` - 전체 제안 수락
    -   `<C-w>` - 단어 단위 수락
    -   `<C-j>` - 라인 단위 수락
    -   `<C-]>` - 다음 제안
    -   `<C-\>` - 이전 제안
    -   `<C-q>` - 제안 취소
    -   `<C-CR>` - 패널 열기

#### CopilotChat (AI 채팅)

-   **설치**: 자동 설치됨
-   **기능**: AI와 코드 관련 대화
-   **단축키**:
    -   `<leader>cc` - 채팅 창 열기/닫기
    -   `<leader>ce` - 코드 설명
    -   `<leader>cr` - 코드 리뷰
    -   `<leader>cf` - 코드 수정
    -   `<leader>co` - 코드 최적화
    -   `<leader>cd` - 문서 생성
    -   `<leader>ct` - 테스트 생성
    -   `<leader>cF` - 진단 오류 수정
    -   `<leader>cC` - 커밋 메시지 생성

### 🛠️ 코드 품질

#### Conform (포매터)

-   **설치**: 자동 설치됨
-   **지원 언어**: Lua, Python, JavaScript/TypeScript, Ruby
-   **기능**: 자동 포매팅 (저장 시)
-   **단축키**:
    -   `<leader>mp` - 수동 포매팅

#### None-ls (Linting & Formatting)

-   **설치**: 자동 설치됨
-   **기능**: 다양한 언어의 린팅 및 포매팅
-   **단축키**:
    -   `<leader>gf` - 포매팅

### 🐛 디버깅

#### nvim-dap (디버거)

-   **설치**: 자동 설치됨
-   **지원 언어**: Ruby (기본 설정)
-   **단축키**:
    -   `<leader>dt` - 브레이크포인트 토글
    -   `<leader>dc` - 디버깅 계속
    -   `<leader>dx` - 디버깅 종료
    -   `<leader>do` - 다음 라인으로 스텝

### 📝 Git 관리

#### Fugitive (Git 통합)

-   **설치**: 자동 설치됨
-   **기능**: Git 명령어 통합
-   **단축키**:
    -   `<leader>gs` - Git 상태
    -   `<leader>gb` - Git blame
    -   `<leader>gc` - Git commit
    -   `<leader>gd` - Git diff
    -   `<leader>gp` - Git push
    -   `<leader>gl` - Git pull
    -   `<leader>ga` - 현재 파일 추가
    -   `<leader>gA` - 모든 파일 추가

### 🖥️ 터미널

#### Floaterm (플로팅 터미널)

-   **설치**: 자동 설치됨
-   **기능**: 플로팅 터미널
-   **단축키**:
    -   `<C-t>` - 터미널 토글

### 📋 버퍼 관리

#### Smartbufs (스마트 버퍼)

-   **설치**: 자동 설치됨
-   **기능**: 향상된 버퍼 관리
-   **단축키**:
    -   `<leader>1-9` - 버퍼 1-9로 이동
    -   `<Right>` - 다음 버퍼
    -   `<Left>` - 이전 버퍼
    -   `<leader>c1-4` - 터미널 1-4로 이동
    -   `<leader>qq` - 현재 버퍼 닫기
    -   `<leader>q1-9` - 버퍼 1-9 닫기

### 💾 세션 관리

#### Auto-session (자동 세션)

-   **설치**: 자동 설치됨
-   **기능**: 자동 세션 저장/복원
-   **단축키**:
    -   `<leader>ls` - 세션 검색 및 로드

---

## 필수 도구 설치

### Homebrew 패키지

```bash
brew install stylua      # Lua 포매터
brew install ripgrep     # 빠른 텍스트 검색
```

### Mason을 통한 도구 설치

```bash
:MasonInstall rubocop    # Ruby 린터/포매터
```

### None-ls 모듈 설치

-   stylua (Lua 포매터)
-   prettier (JavaScript/TypeScript 포매터)
-   black (Python 포매터)
-   isort (Python import 정렬)
-   rubocop (Ruby 린터/포매터)

---

## 추가 팁

1. **플러그인 업데이트**: `:Lazy update`
2. **플러그인 동기화**: `:Lazy sync`
3. **플러그인 상태 확인**: `:Lazy`
4. **설정 리로드**: `:source %`

---

## 업데이트 (2025-09-04)

-   Ruby Project 에서 코드 포매팅을 위해 프로젝트 루트에 .rubocop.yml 파일을 생성하고 설정을 추가해야 합니다.

```yml
# .rubocop.yml
AllCops:
    NewCops: enable
    TargetRubyVersion: 3.0

Layout/IndentationWidth:
    Width: 2

Layout/IndentationConsistency:
    EnforcedStyle: normal
```
