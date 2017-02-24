COMMAND="stats"
HELP_TEXT="Docker stats with container names. Usage: dev stats"

function stats () {
    docker stats --format="table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}"

    exit 0
}
