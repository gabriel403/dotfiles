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

# Install some other useful utilities like `diff`.
brew install diffutils
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri


# Install more recent versions of some macOS tools.
brew install grep

# Install other useful binaries.
brew install git

brew install --cask github
brew install --cask slack
brew install --cask sequel-ace
brew install --cask caffeine
brew install --cask istat-menus
brew install --cask spotify
brew install --cask iterm2
brew install --cask whatsapp
brew install --cask postman
brew install --cask visual-studio-code
brew install --cask zoom
brew install --cask google-chrome
brew install --cask bartender
brew install --cask insomnia
brew install --cask rectangle
brew install --cask microsoft-teams
brew install thefuck

brew install yarn
brew install nvm

brew install --cask daisydisk
brew install --cask mysqlworkbench
# brew tap aws/tap
# brew install aws-sam-cli

# Remove outdated versions from the cellar.
brew cleanup
