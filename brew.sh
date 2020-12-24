#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install ZSH.
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install gpg
brew install gs
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Core casks
brew install --cask --appdir="/Applications" 1password
brew install --cask --appdir="/Applications" alfred
brew install --cask --appdir="/Applications" cleanmymac
brew install --cask --appdir="/Applications" divvy
brew install --cask --appdir="/Applications" the-unarchiver

# Dev casks
brew install --cask --appdir="/Applications" dbngin
brew install --cask --appdir="/Applications" iterm2
brew install --cask --appdir="/Applications" paw
brew install --cask --appdir="/Applications" sourcetree
brew install --cask --appdir="/Applications" tableplus
brew install --cask --appdir="/Applications" tinkerwell
brew install --cask --appdir="/Applications" visual-studio-code

# Design casks
# brew install --cask --appdir="/Applications" affinity-designer // missing
# brew install --cask --appdir="/Applications" affinity-photo // missing
# brew install --cask --appdir="/Applications" affinity-publisher // missing
brew install --cask --appdir="/Applications" imagealpha
brew install --cask --appdir="/Applications" imageoptim
brew install --cask --appdir="/Applications" sketch
brew install --cask --appdir="/Applications" zeplin

# Communication casks
brew install --cask --appdir="/Applications" discord
brew install --cask --appdir="/Applications" notion
brew install --cask --appdir="/Applications" slack
brew install --cask --appdir="/Applications" telegram
brew install --cask --appdir="/Applications" tuple
brew install --cask --appdir="/Applications" tweetbot
brew install --cask --appdir="/Applications" zoom

# Misc casks
brew install --cask --appdir="/Applications" binance
brew install --cask --appdir="/Applications" firefox
brew install --cask --appdir="/Applications" grandperspective
brew install --cask --appdir="/Applications" lastfm
brew install --cask --appdir="/Applications" ledger-live
brew install --cask --appdir="/Applications" little-snitch
brew install --cask --appdir="/Applications" micro-snitch
brew install --cask --appdir="/Applications" omnifocus
brew install --cask --appdir="/Applications" spotify
brew install --cask --appdir="/Applications" synergy
# brew install --cask --appdir="/Applications" sonos // missing
brew install --cask --appdir="/Applications" transmission
brew install --cask --appdir="/Applications" twitch
brew install --cask --appdir="/Applications" vlc

# Remove outdated versions from the cellar.
brew cleanup