# Util alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ping='/sbin/ping'
alias md5sum='/sbin/md5'
alias vi='vim -i NONE -u NONE'
alias ls='ls -G'
alias ll='ls -l'
alias grep='grep --color=auto'
alias pgrep="ps -ef | head -1; ps -ef | grep -v grep | grep --color=auto -i"

# Alias for Mac
alias trim-empty-lines="gsed -i '/^$/{N;/^\n*$/D}'"
alias curl-json-post='curl -H "Content-Type: application/json" -X POST'
alias finder-show-hide-files='defaults write com.apple.finder AppleShowAllFiles Yes && killall Finder'
alias finder-noshow-hide-files='defaults write com.apple.finder AppleShowAllFiles No && killall Finder'
alias finder-rebuild-launch-db='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias ios-simulator='open "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"'
alias power-prevent-sleep='pmset noidle'
alias update-locate-db='sudo /usr/libexec/locate.updatedb'
alias what-is-my-ip='curl -o "-" `curl -o "-" ip138.com 2>&1 | ggrep -o "src=\"[^\"]*\"" | ggrep -o "http[^\"]*" | ggrep "ic.asp"` 2>&1 | ggrep -o "\[[0-9\.]*\]"'
alias enter-docker-vm='docker run --rm -it --pid=host --privileged debian:jessie nsenter -t 1 -m -p -n'

SCRIPT_FOLDER='Scripts'

alias dict='${HOME}/${SCRIPT_FOLDER}/dict.sh'
alias fgrep='${HOME}/${SCRIPT_FOLDER}/fgrep.sh'
alias ftree='${HOME}/${SCRIPT_FOLDER}/ftree.sh'
alias mm='${HOME}/${SCRIPT_FOLDER}/mm.sh'
alias wup='${HOME}/${SCRIPT_FOLDER}/who-use-port.sh'
alias receive-file-from='${HOME}/${SCRIPT_FOLDER}/ssh_server/receive-file-from.sh'
alias send-file-to='${HOME}/${SCRIPT_FOLDER}/ssh_server/send-file-to.sh'
alias ssh-to='${HOME}/${SCRIPT_FOLDER}/ssh_server/ssh-to.sh'
alias ssh-target='${HOME}/${SCRIPT_FOLDER}/ssh_server/ssh-target.sh'

source ${HOME}/${SCRIPT_FOLDER}/func/calc.sh
source ${HOME}/${SCRIPT_FOLDER}/func/load-user-apps.sh
flushUserAppFolders

# Bash configure
export PS1='[\t \W]\$ '
# Keep timestamp of command executed
export HISTTIMEFORMAT="[%Y-%m-%d_%H:%M:%S] "
# Enlarge history record amount
export HISTSIZE=2000
export HISTFILESIZE=1000000

function _ssh_proxy {
    for pid in $(ps aux | grep "CfNgD ${LOCAL_PORT}" | grep -v grep | awk "{print \$2}"); do
        kill -9 ${pid}
    done
    ssh -i ${PROXY_SSH_KEY} -CfNgD ${LOCAL_PORT} -p ${PROXY_PORT} ${PROXY_USER}@${PROXY_IP} 2>&1 >/dev/null
    echo "proxy up"
}
function _ssh_forward {
    for pid in $(ps aux | grep "NfR ${REMOTE_PORT}:127.0.0.1:${LOCAL_PORT}" | grep -v grep | awk "{print \$2}"); do
        kill -9 ${pid}
    done
    ssh -NfR ${REMOTE_PORT}:127.0.0.1:${LOCAL_PORT} -p ${SSH_PORT} -i ${PROXY_SSH_KEY} ${PROXY_USER}@${PROXY_IP}
    echo "forward up"
}
function vpnup {
    PROXY_PORT=22
    LOCAL_PORT=22002
    PROXY_IP=x.x.x.x
    PROXY_USER=ubuntu
    PROXY_SSH_KEY=${HOME}/.ssh/id_rsa.pub
    _ssh_proxy
}

# enter tmux environment
#if [ "${TMUX}" == "" ]; then
#    tmux attach
#    if [ ${?} -ne 0 ]; then
#        tmux
#    fi
#fi

