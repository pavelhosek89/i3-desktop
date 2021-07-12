#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

FILES_FOR_SYNC="files"

install_files() {
    echo -e "\e[1;35;40mINSTALL DOTFILES\e[0m"

    if [ -f "$FILES_FOR_SYNC" ]; then
        rsync -ahrv --delete --files-from=$FILES_FOR_SYNC \
            $PWD/dotfiles/ /home/$USER/
    fi
}

update_files() {
    echo -e "\e[1;35;40mUPDATE DOTFILES\e[0m"

    if [ -f "$FILES_FOR_SYNC" ]; then
        rsync -ahrv --delete --files-from=$FILES_FOR_SYNC \
            /home/$USER/ $PWD/dotfiles/
    fi
}

#########################
# The command line help #
#########################
display_help() {
    echo "Usage: $0 [option...]" >&2
    echo
    echo "   -h                     print this help message"
    echo "   -i                     install dotfiles for $USER"
    echo "   -u                     update dotfiles from $USER configuration"
    echo
    # echo some stuff here for the -a or --add-options
    exit 1
}


# START SCRIPT

######################
# Check if parameter #
# is set too execute #
######################
if [[ $# -ne 1 ]] ; then
    display_help
    exit 1
fi

################################
# Check if parameters options  #
# are given on the commandline #
################################
while getopts ":bhi" opt; do
    case $opt in
        h)
            display_help  # Call your function
            exit 0
            ;;
        i)
            install_files  # Call your function
            exit 0
            ;;
        u)
            update_files  # Call your function
            exit 0
            ;;
        \?)
            display_help  # Call your function
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))
