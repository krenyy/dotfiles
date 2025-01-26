if status is-interactive
    alias cp="cp -i"
    alias df="df -h"
    alias ip='ip -c'
    alias ls='exa -alH --group-directories-first'
    alias mv='mv -i'
    alias rm='rm -I'
    alias vim='nvim'
    alias rs='rsync -ahP --info=progress2'
    alias yes='no'

    alias tb='ncat termbin.com 9999'

    function nth
        sed "$argv[1]""q;d"
    end

    function urldec
        python -c "import sys, urllib.parse as ul; [sys.stdout.write(ul.unquote_plus(l)) for l in sys.stdin]"
    end

    function urlenc
        python -c "import sys, urllib.parse as ul; [sys.stdout.write(ul.quote_plus(l)) for l in sys.stdin]"
    end

    set -x NMAP_PRIVILEGED

    if command -v pazi &>/dev/null
        eval "$(pazi init fish)"
    end
end
