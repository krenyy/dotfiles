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

    set -x NMAP_PRIVILEGED

    gpgconf --launch gpg-agent

    if command -v pazi &>/dev/null
        eval "$(pazi init fish)"
    end
end
