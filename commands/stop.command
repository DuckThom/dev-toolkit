COMMAND="stop [service]"
HELP_TEXT="Alias for 'docker-compose stop'"

function stop () {
    docker-compose stop "${@:1}"
}

