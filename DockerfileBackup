# Use the official Valheim server image from GitHub Container Registry
FROM ghcr.io/lloesche/valheim-server:latest

# Set environment variables for the server
ENV SERVER_NAME="CarefValhalla"
ENV SERVER_PORT=2456
ENV WORLD_NAME="Perfection"
ENV SERVER_PASS="dota2p"
ENV SERVER_PUBLIC=true

# Expose necessary ports (UDP 2456-2458 for Valheim, TCP 9001 for web interface)
EXPOSE 2456-2458/udp
EXPOSE 9001/tcp

# Create a start_server.sh script to run the Valheim server with the environment variables
RUN echo '#!/bin/bash\n\
cd /opt/valheim\n\
./valheim_server.x86_64 -name "$SERVER_NAME" -port "$SERVER_PORT" -world "$WORLD_NAME" -password "$SERVER_PASS" -public "$SERVER_PUBLIC"' > /start_server.sh \
    && chmod +x /start_server.sh

# Create necessary directories for configuration and data if they don't exist
RUN mkdir -p /config /opt/valheim

# Define volume mounts for configuration and data persistence
VOLUME ["/config", "/opt/valheim"]

# Command to run the server (executes the start_server.sh script)
CMD ["/start_server.sh"]

#renamed file to Dockerfile