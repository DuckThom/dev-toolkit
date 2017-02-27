COMMAND="logs <container>"
HELP_TEXT="Show docker container logs"

function logs () {
    docker logs -f "${@:1}"
}
