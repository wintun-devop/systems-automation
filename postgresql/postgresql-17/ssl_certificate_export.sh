#!/bin/bash

#variable
DATA_DIR="/var/lib/pgsql/17/data"
KEY_FILE="server_key.pem"
CERTIFICATE_FILE="server_cert.pem"

openssl req -newkey rsa:4096 -nodes -keyout "$KEY_FILE" -x509 -days 365 -out "$CERTIFICATE_FILE"

sudo cp "$KEY_FILE" "$CERTIFICATE_FILE" "$DATA_DIR"

sudo chown postgres:postgres  "$DATA_DIR/$CERTIFICATE_FILE"

sudo chmod 600  "$DATA_DIR/$CERTIFICATE_FILE"

sudo chown postgres:postgres  "$DATA_DIR/$KEY_FILE"

sudo chmod 600  "$DATA_DIR/$KEY_FILE"