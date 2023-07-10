#!/bin/bash

show_help() {
    echo "install.sh - Help Message
    Options:

    f - DANGER. Execute with force. DELETES any existing config file or directory before replacing it with that from this repo.
    h - Print this message and exit
    l [option] - Specify the log file for the script execution. Defaults to install.log
    "
}

OPTIND=1

log_file=install.log
export force=

while getopts fhl: opt ;do
    case "$opt" in
        f)
            export force=1
            ;;
        h)
            show_help
            exit 1
            ;;
        l)
            log_file="$OPTARG"
            ;;

        *)
            echo "Invalid argument passed. Run with -h for help"
            show_help
            exit 1
    esac
done

shift $((OPTIND -1))

show_help() {
    printf "install.sh - Help Message\n\nOptions:\n
        h, ? - Print this message and exit\n
        l [option] - Specify the log file for the script execution. Defaults to install.log\n
        f - DANGER. Execute with force. This will make the script DELETE any existing it finds and replace it with a link to the one from this repo\n\n"
}

log() {
    echo "$1" | tee -a "$log_file"
}

create_config_link() {
    # get dir/filename without the base path
    target="${HOME}/.config/${1##*/}"

    # if the config is not a directory remove the .config path, and replace the leading _ with a .
    [[ -f "$1" ]]&& target=${target/.config\/_/.}

    # if force is set and the file exists remove the existing config first than make a fresh link.
    if [[ -n "$force" ]];then
        echo "Removing $target"
        rm -r "$target"
        echo "Linking $1 $target"
        ln -s "$1" "$target"
    else
        if [[ -e "$target" ]];then
            printf "WARNING: You must remove %s and run again if you wish to replace %s\n" "$target" "$target"
        else
            ln -s "$1" "$target"
        fi
    fi
        
}

export -f create_config_link

log "#########################################"
log "# Installation started $(date +%F\ %R) #"
log "#########################################"
# Install the various XDG config directories
find "$PWD" -mindepth 1 -maxdepth 1 \( -type d -o -type f -name _\* \) ! -name .git\* -exec bash -c 'create_config_link "$@"' bash {} \; | tee -a "$log_file"
log "#########################################"
log "# Installation finished $(date +%F\ %R) #"
log "#########################################"
