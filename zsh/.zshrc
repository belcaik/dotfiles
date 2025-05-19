# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#compdef eww

autoload -U is-at-least

_eww() {
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
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_eww_commands" \
"*::: :->eww" \
&& ret=0
    case $state in
    (eww)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:eww-command-$line[1]:"
        case $line[1] in
            (shell-completions)
_arguments "${_arguments_options[@]}" \
'-s+[]:SHELL:(bash elvish fish powershell zsh)' \
'--shell=[]:SHELL:(bash elvish fish powershell zsh)' \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(daemon)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(logs)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(ping)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(update)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
'*::mappings -- variable_name="new_value"-pairs that will be updated:' \
&& ret=0
;;
(inspector)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(open)
_arguments "${_arguments_options[@]}" \
'--id=[]:ID: ' \
'--screen=[The identifier of the monitor the window should open on]:SCREEN: ' \
'-p+[The position of the window, where it should open. (i.e.\: 200x100)]:POS: ' \
'--pos=[The position of the window, where it should open. (i.e.\: 200x100)]:POS: ' \
'-s+[The size of the window to open (i.e.\: 200x100)]:SIZE: ' \
'--size=[The size of the window to open (i.e.\: 200x100)]:SIZE: ' \
'-a+[Sidepoint of the window, formatted like "top right"]:ANCHOR: ' \
'--anchor=[Sidepoint of the window, formatted like "top right"]:ANCHOR: ' \
'--duration=[Automatically close the window after a specified amount of time, i.e.\: 1s]:DURATION: ' \
'*--arg=[Define a variable for the window, i.e.\: \`--arg "var_name=value"\`]:ARGS: ' \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--toggle[If the window is already open, close it instead]' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
':window_name -- Name of the window you want to open:' \
&& ret=0
;;
(open-many)
_arguments "${_arguments_options[@]}" \
'*--arg=[Define a variable for the window, i.e.\: \`--arg "window_id\:var_name=value"\`]:ARGS: ' \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--toggle[If a window is already open, close it instead]' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
'*::windows -- List the windows to open, optionally including their id, i.e.\: `--window "window_name\:window_id"`:' \
&& ret=0
;;
(close)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
'*::windows:' \
&& ret=0
;;
(reload)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(kill)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(close-all)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(state)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'-a[Shows all variables, including not currently used ones]' \
'--all[Shows all variables, including not currently used ones]' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(get)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
':name:' \
&& ret=0
;;
(list-windows)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(active-windows)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(debug)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(graph)
_arguments "${_arguments_options[@]}" \
'-c+[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--config=[override path to configuration directory (directory that contains eww.yuck and eww.(s)css)]:CONFIG:_files' \
'--debug[Write out debug logs. (To read the logs, run \`eww logs\`)]' \
'--force-wayland[Force eww to use wayland. This is a no-op if eww was compiled without wayland support]' \
'--logs[Watch the log output after executing the command]' \
'--no-daemonize[Avoid daemonizing eww]' \
'--restart[Restart the daemon completely before running the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_eww__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:eww-help-command-$line[1]:"
        case $line[1] in
            (shell-completions)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(daemon)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(logs)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(ping)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(update)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(inspector)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(open)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(open-many)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(close)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(reload)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(kill)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(close-all)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(state)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(get)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(list-windows)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(active-windows)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(debug)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(graph)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_eww_commands] )) ||
