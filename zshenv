# ~/.zshenv — sourced for ALL zsh instances (interactive, scripts, etc.)
# Keep this minimal and fast. Only universal PATH/env setup belongs here.

# ── Homebrew ──────────────────────────────────────────────────────────────────
# Set brew env vars. Must be here so it works in non-interactive shells too.
# NOTE: In dev zones with shadowenv, PATH gets replaced on every prompt.
# The precmd hook in .zshrc re-adds /opt/homebrew/bin after shadowenv runs.
if [[ -x /opt/homebrew/bin/brew ]]; then
  export HOMEBREW_PREFIX="/opt/homebrew"
  export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
  export HOMEBREW_REPOSITORY="/opt/homebrew"
  export HOMEBREW_SHELLENV_PREFIX="/opt/homebrew"
  export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
  export INFOPATH="/opt/homebrew/share/info${INFOPATH+:$INFOPATH}"
  path=(/opt/homebrew/bin /opt/homebrew/sbin $path)
fi
