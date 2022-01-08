#!/bin/bash

ESCAPE_SEQUENCE="\x1b["
COLOR_RESET=$ESCAPE_SEQUENCE"39;49;00m"
COLOR_GREEN=$ESCAPE_SEQUENCE"32;01m"
COLOR_YELLOW=$ESCAPE_SEQUENCE"33;01m"
COLOR_RED=$ESCAPE_SEQUENCE"31;01m"

function echo_ok() {
    echo -e "$COLOR_GREEN[ok]$COLOR_RESET $1."
}

function echo_default() {
    echo -e $1
}

function echo_task() {
    echo -en "$COLOR_YELLOW ➥ $COLOR_RESET"$1": "
}

function echo_action() {
    echo -e "\n$COLOR_YELLOW[action]:$COLOR_RESET $1... "
}

function echo_error() {
    echo -e "$COLOR_RED[error]$COLOR_RESET $1."
}

function catch_error() {
    if [[ $? != 0 ]]; then
        echo_error "Aborting $0"
        exit 2
    else
        echo_ok
    fi
}