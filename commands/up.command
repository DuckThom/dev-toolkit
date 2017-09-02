COMMAND="up [service]"
HELP_TEXT="Alias for 'docker-compose up -d'"

function up () {
    docker-compose up -d "${@:1}"
}
