#!/usr/bin/env bash


# this script will  display a message prompt for a user to confirm an action..
yes_no(){
    declare desc="Prompt for confirmation. \$\"\{1\}\": confirmation message"

    local arg1="${1}"

    local response= read -r -p "${arg1} (y/[n])? " response
    # the above line will read the action from user , -r flag prevents backslash escapes from being interpreted 
    # -p flag is followed by the prompt message which is a combination of arg1 and the string of yes or no

    if [[ "${response}" =~ ^[Yy]$ ]]
    
    then
        exit 0
        # 0 = success status
    else 
        exit 1
    fi
}