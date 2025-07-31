source ~/.config/fish/tide.config.fish

abbr -a reload source ~/.config/fish/config.fish
abbr -a l ls -lha
abbr -a lblk lsblk --output NAME,SIZE,RM,FSTYPE,FSUSE%,SERIAL,MOUNTPOINT

set -U fish_greeting
set -Ux EDITOR vim
set -Ux PYENV_ROOT $HOME/.pyenv

pyenv init - | source
kubectl completion fish | source
atuin init fish | source

fish_add_path /usr/local/bin
fish_add_path /usr/local/sbin
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.rbenv/bin
fish_add_path $HOME/.krew/bin
fish_add_path $PYENV_ROOT/bin
