COMMAND="logs <service>"
HELP_TEXT="Alias for 'docker logs -f'"

function logs () {
    docker logs -f "${@:1}"
}
