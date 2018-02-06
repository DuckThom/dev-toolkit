COMMAND="run <container> <command> [args]"
HELP_TEXT="Run a command inside a Docker container"

function run() {
    docker exec -it "${@:1}" || {
        echo "No container found with name '$1', falling back to service name..."

        docker-compose exec "${@:1}"
    }
}
