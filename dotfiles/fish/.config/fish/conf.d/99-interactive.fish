if status is-interactive
    alias cp="cp -i"
    alias df="df -h"
    alias ip='ip -c'
    alias ls='exa -alH --group-directories-first'
    alias mv='mv -i'
    alias rm='rm -I'
    alias e='emacsclient -c -nw --alternate-editor hx'

    if command -v pazi &>/dev/null
        eval "$(pazi init fish)"
    end
end
