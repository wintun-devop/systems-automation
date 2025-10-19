#!/bin/bash

#Verify the Installer Signature
EXPECTED=$(cat composer-setup.sig)
ACTUAL=$(php -r "echo hash_file('sha384', 'composer-setup.php');")
if [ "$EXPECTED" != "$ACTUAL" ]; then
    echo 'ERROR: Invalid installer signature' >&2
    rm composer-setup.php composer-setup.sig
    exit 1
fi