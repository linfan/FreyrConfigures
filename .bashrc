alias rm='rm -i'
alias em='emacs -nw'
alias py='python'
alias py3='python3'
alias vi='vim'
alias em='emacs -nw'
alias ls='ls --color=auto'
alias ll='ls -l'
alias pp='ps -ef | head -1; ps -ef | grep -v grep | grep'
alias g='py3 /home/freyr/workspace/giveaword/giveaword.py'
alias c='clear'
alias grep='grep --color=auto'
alias ngrep='grep -n -H'
alias fgrep='~/Script/fgrep.sh'
alias pgrep="ps -ef | head -1; ps -ef | grep -v grep | grep --color=auto -i"
alias ftree='~/Script/ftree.sh'
alias mm='~/Script/mm.sh'
alias w3m='w3m -M'
alias minicom='minicom -c on'
alias capitalize-all="sed 's/\b[a-z]/\U&/g'"
alias lowercase-all="sed 's/[A-Z]/\L&/g'"
alias uppercase-all="sed 's/[a-z]/\U&/g'"
alias wup='~/Script/who-use-port.sh'

QT_4_PATH=/home/freyr/.Qt4/bin
QT_5_PATH=/home/freyr/.Qt5/5.0.1/gcc_64/bin
function useQt4()
{
    PATH=`echo ${PATH} | sed 's#/home/freyr/.Qt[^:]*:##g'`
    export PATH=${QT_4_PATH}:${PATH}
}
function useQt5()
{
    PATH=`echo ${PATH} | sed 's#/home/freyr/.Qt[^:]*:##g'`
    export PATH=${QT_5_PATH}:${PATH}
}

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

# export new path to variable if not exist
function exportPathOnce()
{
    if [ "`echo ${!1} | grep -o \"${2}\"`" == "" ]; then
        if [ "${!1}" == "" ]; then
            export $"${1}"=${2}
        else
            export $"${1}"=${2}:${!1}
        fi
    fi
}

export TINY6410_TOOLCHAIN_PATH=/opt/FriendlyARM/toolschain/4.5.1/bin
export STAGING_DIR=/home/freyr/App/openwrt-sdk/staging_dir
export Boost_LIBRARY_DIRS="/home/freyr/App/boost_1_54_0/stage/lib"
export Boost_INCLUDE_DIRS="/home/freyr/.inc"
exportPathOnce PATH /home/freyr/.bin
exportPathOnce LD_LIBRARY_PATH ${Boost_LIBRARY_DIRS}
exportPathOnce LD_LIBRARY_PATH /home/freyr/.lib
exportPathOnce C_INCLUDE_PATH /home/freyr/.inc
exportPathOnce CPLUS_INCLUDE_PATH /home/freyr/.inc

export PS1='[\t \u@\h \W]\$ '
export HISTTIMEFORMAT="[%Y-%m-%d_%H:%M:%S] "
export HISTSIZE=2000
export HISTFILESIZE=1000000
