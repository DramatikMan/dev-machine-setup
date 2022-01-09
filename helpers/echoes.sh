#!/bin/bash

ESCAPE_SEQUENCE="\x1b["
COLOR_RESET=$ESCAPE_SEQUENCE"39;49;00m"
COLOR_GREEN=$ESCAPE_SEQUENCE"32;01m"
COLOR_YELLOW=$ESCAPE_SEQUENCE"33;01m"
COLOR_RED=$ESCAPE_SEQUENCE"31;01m"

function echo_ok() {
    echo -en "$COLOR_GREEN[ok]$COLOR_RESET "$1
}

function echo_error() {
    echo -en "$COLOR_RED[error]$COLOR_RESET "$1
}

function echo_default() {
    echo -e $1
}

function echo_task() {
    echo -en "\n$COLOR_YELLOW ➥ $COLOR_RESET"$1"... "
}

function echo_action() {
    echo -en "\n$COLOR_YELLOW[action]:$COLOR_RESET $1... "
}