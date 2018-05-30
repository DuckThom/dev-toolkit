COMMAND="run <container> <command> [args]"
HELP_TEXT="Run a command inside a Docker container"

function run() {
    docker exec -it "${@:1}" || {
        docker-compose exec "${@:1}"
    }
}
