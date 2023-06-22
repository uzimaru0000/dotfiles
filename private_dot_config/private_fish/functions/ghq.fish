function __ghq_cd_repository -d "Change local repository directory"
    commandline | read -l buffer
    ghq list --full-path | sed -e "s|$HOME/||g" | sk -q "$buffer" | read -l repo_path
    if test -n "$repo_path"
        commandline "cd ~/$repo_path"
        commandline -f execute
    end
    commandline -f repaint
end

