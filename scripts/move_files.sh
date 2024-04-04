# /bin/sh
# Path: scripts/move_files.sh
# Author: belcaik
# Params: ROOT_PWD

# move belcaik~ content to home of system
# explore the files and directories move content from .config to ~/.config

# get pwd from params
ROOT_PWD=$1
HOME_USER_PATH=$2

sh $ROOT_PWD/scripts/utils/check_directories.sh $HOME_USER_PATH

# check every directory 
echo "Moving files from .dotfiles to $HOME_USER_PATH"
find $ROOT_PWD/home -type f | while read -r file;
do 
    # only files
    # check if file is a file and look if exists in ~
    if [ -f $file  ]; then
        # get the / after ROOT_PWD/home 
        file_name=$(echo $file | sed "s|$ROOT_PWD/home/||")
        # check if file exists in ~
        if [ -f $HOME_USER_PATH/$file_name ]; then
            # check if file is the same
            if cmp -s $file $HOME_USER_PATH/$file_name; then
                echo ".dotfile/$file_name already exists in ~"
            else
                echo "Files are different, creating backup"
                NOW=$(date +"%Y-%m-%d-%H-%M-%S")
                # make a backup of the file in ~
                cp $HOME_USER_PATH/$file_name $HOME_USER_PATH/$file_name-$NOW.bak
                cp $file $HOME_USER_PATH/$file_name
                echo ".dotfile/$file_name moved to ~"
            fi
        else
            echo "$.dotfile/$file_name File does not exist in ~, creating"
            cp $file $HOME_USER_PATH/$file_name
        fi
    fi 
done