# Use the official Ubuntu Minimal image as the base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install required packages without starting services
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        redis-server \
        nginx \
        mariadb-client \
        cron && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a data container
# RUN docker create -v /home/frappe/frappe-bench/sites/site1.local/ -v /var/lib/mysql --name erpdata davidgu/erpnext

# Run ERPNext
# CMD ["docker", "run", "-d", "-p", "80:80", "--name", "erpnext", "--volumes-from", "erpdata", "davidgu/erpnext"]
