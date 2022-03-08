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
abbr -a l ls -lha
abbr -a lblk lsblk --output NAME,SIZE,RM,FSTYPE,FSUSE%,SERIAL,MOUNTPOINT
abbr -a reload source ~/.config/fish/config.fish

fish_add_path /usr/local/bin
fish_add_path $HOME/.local/bin

set -Ux EDITOR vim
