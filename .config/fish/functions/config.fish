function config -w git
   command git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $argv
end
