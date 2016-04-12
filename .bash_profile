
## git
alias gs="git status"
alias gaa="git add --all"
alias gc="git commit -m"
alias gac="git commit -am"
alias gba="git branch --all"
alias gco="git checkout"
alias gfo="git fetch origin"
alias gfo="git fetch origin"
alias prune="git remote prune origin"
alias prune-merged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias super-prune='prune; prune-merged'
alias master="gco master"
alias develop="gco develop"
alias push="git push"
alias pull="git pull"
alias stash="git stash"
alias pop="git stash pop"

git_add_all_commit_push() {

    if [[ $# -ne 1 ]]; then
        echo "Error, USAGE: gacp MESSAGE"
        return
    fi

    git add --all;
    git commit -m $1;
    git push;
    echo "Added, Committed, and pushed with message $1";
}

## alias gac="git add --all; git commit -m 'message'; git push;"
alias gacp=git_add_all_commit_push

git_add_all_commit() {

    if [[ $# -ne 1 ]]; then
        echo "Error, USAGE: gac MESSAGE"
        return
    fi

    git add --all;
    git commit -m $1;
    echo "Added and Committed with message $1";
}


## local server run
alias run="./run_server.sh"

## edit
subl_no_hang() {

    if [[ $# -ne 1 ]]; then
        echo "Error, USAGE: sl FILE"
        return
    fi

    subl -w $1 &
    echo "Sublimed $1";
}

alias sl=subl_no_hang
alias ip="ifconfig|grep netmask|awk '{print $2}'"

## find
find_rec() {

    if [[ $# -ne 1 ]]; then
        echo "Error, USAGE: find FILE"
        return
    fi

    find . -name $1
    echo "Finding \"$1\"";
}

alias findr=find_rec

## django
alias run-server="./run-server.py"
alias sync-db="./sync-db.py"

## unix
alias ls="ls -GFha"
alias ll="ls -lat"
alias grep="grep --color"
alias tail="tail -n1000 -f"

export EDITOR='subl -w'

## prompt extension
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[$(tput setaf 2)\][\u@\h] \[$(tput setaf 6)\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
