#!/bin/bash

# Ensure the server directory is correct
cd /opt/valheim

# Start the server with the provided environment variables
./valheim_server.x86_64 \
  -name "$SERVER_NAME" \
  -port "$SERVER_PORT" \
  -world "$WORLD_NAME" \
  -password "$SERVER_PASS" \
  -public "$SERVER_PUBLIC"