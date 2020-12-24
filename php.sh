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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Install PHP environment packages
brew install php

# Install composer globally
brew install composer

# Install Valet via composer
composer global require laravel/valet
valet install

# Park valet in Projects DIR
cd ~/Projects
valet park