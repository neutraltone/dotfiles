#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Projects Directory
# Create if we don't have it
if [ ! -d "/path/to/dir" ]; then
	echo "Creating Projects directory..."
  	mkdir ~/Projects
fi

# Check for Homebrew
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Install PHP environment packages
brew install tmux

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
