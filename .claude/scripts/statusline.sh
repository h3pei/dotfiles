#!/bin/bash

# Claude Code Status Line Script
# Receives JSON input via stdin with session info

# Read the JSON input from stdin
input=$(cat)

# Extract information from JSON
CURRENT_DIR=$(echo "$input" | jq -r '.workspace.current_dir')
BASENAME_DIR=$(basename "$CURRENT_DIR")
CCUSAGE=$(echo "$input" | bunx ccusage@latest statusline)

GIT_BRANCH=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git branch --show-current 2>/dev/null)
    if [ -n "$BRANCH" ]; then
        GIT_BRANCH="[$BRANCH]"
    fi
fi

echo "$BASENAME_DIR $GIT_BRANCH $CCUSAGE"