_eww_commands() {
    local commands; commands=(
'shell-completions:Generate a shell completion script' \
'daemon:Start the Eww daemon' \
'logs:Print and watch the eww logs' \
'ping:Ping the eww server, checking if it is reachable' \
'update:Update the value of a variable, in a running eww instance' \
'inspector:Open the GTK debugger' \
'open:Open a window' \
'open-many:Open multiple windows at once. NOTE\: This will in the future be part of eww open, and will then be removed' \
'close:Close the given windows' \
'reload:Reload the configuration' \
'kill:Kill the eww daemon' \
'close-all:Close all windows, without killing the daemon' \
'state:Prints the variables used in all currently open window' \
'get:Get the value of a variable if defined' \
'list-windows:List the names of active windows' \
'active-windows:Show active window IDs, formatted linewise \`<window_id>\: <window_name>\`' \
'debug:Print out the widget structure as seen by eww' \
'graph:Print out the scope graph structure in graphviz dot format' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'eww commands' commands "$@"
}
(( $+functions[_eww__active-windows_commands] )) ||
_eww__active-windows_commands() {
    local commands; commands=()
    _describe -t commands 'eww active-windows commands' commands "$@"
}
(( $+functions[_eww__help__active-windows_commands] )) ||
_eww__help__active-windows_commands() {
    local commands; commands=()
    _describe -t commands 'eww help active-windows commands' commands "$@"
}
(( $+functions[_eww__close_commands] )) ||
_eww__close_commands() {
    local commands; commands=()
    _describe -t commands 'eww close commands' commands "$@"
}
(( $+functions[_eww__help__close_commands] )) ||
_eww__help__close_commands() {
    local commands; commands=()
    _describe -t commands 'eww help close commands' commands "$@"
}
(( $+functions[_eww__close-all_commands] )) ||
_eww__close-all_commands() {
    local commands; commands=()
    _describe -t commands 'eww close-all commands' commands "$@"
}
(( $+functions[_eww__help__close-all_commands] )) ||
_eww__help__close-all_commands() {
    local commands; commands=()
    _describe -t commands 'eww help close-all commands' commands "$@"
}
(( $+functions[_eww__daemon_commands] )) ||
_eww__daemon_commands() {
    local commands; commands=()
    _describe -t commands 'eww daemon commands' commands "$@"
}
(( $+functions[_eww__help__daemon_commands] )) ||
_eww__help__daemon_commands() {
    local commands; commands=()
    _describe -t commands 'eww help daemon commands' commands "$@"
}
(( $+functions[_eww__debug_commands] )) ||
_eww__debug_commands() {
    local commands; commands=()
    _describe -t commands 'eww debug commands' commands "$@"
}
(( $+functions[_eww__help__debug_commands] )) ||
_eww__help__debug_commands() {
    local commands; commands=()
    _describe -t commands 'eww help debug commands' commands "$@"
}
(( $+functions[_eww__get_commands] )) ||
_eww__get_commands() {
    local commands; commands=()
    _describe -t commands 'eww get commands' commands "$@"
}
(( $+functions[_eww__help__get_commands] )) ||
_eww__help__get_commands() {
    local commands; commands=()
    _describe -t commands 'eww help get commands' commands "$@"
}
(( $+functions[_eww__graph_commands] )) ||
_eww__graph_commands() {
    local commands; commands=()
    _describe -t commands 'eww graph commands' commands "$@"
}
(( $+functions[_eww__help__graph_commands] )) ||
_eww__help__graph_commands() {
    local commands; commands=()
    _describe -t commands 'eww help graph commands' commands "$@"
}
(( $+functions[_eww__help_commands] )) ||
_eww__help_commands() {
    local commands; commands=(
'shell-completions:Generate a shell completion script' \
'daemon:Start the Eww daemon' \
'logs:Print and watch the eww logs' \
'ping:Ping the eww server, checking if it is reachable' \
'update:Update the value of a variable, in a running eww instance' \
'inspector:Open the GTK debugger' \
'open:Open a window' \
'open-many:Open multiple windows at once. NOTE\: This will in the future be part of eww open, and will then be removed' \
'close:Close the given windows' \
'reload:Reload the configuration' \
'kill:Kill the eww daemon' \
'close-all:Close all windows, without killing the daemon' \
'state:Prints the variables used in all currently open window' \
'get:Get the value of a variable if defined' \
'list-windows:List the names of active windows' \
'active-windows:Show active window IDs, formatted linewise \`<window_id>\: <window_name>\`' \
'debug:Print out the widget structure as seen by eww' \
'graph:Print out the scope graph structure in graphviz dot format' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'eww help commands' commands "$@"
}
(( $+functions[_eww__help__help_commands] )) ||
_eww__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'eww help help commands' commands "$@"
}
(( $+functions[_eww__help__inspector_commands] )) ||
_eww__help__inspector_commands() {
    local commands; commands=()
    _describe -t commands 'eww help inspector commands' commands "$@"
}
(( $+functions[_eww__inspector_commands] )) ||
_eww__inspector_commands() {
    local commands; commands=()
    _describe -t commands 'eww inspector commands' commands "$@"
}
(( $+functions[_eww__help__kill_commands] )) ||
_eww__help__kill_commands() {
    local commands; commands=()
    _describe -t commands 'eww help kill commands' commands "$@"
}
(( $+functions[_eww__kill_commands] )) ||
_eww__kill_commands() {
    local commands; commands=()
    _describe -t commands 'eww kill commands' commands "$@"
}
(( $+functions[_eww__help__list-windows_commands] )) ||
_eww__help__list-windows_commands() {
    local commands; commands=()
    _describe -t commands 'eww help list-windows commands' commands "$@"
}
(( $+functions[_eww__list-windows_commands] )) ||
_eww__list-windows_commands() {
    local commands; commands=()
    _describe -t commands 'eww list-windows commands' commands "$@"
}
(( $+functions[_eww__help__logs_commands] )) ||
_eww__help__logs_commands() {
    local commands; commands=()
    _describe -t commands 'eww help logs commands' commands "$@"
}
(( $+functions[_eww__logs_commands] )) ||
_eww__logs_commands() {
    local commands; commands=()
    _describe -t commands 'eww logs commands' commands "$@"
}
(( $+functions[_eww__help__open_commands] )) ||
_eww__help__open_commands() {
    local commands; commands=()
    _describe -t commands 'eww help open commands' commands "$@"
}
(( $+functions[_eww__open_commands] )) ||
_eww__open_commands() {
    local commands; commands=()
    _describe -t commands 'eww open commands' commands "$@"
}
(( $+functions[_eww__help__open-many_commands] )) ||
_eww__help__open-many_commands() {
    local commands; commands=()
    _describe -t commands 'eww help open-many commands' commands "$@"
}
(( $+functions[_eww__open-many_commands] )) ||
_eww__open-many_commands() {
    local commands; commands=()
    _describe -t commands 'eww open-many commands' commands "$@"
}
(( $+functions[_eww__help__ping_commands] )) ||
_eww__help__ping_commands() {
    local commands; commands=()
    _describe -t commands 'eww help ping commands' commands "$@"
}
(( $+functions[_eww__ping_commands] )) ||
_eww__ping_commands() {
    local commands; commands=()
    _describe -t commands 'eww ping commands' commands "$@"
}
(( $+functions[_eww__help__reload_commands] )) ||
_eww__help__reload_commands() {
    local commands; commands=()
    _describe -t commands 'eww help reload commands' commands "$@"
}
(( $+functions[_eww__reload_commands] )) ||
_eww__reload_commands() {
    local commands; commands=()
    _describe -t commands 'eww reload commands' commands "$@"
}
(( $+functions[_eww__help__shell-completions_commands] )) ||
_eww__help__shell-completions_commands() {
    local commands; commands=()
    _describe -t commands 'eww help shell-completions commands' commands "$@"
}
(( $+functions[_eww__shell-completions_commands] )) ||
_eww__shell-completions_commands() {
    local commands; commands=()
    _describe -t commands 'eww shell-completions commands' commands "$@"
}
(( $+functions[_eww__help__state_commands] )) ||
_eww__help__state_commands() {
    local commands; commands=()
    _describe -t commands 'eww help state commands' commands "$@"
}
(( $+functions[_eww__state_commands] )) ||
_eww__state_commands() {
    local commands; commands=()
    _describe -t commands 'eww state commands' commands "$@"
}
(( $+functions[_eww__help__update_commands] )) ||
_eww__help__update_commands() {
    local commands; commands=()
    _describe -t commands 'eww help update commands' commands "$@"
}
(( $+functions[_eww__update_commands] )) ||
_eww__update_commands() {
    local commands; commands=()
    _describe -t commands 'eww update commands' commands "$@"
}

if [ "$funcstack[1]" = "_eww" ]; then
    _eww "$@"
else
    compdef _eww eww
fi

# fnm
FNM_PATH="/home/belcaik/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/belcaik/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

PATH=~/.console-ninja/.bin:$PATH