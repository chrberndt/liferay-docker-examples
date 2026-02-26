# Use an official MySQL image as a parent image
FROM mysql:8.4.8-oraclelinux9

# Copy custom configuration
COPY ./my.cnf /etc/mysql/my.cnf

# Copy DDL script
COPY ./create-lportal.sql /docker-entrypoint-initdb.d/create-lportal.sql
