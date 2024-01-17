# Use Alpine Linux as the base image
FROM alpine:latest

# Install dependencies
RUN apk update && \
    apk upgrade && \
    apk add --no-cache curl

# Download and install Portainer
RUN wget https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-arm64.tar.gz -O /tmp/portainer.tar.gz \
    && tar -xzf /tmp/portainer.tar.gz -C /tmp/ \
    && mv /tmp/portainer /usr/local/bin/

# Expose the Portainer port
EXPOSE 9000

# Command to run Portainer
CMD ["/usr/local/bin/portainer/portainer"]
