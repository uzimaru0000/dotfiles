function fzcd
    z -l | awk '{print $2}' | fzf | read dir
	if [ $status -eq 0 ];
        cd $dir
    end
end

