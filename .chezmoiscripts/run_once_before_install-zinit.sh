#!/bin/bash
set -e
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [ ! -e "${ZINIT_HOME}" ]; then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
