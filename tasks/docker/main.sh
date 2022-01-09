#!/bin/bash

echo_default "Setting up Docker..."

source ./tasks/docker/install_docker_engine.sh
source ./tasks/docker/add_docker_group.sh
source ./tasks/docker/install_docker_compose.sh