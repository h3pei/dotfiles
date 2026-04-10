#!/bin/bash
# macOS system settings configuration
# This script runs via chezmoi when its contents change.
# Some settings require logout or restart to take effect.
set -e

echo "Configuring macOS system settings..."

# --- Keyboard ---
# Key repeat rate (lower = faster, 1 is fastest)
defaults write NSGlobalDomain KeyRepeat -int 1
# Delay until key repeat (lower = shorter, 10 is minimum via UI)
defaults write NSGlobalDomain InitialKeyRepeat -int 11

# --- Trackpad ---
# Tracking speed (0.0 ~ 3.0, default is 1.0)
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3

# --- Dock ---
# Position: left
defaults write com.apple.dock orientation -string left
# Auto-hide
defaults write com.apple.dock autohide -bool true

# --- Screenshot ---
# Save location
defaults write com.apple.screencapture location -string "$HOME/screenshots"

# --- Finder ---
# Show path bar at bottom
defaults write com.apple.finder ShowPathbar -bool true
# Always show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Default view style: list view (Nlsv=list, icnv=icon, clmv=column, glyv=gallery)
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv

# --- Sound ---
# Play feedback when volume is changed
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool true

# --- Menu Bar Clock ---
# Show seconds
defaults write com.apple.menuextra.clock ShowSeconds -bool true

# --- Apply changes ---
killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
killall SystemUIServer 2>/dev/null || true

echo "macOS settings configured. Some changes may require logout to take effect."
