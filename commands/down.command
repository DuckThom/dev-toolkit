COMMAND="down [options]"
HELP_TEXT="Alias for 'docker-compose down'"

function down () {
    docker-compose down "${@:1}"
}

