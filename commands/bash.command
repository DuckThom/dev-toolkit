COMMAND="bash <container>"
HELP_TEXT="Run a bash shell inside a Docker container"

COLUMNS="$(tput cols)"
LINES="$(tput lines)"

function bash() {
    docker exec -it "${@:1}" bash -c "stty cols $COLUMNS rows $LINES && bash" || {
        docker-compose exec "${@:1}" bash -c "stty cols $COLUMNS rows $LINES && bash"
    }
}
