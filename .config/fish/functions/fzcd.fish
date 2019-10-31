function fzcd
  if [ (count $argv) -ne 0 ];
    z -l | awk '{print $2}' | fzf -q $argv | read dir
    if [ $status -eq 0 ];
      cd $dir
    end
  else 
    z -l | awk '{print $2}' | fzf | read dir
    if [ $status -eq 0 ];
      cd $dir
    end
  end
end

