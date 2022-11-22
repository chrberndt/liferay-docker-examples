# Oracle Setup For Liferay

## Download Oracle binaries and create a local oracle image

see: https://github.com/oracle/docker-images/blob/main/OracleDatabase/SingleInstance/README.md

## Create Pluggable Database (PDP) for Liferay

1. use environment variable `ORACLE_PDB: "lportal'` when starting the oracle container - this will create a PDB named `lportal` and the corresponding configuration entries (e.g. in `$ORACLE_BASE/oradata/dbconfig/$ORACLE_SID/tnsnames.ora`)

1. create a  

## (optional) Import existing data 

1. Copy your `.dmp` file to the container: `docker cp my.dmp oracle:/tmp/`
1. Create an export-import directory for PDBs in your container (the default data pump directory can't be used for PDBs): `$ORACLE_BASE/export_import` 
1. Create a directory object
	```
	CREATE DIRECTORY EXPORT_IMPORT AS '/opt/oracle/export_import';
	```
1. Create a tablespace and datafile for the database to be imported: 
	``` 
	TODO: connect to sqlplus as?
	SQL> create tablespace liferay_restore datafile 'liferay_restore.dbf' size 2g autoextend on;
	```


