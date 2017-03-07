#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Install PHP environment packages
brew install homebrew/php/php71
brew install mysql

# Start mysql server
brew services start mysql

# Install composer globally
php composer-setup.php --install-dir=bin --filename=composer
mv composer.phar /usr/local/bin/composer

# Install Valet via composer
composer global require laravel/valet
valet install

# Initiate Valet
mkdir ~/valet
cd ~/valet
valet park
