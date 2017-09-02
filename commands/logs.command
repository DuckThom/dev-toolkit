COMMAND="logs <service>"
HELP_TEXT="Alias for 'docker-compose logs -f'"

function logs () {
    docker-compose logs -f "${@:1}"
}
