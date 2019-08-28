COMMAND="branch-cleanup [--unsafe]"
HELP_TEXT="Prune local refs and remove local merged branches not present on remote"

function branch-cleanup () {
    UNSAFE=0

    if [[ "$1" == "--unsafe" ]]
    then
        UNSAFE=1
    fi

    echo "Pruning local refs"
    git fetch --prune || exit $?


    if [[ $UNSAFE -eq 1 ]]
    then
        echo "Removing branches (merged and unmerged)"
        git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
    else
        echo "Removing branches (merged only)"
        git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
    fi
}
