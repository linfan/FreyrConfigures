alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias em='emacs -nw'
alias py='python'
alias py3='python3'
alias vi='vim -i NONE -u NONE'
alias em='emacs -nw'
alias ls='ls --color=auto'
alias ll='ls -l'
alias pp='ps -ef | head -1; ps -ef | grep -v grep | grep'
alias grep='grep --color=auto'
alias ngrep='grep -n -H'
alias fgrep='${HOME}/Script/fgrep.sh'
alias pgrep="ps -ef | head -1; ps -ef | grep -v grep | grep --color=auto -i"
alias ftree='${HOME}/Script/ftree.sh'
alias mm='${HOME}/Script/mm.sh'
alias w3m='w3m -M'
alias minicom='minicom -c on'
alias wup='${HOME}/Script/who-use-port.sh'

# Case conversion
alias capitalize-all="sed 's/\b[a-z]/\U&/g'"
alias lowercase-all="sed 's/[A-Z]/\L&/g'"
alias uppercase-all="sed 's/[a-z]/\U&/g'"

# Conversion of number system
function bin-to-dec()
{
    ((decNum=2#${1})); echo ${decNum} 
}
function bin-to-hex()
{
    dec-to-hex `bin-to-dec ${1}` 
}
function dec-to-bin()
{ 
    echo "obase=2;${1}" | bc 
}
function dec-to-hex()
{
    echo "obase=16;${1}" | bc
}
function hex-to-bin()
{
    dec-to-bin `hex-to-dec ${1}`
}
function hex-to-dec()
{
    ((decNum=16#${1})); echo ${decNum}
}

# Calculate a formula
function calc
{
    python -c "print ${*}"
}

source ${HOME}/Script/load-user-apps.sh
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
export PS1='[\t \u@\h \W]\$ '
# Keep timestamp of command executed
export HISTTIMEFORMAT="[%Y-%m-%d_%H:%M:%S] "
# Enlarge history record amount
export HISTSIZE=2000
export HISTFILESIZE=1000000

# enter tmux environment
if [ "${TMUX}" == "" ]; then
    tmux attach
    if [ ${?} -ne 0 ]; then
        tmux
    fi
fi

