# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '|'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

function __current_time
    set -l date (date +"%H:%M")
    printf "[%s] " $date
end

function __current_path
    set -l path (pwd | sed -e "s/\/Users\/oba/\~/")

    set_color brcyan
    printf "[ %s ]" $path
    set_color normal
end

function __git_status
    set -l git_dir (git rev-parse --git-dir 2> /dev/null)

    if test -n "$git_dir"
        set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
        set -l git_status (git status -s)
        set -l isAdding (git status -s | grep -e " M")
        set -l normalPrompt "<%s> "
        set -l notAddPrompt "<%s +> "

        if test -n "$git_status"
            set_color red
            printf $notAddPrompt $branch
            set_color normal
        else
            set_color green
            printf $normalPrompt $branch
            set_color normal
        end
    end

end

function __vi_mode
    if test $fish_key_bindings = "fish_vi_key_bindings"
        switch $fish_bind_mode
            case insert
                set_color green
                set mode "insert"
            case default
                set_color red
                set mode "normal"
            case visual
                set_color purple
                set mode "visual"
        end
        printf " [%s] " $mode
        set_color normal
    end    
end

function fish_prompt
	if [ $status -eq 0 ];
    set status_line (set_color green)"٩(ˊᗜ ˋ*)و "(set_color normal)
  else
    set status_line (set_color red)"ヾ(｡`Д´｡)ﾉ "(set_color normal)
  end

  __current_time
  __current_path
  # __git_status
  __fish_git_prompt
  __vi_mode
  echo -e ''
  echo $status_line
end
