COMMAND="run"
HELP_TEXT="Run a command inside a Docker container"

function run() {
    docker exec -it "${@:2}"
}
