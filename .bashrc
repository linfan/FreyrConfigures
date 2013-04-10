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
alias bin-to-dec='~/Script/bin-to-dec.sh'
alias bin-to-hex='~/Script/bin-to-hex.sh'
alias dec-to-bin='~/Script/dec-to-bin.sh'
alias dec-to-hex='~/Script/dec-to-hex.sh'
alias hex-to-bin='~/Script/hex-to-bin.sh'
alias hex-to-dec='~/Script/hex-to-dec.sh'
alias mm="source ~/Script/create-and-compile-main-cc.sh"
alias w3m='w3m -M'

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

