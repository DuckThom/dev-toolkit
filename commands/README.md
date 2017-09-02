## Commands

The global commands are stored here.
These commands are always loaded when running the `dev` command.

### Command lookup

Global commands should be placed in the `commands` folder, which will
be in the same folder as the main `dev` command.

Local commands can be placed in a `dev-commands` folder, which can be
placed in the current folder OR in one of the parent directories.

### Template

Filename: `command_name.command`

Contents:
```
COMMMAND="command_name <required_arg> [optional_arg]"
HELP_TEXT="This will be displayed as a short help text for the command"

function command_name () {
    echo "This is what the command will actually do."
}
```

If the above command was added and placed into `commands` folder OR in
the `dev-commands` folder, the `dev` command would display it like this:
```
luna@arch $ dev
Usage: dev <command>

Available commands:

command_name <required_arg> [optional_arg]:
    This will be displayed as a short help text for the command
```
