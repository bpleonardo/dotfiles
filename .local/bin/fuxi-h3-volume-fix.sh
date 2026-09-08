#!/bin/bash

set -euo pipefail

CARD=$(
    /usr/bin/aplay -l 2>/dev/null |
    grep -i 'FuxiH3\|Fuxi-H3' |
    head -n1 |
    grep -o 'card [0-9]*' |
    grep -o '[0-9]*'
)

[ -n "$CARD" ] || exit 0

/usr/bin/amixer -c "$CARD" sset 'PCM',0 100%,100% >/dev/null
