#!/bin/bash

echo_task "Installing Docker"

docker_binary=$(which docker) 2>&1 > /dev/null

if [[ $? != 0 ]]; then
    echo_action "Installing HTTPS repository usage prerequisites"
    sudo apt update && sudo apt install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        -y \
        2>&1 > /dev/null
    catch_error

    echo_action "Adding Docker’s official GPG key"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg \
        --dearmor \
        -o /usr/share/keyrings/docker-archive-keyring.gpg \
        2>&1 > /dev/null
    catch_error

    echo_action "Setting up the repository"
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list 2>&1 > /dev/null
    catch_error

    echo_action "Installing Docker Engine"
    sudo apt update && sudp apt install \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        -y \
        2>&1 > /dev/null
    catch_error
else
    echo_ok "Already installed"
fi