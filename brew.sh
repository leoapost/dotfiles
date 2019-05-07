#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
fi;
chsh -s /usr/local/bin/bash;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

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
brew install hub
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
brew install xz

# Install other useful binaries.
brew install ack
brew install aria2
brew install ccat
brew install dark-mode
brew install git
brew install git-lfs
brew install httpie
brew install imagemagick --with-webp
brew install lynx
brew install noti
brew install nvm
brew install p7zip
brew install peco
brew install pigz
brew install pv
brew install rename
brew install siege
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install the_silver_searcher
brew install tree
brew install vbindiff
brew install watch
brew install webkit2png
brew install wrk
brew install yajl
brew install zopfli

# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install Cask packages
brew cask install cyberduck
brew cask install dash
brew cask install docker
brew cask install dropbox
brew cask install evernote
brew cask install firefox
brew cask install flux
brew cask install gitify
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install google-drive
brew cask install iterm2
brew cask install karabiner-elements
brew cask install keybase
brew cask install meld
brew cask install ngrok
brew cask install pgadmin4
brew cask install postman
brew cask install rdiff-backup
brew cask install skype
brew cask install skype
brew cask install slack
brew cask install spotify
brew cask install sublime-text3
brew cask install telegram
brew cask install transmission
brew cask install transmit
brew cask install vagrant
brew cask install virtualbox
brew cask install wireshark

brew tap homebrew/services

# Install Quick Look plugins
brew cask install  qlcolorcode
brew cask install  qlstephen
brew cask install  qlmarkdown
brew cask install  quicklook-json
brew cask install  qlprettypatch
brew cask install  quicklook-csv
brew cask install  betterzipql
brew cask install  qlimagesize
brew cask install  webpquicklook
brew cask install  suspicious-package

# Remove outdated versions from the cellar.
brew cleanup
