function fast-mirrors
    command sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu $argv
end
