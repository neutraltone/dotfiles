#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
	      --exclude ".DS_Store" \
          --exclude "bootstrap.sh" \
          --exclude "init" \
    	  --exclude "js.sh" \
          --exclude "ruby.sh" \
          --exclude "php.sh" \
	      --exclude "README.md" \
          --exclude "LICENSE-MIT.txt" \
          -avh --no-perms . ~; \
	source ~/.bash_profile;
}

function homebrew() {
	arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

function homebrewPackages() {
	bash ./brew.sh
}

function ruby() {
	bash ./ruby.sh
}

function php() {
	bash ./php.sh
}

function js() {
	bash ./js.sh
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
	homebrew;
	homebrewPackages;
	ruby;
	php;
	js;
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
		ruby;
	fi;
	read -p "Do you want to setup PHP and Valet? (y/n) " -n 1;
	echo "Installing PHP and Valet..."
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		php;
	fi;
	read -p "Do you want to setup Node with Nodenv? (y/n) " -n 1;
	echo "Installing Node with Nodenv..."
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		js;
	fi;
fi;
