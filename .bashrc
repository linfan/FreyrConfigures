alias rm='rm -i'
alias em='emacs -nw'
alias grep='grep --color=auto'
alias grepline='grep -n -H'
alias py='python'
alias py3='python3'
alias vi='vim'
alias ls='ls --color=auto'
alias ll='ls -l'
alias mx='ps -ef | grep -v grep | grep'
alias gaw='py3 /home/freyr/workspace/giveaword/giveaword.py'
alias mp3='mpg123'
alias c='clear'

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

export PATH=${QT_4_PATH}:${PATH}
export PS1="[\t \W]\$ "

