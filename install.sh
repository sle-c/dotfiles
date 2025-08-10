# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy zshrc
cp ./zshrc ~/.zshrc

# copy hushlogin
cp ./hushlogin ~/.hushlogin

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install delta
brew install git-delta

# install nerd-fonts
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-fira-code-nerd-font

# install ghostty
brew install --cask ghostty

# copy ghostty config
cp ./ghostty.config $XDG_CONFIG_HOME/ghostty/config

# install neovim
brew install neovim

# copy neovim configuration
cp -r ./nvim ~/.config/nvim

# install nvm
brew install nvm

# install tmux
brew install tmux

# copy tmux configuration
cp ./tmux.conf ~/.tmux.conf

# copy git configuration
cp ./gitconfig ~/.gitconfig

# install xcode command line tools
xcode-select --install
