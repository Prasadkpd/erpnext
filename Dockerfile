# Use the Ubuntu 20.04 base image
FROM ubuntu:20.04

# Set non-interactive mode for debconf
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages without starting services
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        redis-server \
        nginx \
        mariadb-client \
        cron \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    rm get-docker.sh

# Your Dockerfile continues here with additional instructions

# Start Docker (for demonstration purposes only; not recommended in production)
CMD ["dockerd"]
