# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# link zshrc
ln -s ./zshrc ~/.zshrc

# link hushlogin
ln -s ./hushlogin ~/.hushlogin

source ~/.zshrc

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install delta
brew install git-delta

# install nerd-fonts
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-fira-code-nerd-font

# install ghostty
brew install --cask ghostty

# link ghostty config
ln -s ./ghostty.config $XDG_CONFIG_HOME/ghostty/config

# install neovim
brew install neovim

# install nvm
brew install nvm

# install tmux
brew install tmux

# install lazyvim
git clone https://github.com/LazyVim/starter $XDG_CONFIG_HOME/nvim
rm -rf $XDG_CONFIG_HOME/nvim/.git

# link tmux configuration
ln -s ./tmux.conf ~/.tmux.conf

# link git configuration
ln -s ./gitconfig ~/.gitconfig

# install xcode command line tools
xcode-select --install
