#!/bin/bash

function catch_error() {
    if [[ $? != 0 ]]; then
        echo_error
        echo
        exit 2
    else
        echo_ok
    fi
}