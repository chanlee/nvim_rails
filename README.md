# Neovim 설정 (nvim_rails)

Ruby/Rails 작업을 중심으로 LSP, Copilot, 디버깅, Git, 검색 등을 갖춘 개인용 Neovim 설정입니다. 이 문서는 **처음 받아오는 사람도 그대로 따라 하면 동작하는 상태**가 되도록 단계별로 안내합니다.

> 키맵·플러그인별 상세 사용법은 [USAGE.md](./USAGE.md)를 참고하세요.

---

## 1. 사전 준비물

설치는 macOS 기준으로 작성되었습니다. Linux도 패키지 매니저만 바꾸면 동일하게 동작합니다.

### 1) Neovim 0.10 이상

```bash
# macOS (Homebrew)
brew install neovim

# Ubuntu/Debian
sudo apt install neovim
```

설치 후 버전 확인:

```bash
nvim --version | head -n 1   # NVIM v0.10.x 이상이면 OK
```

### 2) 필수 도구

| 도구 | 용도 | 설치 명령 |
|------|------|-----------|
| **git** | 설정 클론, fugitive(Git 통합) | `brew install git` |
| **ripgrep** | Telescope 내용 검색(`<leader>fg`) | `brew install ripgrep` |
| **fd** | Telescope 파일 검색 가속(선택) | `brew install fd` |
| **node.js ≥ 18** | Copilot, Markdown Preview | `brew install node` |
| **Nerd Font** | 파일/탭 아이콘 정상 표시 | 아래 참고 |

#### Nerd Font 설치 & 적용

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

설치 후 **사용 중인 터미널(iTerm2/Terminal/Alacritty 등)에서 폰트를 Nerd Font로 변경**해야 아이콘이 정상 표시됩니다.

### 3) 언어별 런타임 (사용하는 언어만)

- Ruby 작업용: `ruby`, `bundle`, `solargraph`, `rubocop`
  ```bash
  gem install solargraph rubocop
  ```
- Python 작업용: `python3`, `pip`
- Lua 포매터: `brew install stylua`

> 포매터·LSP 서버 대부분은 첫 실행 시 **Mason**이 자동으로 설치합니다. 위 목록은 시스템 단에서 미리 있어야 편리한 것들입니다.

---

## 2. 기존 설정 백업

이미 `~/.config/nvim`을 쓰고 있다면 충돌을 피하기 위해 백업해 둡니다.

```bash
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d)
mv ~/.local/share/nvim ~/.local/share/nvim.backup.$(date +%Y%m%d) 2>/dev/null || true
mv ~/.local/state/nvim ~/.local/state/nvim.backup.$(date +%Y%m%d) 2>/dev/null || true
mv ~/.cache/nvim ~/.cache/nvim.backup.$(date +%Y%m%d) 2>/dev/null || true
```

처음 설치라면 위 단계는 건너뛰어도 됩니다.

---

## 3. 저장소 클론

```bash
git clone git@github.com:chanlee/nvim_rails.git ~/.config/nvim
```

SSH 키가 없다면 HTTPS로:

```bash
git clone https://github.com/chanlee/nvim_rails.git ~/.config/nvim
```

---

## 4. 첫 실행 — 플러그인 자동 설치

```bash
nvim
```

처음 실행하면 다음이 **자동으로** 진행됩니다.

1. `lazy.nvim` 플러그인 매니저가 자기 자신을 클론
2. `lua/plugins/` 안의 모든 플러그인을 다운로드
3. Mason이 LSP 서버를 백그라운드로 설치

설치 진행 상황은 자동으로 뜨는 Lazy 창에서 확인할 수 있고, 끝나면 `q`로 닫습니다. 도중에 에러처럼 보이는 메시지가 떠도 대부분 다음 단계에서 해결되니 일단 끝까지 기다리세요.

설치가 끝난 뒤 한 번 종료했다가 다시 실행하면 상태가 깔끔합니다.

```vim
:q
```

---

## 5. 사후 점검

다시 `nvim`을 띄운 뒤 아래 명령으로 상태를 확인합니다.

### 1) 시스템 의존성 확인

```vim
:checkhealth
```

- 빨간색 ERROR만 해결하면 됩니다. `node`, `ripgrep`, `git` 누락이 가장 흔합니다.

### 2) 플러그인 상태

```vim
:Lazy
```

- 모두 `loaded` 또는 `installed` 상태여야 합니다. 실패한 항목은 `U`(update) 또는 `S`(sync)로 재시도.

