# Use an official MySQL image as a parent image
FROM mysql/mysql-server:8.0.22-1.1.18
#FROM mysql:5.7.29
#FROM mysql:5.7

# Copy custom configuration
COPY ./my.cnf /etc/mysql/my.cnf

# Copy DDL script
COPY ./create-lportal.sql /docker-entrypoint-initdb.d/create-lportal.sql
