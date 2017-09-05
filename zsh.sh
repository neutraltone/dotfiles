# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install ZSH and oh-my-zsh
brew install zsh
brew install zsh-completions
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install dracular Theme
git clone https://github.com/dracula/zsh.git ~/.oh-my-zsh/themes/dracula
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="dracular\/dracular"/g' ~/.zshrc

# Install and enable nerd-fonts
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

# Install syntax highlighting support for zsh
brew install zsh-syntax-highlighting
echo '\n# Enable syntax highlighting\nsource /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc

# Install Dracular theme
git clone https://github.com/dracula/zsh.git


# Remove outdated versions from the cellar.
brew cleanup
