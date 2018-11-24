#!/bin/bash

function command_exists {
  type "$1" &> /dev/null
}

function install_brew {
  if command_exists brew ; then
    echo "Brew is installed, skipping..."
  else
    echo "Installing brew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/cask
    echo "Done installing brew"
  fi
}

function install_dart {
  if command_exists dart ; then
    echo "dart is installed, skipping..."
  else
    echo "Installing dart..."
    brew tap dart-lang/dart
    brew install dart
    echo "Done installing npm"
  fi
}

function installer {
  echo "Launching installer..."
  (cd dev_setup.dart && pub get && dart bin/main.dart)
}

function install {
  install_brew
  install_dart
  installer
}

function main {
  echo "------------------------------------------------------------------------"
  echo "Installing all necessary dependencies"
  echo ""
  install
  echo ""
  echo "------------------------------------------------------------------------"
}

main
