#compdef farm

autoload -U is-at-least

_farm() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
":: :_farm_commands" \
"*::: :->farm" \
&& ret=0
    case $state in
    (farm)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:farm-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
&& ret=0
;;
(install)
_arguments "${_arguments_options[@]}" \
'-l[Lists Ruby versions available to install]' \
'--list[Lists Ruby versions available to install]' \
'-w[Specify a openssl directory]' \
'--with-openssl-dir[Specify a openssl directory]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'::version:_values 'version' $(farm install -l)' \
&& ret=0
;;
(uninstall)
_arguments "${_arguments_options[@]}" \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
':version:_values 'version' $(farm install -l)' \
&& ret=0
;;
(versions)
_arguments "${_arguments_options[@]}" \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
&& ret=0
;;
(local)
_arguments "${_arguments_options[@]}" \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'::version:_values 'version' $(farm completions --list)' \
&& ret=0
;;
(global)
_arguments "${_arguments_options[@]}" \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
':version:_values 'version' $(farm completions --list)' \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" \
'-s+[The shell syntax to use]' \
'--shell=[The shell syntax to use]' \
'--list[]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
&& ret=0
;;
        esac
    ;;
esac
}

(( $+functions[_farm_commands] )) ||
_farm_commands() {
    local commands; commands=(
        "init:Sets environment variables for initializing farm" \
"install:Installs a specific Ruby version" \
"uninstall:Uninstall a specific Ruby version" \
"versions:Lists installed Ruby versions" \
"local:Sets the current Ruby version" \
"global:Sets the global Ruby version" \
"completions:Print shell completions to stdout" \
"help:Prints this message or the help of the given subcommand(s)" \
    )
    _describe -t commands 'farm commands' commands "$@"
}
(( $+functions[_farm__completions_commands] )) ||
_farm__completions_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'farm completions commands' commands "$@"
}
(( $+functions[_farm__global_commands] )) ||
_farm__global_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'farm global commands' commands "$@"
}
(( $+functions[_farm__help_commands] )) ||
_farm__help_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'farm help commands' commands "$@"
}
(( $+functions[_farm__init_commands] )) ||
_farm__init_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'farm init commands' commands "$@"
}
(( $+functions[_farm__install_commands] )) ||
_farm__install_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'farm install commands' commands "$@"
}
(( $+functions[_farm__local_commands] )) ||
_farm__local_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'farm local commands' commands "$@"
}
(( $+functions[_farm__uninstall_commands] )) ||
_farm__uninstall_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'farm uninstall commands' commands "$@"
}
(( $+functions[_farm__versions_commands] )) ||
_farm__versions_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'farm versions commands' commands "$@"
}

