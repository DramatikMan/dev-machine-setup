#!/bin/bash

echo_task "Installing Docker Compose"

docker_compose_binary=$(docker compose 2>&1 > /dev/null)  

if [[ $? != 1 ]]; then
    file_path="/usr/libexec/docker/cli-plugins/docker-compose"

    echo_action "Downloading latest binary"
    out=$(
        wget \
        https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
        -O $file_path \
        2>&1 > /dev/null
    )
    catch_error

    echo_action "Setting access rights"
    out=$(chmod 755 $file_path 2>&1 > /dev/null)
    catch_error
else
    echo_ok "Already installed"
fi