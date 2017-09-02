COMMAND="clear-wsdl <container>"
HELP_TEXT="Clear the wsdl cache from a container"

function clear-wsdl () {
    docker exec -it "$1" bash -c "rm /tmp/wsdl*"
}
