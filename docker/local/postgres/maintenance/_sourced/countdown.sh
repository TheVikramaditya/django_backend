#!/usr/bin/env bash


# the function will take a number of seconds as an argument and display a countdown timer in the terminal
# the timer updates in real time and runs until the specified number of seconds have elapsed
countdown(){
    declare desc="A simple countdown."

    local seconds="${1}"

    local d=$(($(date +%s) + "${seconds}"))

    while [ "$d" -ge `date +%s` ]; do
        echo -ne "$(date -u --date @$(($d - `date +%s`)) +%H:%M:%S)\r";

        sleep 0.1
    done
}