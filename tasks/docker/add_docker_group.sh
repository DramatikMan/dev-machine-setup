#!/bin/bash

echo_task "Adding docker user group"

docker_group=$(getent group docker)  

if [[ $? != 0 ]]; then
    out=$(
        sudo groupadd docker \
        && sudo usermod -aG docker $USER \
            2>&1 > /dev/null
    )
    catch_error
else
    echo_ok "Already exists"
fi