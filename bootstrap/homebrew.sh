#!/bin/sh -v

if [[ ! -x `which brew` ]]; then
  echo "Homebrew is not found, try to install"
  /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
fi

echo "First, install Git"
brew install git

brew update

echo "Essential libraries (openssl,readline)"
brew install openssl readline

echo "Heavy duty tools"
brew install tig tmux zsh
brew install reattach-to-user-namespace

echo "Install MacVim"
brew install macvim

echo "rbenv and ruby-build"
brew install rbenv ruby-build

echo "Databases"
brew install mongodb mysql postgresql redis

echo "Install Node.js"
brew install node

echo "Web tools"
brew install curl w3m
brew install wget --enable-iri

echo "encfs"
brew install encfs

echo "Other tools"
brew install keychain proctools ssh-copy-id coreutils

echo "Other language runtimes"
brew install \
  clojure clojure-contrib dmd erlang gauche \
  haskell-platform haxe io lua objective-caml scala