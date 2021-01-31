COMMAND="console"
HELP_TEXT="Run a console"

function console() {
    USER="$1"
    if [ "" == "$USER" ]
    then
    	USER="$(id -u)"
    fi

    docker-compose run \
    	--rm \
	-u $USER \
	-e SPACESHIP_HOST_SHOW=always \
	-e SPACESHIP_USER_SUFFIX=" @ Docker " \
	console \
	$(basename $SHELL)
}
