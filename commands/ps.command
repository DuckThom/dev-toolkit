COMMAND="ps"
HELP_TEXT="Docker ps with different data."

function ps () {
    docker ps --format="table {{.Names}}\t{{.Status}}\t{{.Ports}}"
}
