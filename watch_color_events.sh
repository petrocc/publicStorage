#!/bin/bash

# Prints a colorized events output.
# Checks to see if Salt is there.
# Then checks for (and attempts to install) jq.

if ! [[ -e /usr/bin/salt ]];
then

    echo "This relies on SaltStack tools, and is only useful after Slat is installed."
    echo "install Salt first."
    echo "Exiting."
    exit 1
fi


if ! [[ -e /usr/bin/jq ]];
then
    echo "The jq binary does not appear to be installed, attempting install:"
    echo "  salt-call pkg.install jq"

    salt-call pkg.install jq

    if [[ $? -gt 0 ]]; then
        "Install of JQ seems to have failed."
        "Exiting."
        exit 1
    fi
fi

salt-run state.event | while read -r tag data;
    do
    echo $tag
    echo $data | jq --color-output .
done