### 3) LSP 서버 설치 상태

```vim
:Mason
```

- 기본 활성화 서버: `lua_ls`, `biome`, `pylsp`, `solargraph`
- 누락된 서버가 있다면 해당 줄에서 `i`를 눌러 설치.

### 4) Treesitter 파서

```vim
:TSUpdate
```

- `lua`, `python`, `javascript`, `html`, `markdown`, `ruby` 파서가 자동 설치/업데이트됩니다.

---

## 6. GitHub Copilot 인증

Copilot 인라인 제안을 쓰려면 한 번 인증이 필요합니다.

```vim
:Copilot auth
```

- 화면에 표시되는 디바이스 코드를 복사 → 안내된 URL에서 붙여넣기 → GitHub 계정으로 승인.
- 인증 상태 확인: `:Copilot status`

> 이 설정에서는 Copilot 자동 트리거가 꺼져 있습니다. 인라인 제안은 **`<C-]>`** 로 직접 요청합니다(자세한 키맵은 USAGE.md 참고).

---

## 7. 사용 시작

자주 쓰이는 키맵 몇 가지만 먼저 외우면 됩니다.

| 키 | 동작 |
|----|------|
| `Space` | 리더 키 |
| `<C-n>` | 파일 탐색기 토글 |
| `<leader>ff` | 파일 찾기 |
| `<leader>fg` | 내용 검색 |
| `gd` / `K` | 정의로 이동 / 호버 |
| `<leader>ca` | 코드 액션 |
| `<leader>mp` | 수동 포매팅 |
| `<C-t>` | 플로팅 터미널 |
| `<C-]>` | Copilot 제안 요청 |

**전체 키맵 및 플러그인별 사용법은 [USAGE.md](./USAGE.md)에 정리되어 있습니다.**

---

## 8. 자주 겪는 문제

### "아이콘이 □ 또는 ?로 보입니다"
터미널 폰트가 Nerd Font가 아닙니다. 1번 단계의 Nerd Font 설치 후 터미널에서 폰트를 바꾸세요.

### "`<leader>fg`에서 ripgrep is not installed 에러"
```bash
brew install ripgrep
```

### "Copilot이 동작하지 않습니다"
- `:Copilot status`로 인증 상태 확인
- `node --version`이 18 이상인지 확인
- 인증 미완료라면 `:Copilot auth` 재실행

### "LSP가 동작하지 않습니다 (호버 안 됨, gd 안 됨)"
1. `:LspInfo` — 현재 버퍼에 연결된 서버 확인
2. `:Mason` — 해당 언어 서버가 설치돼 있는지 확인
3. 프로젝트 루트(`.git` 또는 `Gemfile`)에서 실행 중인지 확인

### "포매팅이 동작하지 않습니다"
- 해당 포매터가 시스템 또는 Mason에 설치되어 있는지 확인
  - Lua: `brew install stylua`
  - Ruby: `gem install rubocop`
  - Python: `pip install black isort`
- `:ConformInfo`로 현재 파일에 적용될 포매터를 확인할 수 있습니다.

### "플러그인 한 개가 안 깔립니다"
```vim
:Lazy sync
```
그래도 안 되면 해당 플러그인 줄에서 `x`(clean) 후 다시 `i`(install).

---

## 9. 업데이트 / 유지보수

```vim
:Lazy update    " 플러그인 업데이트
:Lazy clean     " 미사용 플러그인 제거
:TSUpdate       " Treesitter 파서 업데이트
:MasonUpdate    " Mason 패키지 업데이트
```

설정 파일을 수정한 뒤에는 `:source %` 또는 Neovim 재시작으로 반영하세요.

---

## 10. 디렉토리 구조

```
~/.config/nvim/
├── init.lua              # 진입점 (lazy.nvim 부트스트랩)
├── lua/
│   ├── vim-options.lua   # 에디터 기본 옵션 (리더키, 인덴트 등)
│   ├── plugins.lua       # lazy 플러그인 로더
│   ├── plugins/          # 플러그인별 설정 파일
│   └── utils/            # 공용 헬퍼 (keyMapper 등)
├── USAGE.md              # 키맵 및 사용법 상세
└── README.md             # 이 문서
```

---

## 참고

- 플러그인 매니저: [lazy.nvim](https://github.com/folke/lazy.nvim)
- LSP 매니저: [mason.nvim](https://github.com/williamboman/mason.nvim)
- 이슈/제안은 저장소에 등록해 주세요.
