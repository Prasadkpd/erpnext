# Use the official Ubuntu Minimal image as the base image
Copy code
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
    
# Create a data container
RUN docker create -v /home/frappe/frappe-bench/sites/site1.local/ -v /var/lib/mysql --name erpdata davidgu/erpnext

# Run ERPNext
# CMD ["docker", "run", "-d", "-p", "80:80", "--name", "erpnext", "--volumes-from", "erpdata", "davidgu/erpnext"]
