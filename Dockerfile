# Use an official Debian Wheezy base image
FROM debian:wheezy

# Install required packages
RUN apt-get update && apt-get install -y \
    redis-server \
    nginx \
    mariadb-client \
    cron

# Create a data container
RUN docker create -v /home/frappe/frappe-bench/sites/site1.local/ -v /var/lib/mysql --name erpdata davidgu/erpnext

# Run ERPNext
CMD ["docker", "run", "-d", "-p", "80:80", "--name", "erpnext", "--volumes-from", "erpdata", "davidgu/erpnext"]
