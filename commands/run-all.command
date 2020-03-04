COMMAND="run-all <service> <command> [args]"
HELP_TEXT="Run a command inside all running instances of a service"

function run-all() {
    SERVICE="$1"
    SERVICE_COUNT="$(docker-compose ps -q $SERVICE | wc -l)"
    TMUX_CMD=""

    if [ -z "$RUN_USER" ]
    then
        if [ "$SERVICE" == "app" ]
        then
            RUN_USER="www-data"
        else
            RUN_USER="root"
        fi
    fi

    if [[ "$SERVICE_COUNT" == "0" ]]
    then
        echo "No running instances found for service '$SERVICE'"
        exit 1
    fi

    for i in $(seq 1 $SERVICE_COUNT)
    do
        if [[ $i -eq 1 ]]
        then
            TMUX_CMD="$TMUX_CMD new-session"
        else
            TMUX_CMD="$TMUX_CMD split-window -h"
        fi

        TMUX_CMD="$TMUX_CMD 'docker-compose exec --user="$RUN_USER" --index=$i $SERVICE "${@:2}"' \\;"
    done

    eval "tmux $TMUX_CMD"
}
