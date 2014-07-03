# Phpunit: list groups basic command completion

_phpunit_get_group_list () {
    phpunit --list-groups | sed "1,/Available test group(s):/d" | awk '/[a-z]+/ { print $2 }' |more
}
_phpunit_get_cmd_list () {
    phpunit --help |grep "-" |awk '/[a-z]+/ { print $1 }'
}
_phpunit_group () {
    compadd `_phpunit_get_group_list`
}
_phpunit() {
    compadd `_phpunit_get_cmd_list`
}

#compdef _phpunit phpunit
compdef _phpunit_group phpunit

alias phpunit-group='phpunit --group'
