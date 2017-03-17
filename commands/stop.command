COMMAND="stop [service]"
HELP_TEXT="Stop Docker Compose services"

COMPOSE_PATH=""

function stop () {
    find-compose-file

    if [ -f "$COMPOSE_PATH/docker-compose.yml" ]; then
        cd "$COMPOSE_PATH"
        docker-compose stop "${@:1}"
        cd "$CURRENT_DIR"
    else
        echo "No docker-compose.yml file found in the current or any parent directory"
    fi
}

function find-compose-file () {
    COMPOSE_PATH=$CURRENT_DIR

    while [[ "$COMPOSE_PATH" != "" && ! -e "$COMPOSE_PATH/docker-compose.yml" ]]; do
        COMPOSE_PATH=${COMPOSE_PATH%/*}
    done
}

