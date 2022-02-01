# Use an openldap image from osixia as a parent image
FROM osixia/openldap

#
# Add users.ldif and groups.ldif to the file system of the image.
# Files located in the ldif/custom directory are loaded by default
# at startup, see: https://github.com/osixia/docker-openldap#seed-ldap-database-with-ldif
#
ADD groups.ldif /container/service/slapd/assets/config/bootstrap/ldif/custom/
ADD users.ldif /container/service/slapd/assets/config/bootstrap/ldif/custom/

