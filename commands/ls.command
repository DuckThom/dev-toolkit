COMMAND="ls"
HELP_TEXT="Show running projects."

function ls () {
    docker ps --format="{{.Names}}" | perl -n -e'/(.*)_.+_[0-9]?/ && print "$1\n"' | uniq | grep -v "traefik"
}
