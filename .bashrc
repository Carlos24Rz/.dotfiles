#!/usr/bin/env bash

# Aliases

function v() # Neovim (default to vi)
{
  if command -v nvim > /dev/null 2>&1; then
    nvim $@
  else
    vi $@
  fi
}

TMUX_DEFAULT_SESS_NAME="dev"

function ta() # Create/Attach to Tmux session
{
  if [[ -z "$1" ]]; then
    tmux new-session -A -s "$TMUX_DEFAULT_SESS_NAME"
  else
    tmux new-session -A -s "$1"
  fi
}

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
