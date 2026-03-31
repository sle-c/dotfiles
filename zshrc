# ── PATH ──────────────────────────────────────────────────────────────────────
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# ── oh-my-zsh ─────────────────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ── Editor ────────────────────────────────────────────────────────────────────
export EDITOR='nvim'

# ── Homebrew ──────────────────────────────────────────────────────────────────
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# ── Ruby (chruby) ─────────────────────────────────────────────────────────────
[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }

# ── Shopify cloudplatform ─────────────────────────────────────────────────────
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}$HOME/.kube/config:$HOME/.kube/config.shopify.cloudplatform
for file in $HOME/src/github.com/Shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done
kubectl-short-aliases

# ── Node (NVM) ────────────────────────────────────────────────────────────────
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# ── Node (pnpm) ───────────────────────────────────────────────────────────────
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ── Node (bun) ────────────────────────────────────────────────────────────────
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# ── Go ────────────────────────────────────────────────────────────────────────
export GOPATH=~/dev

# ── Android NDK ───────────────────────────────────────────────────────────────
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/27.0.12077973"
export CARGO_TARGET_X86_64_LINUX_ANDROID_RUSTFLAGS="-L ${ANDROID_HOME}/ndk/27.0.12077973/toolchains/llvm/prebuilt/darwin-x86_64/lib/clang/18/lib/linux"
export CARGO_TARGET_I686_LINUX_ANDROID_RUSTFLAGS="-L ${ANDROID_HOME}/ndk/27.0.12077973/toolchains/llvm/prebuilt/darwin-x86_64/lib/clang/18/lib/linux"

# ── Shopify dev ───────────────────────────────────────────────────────────────
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh


# ── Aliases & Functions ───────────────────────────────────────────────────────
[ -f "$HOME/.zsh_functions" ] && source "$HOME/.zsh_functions"
[ -f "$HOME/.zsh_aliases" ]   && source "$HOME/.zsh_aliases"


# Added by tec agent
[[ -x /Users/sile/.local/state/tec/profiles/base/current/global/init ]] && eval "$(/Users/sile/.local/state/tec/profiles/base/current/global/init zsh)"
