function todo 
    set -l owner $argv[1]
    set -l num $argv[2]
    test -z "$owner" -o -z "$num"; and echo "usage: todo <org-or-user> <project-number>"; and return 1

    set -l me   (gh api user --jq .login)     ; or return 1

    set -l choice \
        (gh project item-list $num --owner $owner --format json -L 100 \
        | jq -r --arg u "$me" '
            def colorize_fg($fg; $txt):
                "\u001b[38;5;" + ($fg|tostring) + "m" +
                $txt + "\u001b[0m";

            def colorize($fg; $bg; $txt):
                "\u001b[38;5;" + ($fg|tostring) + "m" +
                "\u001b[48;5;" + ($bg|tostring) + "m" +
                $txt + "\u001b[0m";

            def paint($s):
                if   $s == "No Status"   then colorize_fg(015; $s)
                elif $s == "Todo"        then colorize(015;239; $s)
                elif $s == "In Progress" then colorize(015;027; $s)
                elif $s == "Release"     then colorize(015;126; $s)
                elif $s == "Done"        then colorize(015;054; $s)
                else $s
                end;


            [.items[]
            | select(.assignees | index($u))
            | {
                title: (.title // "(no title)"),
                status: (.status // "No Status"),
                url: (.content.url // "")
              }
            ]
            | sort_by(
                (if .status == "No Status" then 5
                 elif .status == "Todo" then 4
                 elif .status == "In Progress" then 3
                 elif .status == "Done" then 2
                 elif .status == "Release" then 1
                 else 0 end
                )
              )
            | .[]
            | [ 
                paint(.status),
                .title,
                .url
              ]
            | @tsv
        ' \
        | env CLICOLOR_FORCE=1 GH_FORCE_TTY=1 sk \
                --ansi \
                --delimiter '\t' \
                --with-nth 1..2 \
                --tabstop 12 \
                --preview 'gh issue view {3}' \
                --preview-window 'up:80%'
    )

    # Esc/Ctrl-C などで未選択の場合は終了
    test -z "$choice"; and return 0

    # 行を分解して JSON で返す
    set -l st (echo $choice | awk -F"\t" '{print $1}')
    set -l title  (echo $choice | awk -F"\t" '{print $2}')
    set -l url    (echo $choice | awk -F"\t" '{print $3}')

    jq -n --arg t "$title" --arg s "$st" --arg u "$url" \
        '{title: $t, status: $s, "url": $u}'
end

