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

function semCommits() {
	git clone https://github.com/fteem/git-semantic-commits ~/.git-semantic-commits;
	cd ~/.git-semantic-commits && ./install.sh;
	cd .. && rm -rf ~/.git-semantic-commits;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
	semCommits;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
		semCommits;
	fi;
fi;
