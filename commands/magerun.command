COMMAND="magerun <optional container>"
HELP_TEXT="Run magerun in a container"

function magerun() {
    workdir="/var/www/html/htdocs"
    run_type="not-found"

    if [ "$WORKDIR" != "" ]; then
        workdir="$WORKDIR"
    fi

    if docker ps --format "{{.Names}}" | grep -q "^$1\$"; then
        run_type="docker"
    elif docker-compose config --services 2>/dev/null | grep -q "^app$"; then
        run_type="docker-compose"
    fi

    if [ "$run_type" == 'docker' ]; then
        docker exec -it --user www-data --workdir "$workdir" "$1" magerun "${@:2}"
    elif [ "$run_type" == 'docker-compose' ]; then
        docker-compose exec --user www-data --workdir "$workdir" app magerun "${@:1}"
    elif [ "$run_type" == 'not-found' ]; then
        echo "[ERROR]: No container found with name '$1' or no service found with name 'app'"
    fi
}
