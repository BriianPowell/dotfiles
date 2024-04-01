source ~/.config/fish/tide.config.fish
source ~/.config/fish/kubectl_aliases.fish

abbr -a reload source ~/.config/fish/config.fish

abbr -a l ls -lha
abbr -a lblk lsblk --output NAME,SIZE,RM,FSTYPE,FSUSE%,SERIAL,MOUNTPOINT

set -U fish_greeting
set -Ux EDITOR vim

pyenv init - | source

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
