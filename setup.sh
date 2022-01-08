#!/bin/bash

source ./helpers/echoes.sh

echo_default "Staring setup run.\n"

source ./tasks/docker/main.sh

echo_default "\nAll done!"