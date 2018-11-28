COMMAND="bash <container> <user (root)>"
HELP_TEXT="Run a bash shell inside a Docker container"

COLUMNS="$(tput cols)"
LINES="$(tput lines)"
DOCKERAPPEND=""

function bash() {
    USER="$2"

    if [ "$USER" != "" ]; then
        DOCKERAPPEND="$DOCKERAPPEND -u $USER"
    fi

    docker exec -it $DOCKERAPPEND "$1" bash -c "stty cols $COLUMNS rows $LINES && bash" || {
        docker-compose exec $DOCKERAPPEND "$1" bash -c "stty cols $COLUMNS rows $LINES && bash"
    }
}
