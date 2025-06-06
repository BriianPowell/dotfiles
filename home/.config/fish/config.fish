source ~/.config/fish/tide.config.fish

abbr -a reload source ~/.config/fish/config.fish
abbr -a l ls -lha
abbr -a lblk lsblk --output NAME,SIZE,RM,FSTYPE,FSUSE%,SERIAL,MOUNTPOINT

set -U fish_greeting
set -Ux EDITOR vim
set -Ux PYENV_ROOT $HOME/.pyenv

test -f ~/.config/fish/functions/.kubectl_aliases.fish && source ~/.config/fish/functions/.kubectl_aliases.fish

pyenv init - | source
kubectl completion fish | source
atuin init fish | source

function cl -d "cd into directory and ls"
    cd $argv
    ls
end

function mkdir -d "Create a directory and set CWD"
    command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end

fish_add_path /usr/local/bin
fish_add_path /usr/local/sbin
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.rbenv/bin
fish_add_path $HOME/.krew/bin
fish_add_path $PYENV_ROOT/bin
