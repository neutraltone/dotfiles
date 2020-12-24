#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
	      --exclude ".DS_Store" \
          --exclude "bootstrap.sh" \
    	  --exclude "js.sh" \
          --exclude "ruby.sh" \
	      --exclude "README.md" \
          --exclude "LICENSE-MIT.txt" \
          -avh --no-perms . ~; \
	source ~/.bash_profile;
}

function homebrew() {
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function homebrewPackages() {
	./homebrew.sh
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
	homebrew;
	homebrewPackages;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
	read -p "Do you want to install Homebrew? (y/n) " -n 1;
	echo "Installing homebrew..."
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		homebrew;
	fi;
	read -p "Do you want to install Homebrew packages and casks? (y/n) " -n 1;
	echo "Installing homebrew packages and casks..."
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		homebrewPackages;
	fi;
	read -p "Do you want to setup Ruby with RVM? (y/n) " -n 1;
	echo "Installing Ruby with RVM..."
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		homebrewPackages;
	fi;
	read -p "Do you want to setup PHP and Valet? (y/n) " -n 1;
	echo "Installing PHP and Valet..."
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		homebrewPackages;
	fi;
fi;
