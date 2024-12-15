# Use the official Valheim server image from GitHub Container Registry
FROM ghcr.io/lloesche/valheim-server:latest

# Set environment variables for the server
ENV SERVER_NAME="CarefValhalla"
ENV SERVER_PORT=2456
ENV WORLD_NAME="Perfection"
ENV SERVER_PASS="secret"
ENV SERVER_PUBLIC=true

# Expose necessary ports (UDP 2456-2458 for Valheim, TCP 9001 for web interface)
EXPOSE 2456-2458/udp
EXPOSE 9001/tcp

# Create necessary directories for configuration and data if they don't exist
RUN mkdir -p /config /opt/valheim

# Define volume mounts for configuration and data persistence
VOLUME ["/config", "/opt/valheim"]


# Command to directly run the server
CMD cd /opt/valheim && \
    ./valheim_server.x86_64 \
    -name "$SERVER_NAME" \
    -port "$SERVER_PORT" \
    -world "$WORLD_NAME" \
    -password "$SERVER_PASS" \
    -public "$SERVER_PUBLIC"