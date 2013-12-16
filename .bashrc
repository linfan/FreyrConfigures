alias rm='rm -i'
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
alias fgrep='~/Script/fgrep.sh'
alias pgrep="ps -ef | head -1; ps -ef | grep -v grep | grep --color=auto -i"
alias ftree='~/Script/ftree.sh'
alias mm='~/Script/mm.sh'
alias w3m='w3m -M'
alias minicom='minicom -c on'
alias wup='~/Script/who-use-port.sh'

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

# export new path to variable if not exist
# ${1}: variable name
# ${2}: value to append
# ${3}: [optional] original value
function exportPathOnce()
{
    if [ "${3}" == "" ]; then
        if [ "`echo ${!1} | grep -o \"${2}\"`" == "" ]; then
            if [ "${!1}" == "" ]; then
                export $"${1}"=${2}
            else
                export $"${1}"=${2}:${!1}
            fi
        fi
    else
        if [ "`echo \"${3}\" | grep -o \"${2}\"`" == "" ]; then
            export $"${1}"=${2}:${3}
        fi
    fi
}
# export path to variable only if specified path exist and is folder
function exportFolderOnce()
{
    if [ -d "${2}" ]; then
        exportPathOnce "${1}" "${2}" "${3}"
    fi
}
# export user specified applications to system path
# ${1}: root folder to user applications
function exportUserPath()
{
    if [ "${USER_PATH_EXPORTED}" == "" ]; then
        export USER_PATH_EXPORTED="YES"
        for folder in `ls ${1}`; do
            app_folder="${1}/${folder}"
            if [ -d ${app_folder} ]; then
                exportFolderOnce PATH ${app_folder}/bin
                exportFolderOnce PATH ${app_folder}/sbin
                exportFolderOnce LD_LIBRARY_PATH ${app_folder}/lib
                exportFolderOnce LD_LIBRARY_PATH ${app_folder}/lib64
                exportFolderOnce C_INCLUDE_PATH ${app_folder}/include
                exportFolderOnce CPLUS_INCLUDE_PATH ${app_folder}/include
                exportFolderOnce MANPATH ${app_folder}/share/man `manpath`
            fi
        done
    fi
}

exportUserPath /home/freyr/app

export Boost_LIBRARY_DIRS="/home/freyr/App/boost_1_54_0/stage/lib"
export Boost_INCLUDE_DIRS="/home/freyr/.inc"
exportPathOnce LD_LIBRARY_PATH ${Boost_LIBRARY_DIRS}

export PS1='[\t \u@\h \W]\$ '
export HISTTIMEFORMAT="[%Y-%m-%d_%H:%M:%S] "
export HISTSIZE=2000
export HISTFILESIZE=1000000

# enter tmux environment
#if [ "${SETUP_TMUX}" == "" ]; then
#    export SETUP_TMUX="YES"
#    tmux attach
#    if [ ${?} -ne 0 ]; then
#        tmux
#    fi
#fi

