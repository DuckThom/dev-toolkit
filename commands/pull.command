COMMAND="pull"
HELP_TEXT="Pull in the latest images for services in a docker-compose.yml file."

function pull () {
    docker-compose pull "${@:1}"
}

