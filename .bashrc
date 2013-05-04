alias rm='rm -i'
alias em='emacs -nw'
alias py='python'
alias py3='python3'
alias vi='vim'
alias em='emacs -nw'
alias ls='ls --color=auto'
alias ll='ls -l'
alias mx='ps -ef | grep -v grep | grep'
alias g='py3 /home/freyr/workspace/giveaword/giveaword.py'
alias c='clear'
alias grep='grep --color=auto'
alias ngrep='grep -n -H'
alias fgrep='~/Script/fgrep.sh'
alias pgrep="ps -ef | head -1; ps -ef | grep -v grep | grep --color=auto -i"
alias mm='source ~/Script/create-and-compile-main-cc.sh'
alias w3m='w3m -M'
alias minicom='minicom -c on'
alias dnw2='sudo /home/freyr/App/dnw2/dnw2'
alias list-file='~/Script/list-file.sh'

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

# Take binary input and run it through bc for decimal output
function bin-to-dec()
{
    option='ibase=2;obase=10;'
    convert=${option}$*
    echo $convert | bc
}
# Take binary input and run it through bc for hex output
function bin-to-hex()
{
    option='ibase=2;obase=16;'
    convert=${option}$*
    echo $convert | bc
}
# Take decimal input and run it through bc for binary output
function dec-to-bin()
{
    option='ibase=10;obase=2;'
    convert=${option}$*
    echo $convert | bc
}
# Take decimal input and run it through bc for hex output
function dec-to-hex()
{
    option='obase=16;'
    convert=${option}$*
    echo $convert | bc
}
# Take hex input and run it through bc for binary output
function hex-to-bin()
{
    INPUT_NUM=`echo $* | sed 's/[a-z]/\U&/g'`
    option='ibase=16;obase=2;'
    convert=${option}$INPUT_NUM
    echo $convert | bc
}
# Take hex input and run it through bc for decimal output
function hex-to-dec()
{
    INPUT_NUM=`echo $* | sed 's/[a-z]/\U&/g'`
    option='ibase=16;'
    convert=${option}$INPUT_NUM
    echo $convert | bc
}

export TINY6410_TOOLCHAIN_PATH=/opt/FriendlyARM/toolschain/4.5.1/bin
export PATH=${TINY6410_TOOLCHAIN_PATH}:${QT_4_PATH}:${PATH}
export PS1="[\t \W]\$ "

