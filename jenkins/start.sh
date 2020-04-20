#!/bin/bash

# Install latest docker command launcher if not exist
if [ ! -f /usr/sbin/kd ]; then
    wget https://raw.githubusercontent.com/tpbtools/docker-command-launcher/master/kd.sh -O /usr/sbin/kd -q
    chmod +x /usr/sbin/kd
fi

# Install latest devcontrol if not exist
if [ ! -f /usr/local/bin/devcontrol ]; then
    curl https://raw.githubusercontent.com/tpbtools/devcontrol/master/install.sh | bash
fi

# Start jenkins-dind
/usr/local/bin/tpb-jenkins-dind.sh "$@"
