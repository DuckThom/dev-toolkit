COMMAND="bash <container (app)> <user (root)>"
HELP_TEXT="Run a bash shell inside a Docker container"

COLUMNS="$(tput cols)"
LINES="$(tput lines)"
DOCKERAPPEND=""

function bash() {
    SERVICE="$1"
    USER="$2"

    if [ "$SERVICE" == "" ]
    then
        SERVICE="app"
    fi

    SERVICE_COUNT="$(docker-compose ps -q $SERVICE 2>/dev/null | wc -l)"
    CONTAINER_COUNT="$(docker ps --format "{{.ID}}: {{.Names}}" | grep -w "$SERVICE" | wc -l)"

    if [ "$SERVICE_COUNT" -gt "0" ]
    then
        CMD="docker-compose exec"
    elif [ "$CONTAINER_COUNT" -gt "0" ]
    then
        CMD="docker exec -it"
    else
        echo "ERROR: No container or service found with name: '$SERVICE'"

        exit 1
    fi

    if [ "$USER" == "" ] && [ "$SERVICE" == "app" ]
    then
        USER="www-data"
    fi

    if [ "$USER" != "" ]
    then
        DOCKERAPPEND="$DOCKERAPPEND -u $USER"
    fi

    $CMD $DOCKERAPPEND "$SERVICE" bash -c "stty cols $COLUMNS rows $LINES && bash"
}
