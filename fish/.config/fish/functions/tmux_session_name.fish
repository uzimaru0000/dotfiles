function tmux_session_name
    set -l adjectives calm cool epic fast free gold keen lazy loud mint neat pure safe slim soft warm wild wise
    set -l animals bear bird cat deer dove duck elk fawn fish fox goat hawk hare ibis lynx mole newt owl puma seal swan toad vole wolf wren
    set -l adj $adjectives[(random 1 (count $adjectives))]
    set -l animal $animals[(random 1 (count $animals))]
    echo "$adj-$animal"
end
