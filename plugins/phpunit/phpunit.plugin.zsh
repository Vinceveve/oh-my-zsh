# Phpunit: list groups basic command completion

_phpunit_get_command_list () {
    phpunit --list-groups | sed "1,/Available test group(s):/d" | awk '/[a-z]+/ { print $2 }'
}

_phpunit () {
    if [ -f artisan ]; then
        compadd `_phpunit_get_command_list`
    fi
}

compdef _phpunit phpunit
