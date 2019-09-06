function gg
  set BASE_URL "https://google.com/search"
  set QUERY (echo $argv | sed -e "s/ /+/g")

  open (echo $BASE_URL"?q="$QUERY)
end
