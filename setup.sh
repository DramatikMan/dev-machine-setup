#!/bin/bash

source ./helpers/echoes.sh
source ./helpers/handlers.sh

echo_default "Staring setup run.\n"

source ./tasks/docker/main.sh

echo_default "\n\nAll done!"