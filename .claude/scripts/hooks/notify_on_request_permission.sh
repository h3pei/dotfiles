#!/bin/bash

if [ "$DISABLE_CLAUDE_NOTIFICATION" = "1" ]; then
    exit 0
fi

osascript -e 'display notification "Permission requests from Claude Code" with title "Claude Code" sound name "Glass"'
