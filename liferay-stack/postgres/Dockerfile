# Use an official PostgreSQL image as parent image
FROM postgres:17.6-bookworm

# Copy create database script
COPY ./create-lportal.sh /docker-entrypoint-initdb.d/create-lportal.sh
