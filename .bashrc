alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias em='emacs -nw'
alias py='python'
alias py3='python3'
alias vi='vim -i NONE -u NONE'
alias em='emacs -nw'
alias ls='ls -G'
alias ll='ls -l'
alias pp='ps -ef | head -1; ps -ef | grep -v grep | grep'
alias grep='grep --color=auto'
alias ngrep='grep -n -H'
alias pgrep="ps -ef | head -1; ps -ef | grep -v grep | grep --color=auto -i"
alias w3m='w3m -M'
alias minicom='minicom -c on'

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

# Boost support
export BOOST_ROOT="/home/admin/app/boost_1_55_0"
export Boost_LIBRARY_DIR="${BOOST_ROOT}/lib"
export Boost_INCLUDE_DIR="${BOOST_ROOT}/include"

# Muduo support
export MUDUO_ROOT="/home/admin/app/muduo-0.9.6"
export MUDUO_BASH_LIB="${MUDUO_ROOT}/lib/libmuduo_base.a"
export MUDUO_NET_LIB="${MUDUO_ROOT}/lib/libmuduo_net.a"
export MUDUO_HTTP_LIB="${MUDUO_ROOT}/lib/libmuduo_http.a"

# Bash configure
export PS1='[\t \W]\$ '
# Keep timestamp of command executed
export HISTTIMEFORMAT="[%Y-%m-%d_%H:%M:%S] "
# Enlarge history record amount
export HISTSIZE=2000
export HISTFILESIZE=1000000

# enter tmux environment
#if [ "${TMUX}" == "" ]; then
#    tmux attach
#    if [ ${?} -ne 0 ]; then
#        tmux
#    fi
#fi

