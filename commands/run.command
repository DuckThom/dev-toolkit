COMMAND="run <container> <command> [args]"
HELP_TEXT="Run a command inside a Docker container"

function run() {
    SERVICE="$1"

    if [ -z $RUN_USER ]
    then
        if [ "$SERVICE" == "app" ]
        then
            RUN_USER="www-data"
        else
            RUN_USER="root"
        fi
    fi

    docker exec -it --user="$RUN_USER" "${@:1}" || {
        docker-compose exec --user="$RUN_USER" "${@:1}"
    }
}
