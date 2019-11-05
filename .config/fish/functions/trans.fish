function trans
  set BASE_URL 'https://script.google.com/macros/s/AKfycby3tRdFDIYgz3xQ0Vl7ixZrvXxdNKSAiUmc04g1g8IS84llWaQ/exec'
  
  argparse -n trans 't/target=' 's/source=' -- $argv
  or return 1

  set -lq _flag_target
  or set -l _flag_target 'en'

  set -lq _flag_source
  or set -l _flag_source 'ja'

  http -F $BASE_URL"?tl="$_flag_target"&sl="$_flag_source"&text="$argv | jq -r ".text"
end
