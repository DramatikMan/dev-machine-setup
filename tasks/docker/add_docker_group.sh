#!/bin/bash

echo_task "Resolving access"

user_in_docker_group=$(getent group docker | grep -o $USER)  

if [[ $? != 0 ]]; then
    echo_action "Creating a group if it does not exist"
    group_exists=$(getent group docker)

    if [[ $? != 0 ]]; then
        out=$(sudo groupadd docker 2>&1 > /dev/null)
    fi

    catch_error

    echo_action "Adding the current user to the group"
    out=$(sudo usermod -aG docker $USER 2>&1 > /dev/null)
    catch_error
else
    echo_ok "Already exists"
fi