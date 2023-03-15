# Oracle Setup For Liferay

## Download Oracle binaries and create a local oracle image

see: https://github.com/oracle/docker-images/blob/main/OracleDatabase/SingleInstance/README.md

### Short Summary ###

Build the image:

```
git clone git@github.com:oracle/docker-images.git
cd docker-images/OracleDatabase/SingleInstance/dockerfiles
TODO: download LINUX.X64_193000_db_home.zip to 19.3.0 // or the version you're interested in
./buildContainerImage.sh -v 19.3.0 -t oracle-19.3.0 -s
```

Run the image:

```
 docker run -- oracle-19.3.0 -p 1521:1521 5500:5500 2484:2484 -e ORACLE_PDB=lportal -e ORACLE_PWD=secret
```

## Create Pluggable Database (PDP) for Liferay

1. use environment variable `ORACLE_PDB: "lportal'` when starting the oracle container - this will create a PDB named `lportal` and the corresponding configuration entries (e.g. in `$ORACLE_BASE/oradata/dbconfig/$ORACLE_SID/tnsnames.ora`)

1. create a 

## (optional) Import existing data

1. Copy your `.dmp` file to the container: `docker cp my.dmp oracle:/tmp/`
1. Create an export-import directory for PDBs in your container (the default data pump directory can't be used for PDBs): `$ORACLE_BASE/export_import`
1. On the container, login to `sqlplus` (as `system/<your-password>`)
1. Connect to your initially created PDB: `alter session set container=liferay_restore`
1. Create a user for the database to be restored:
	```bash
	SQL> create user liferay_restore identified by "secret";
	```
1. Create a directory object
	```bash
	TODO: connect to sqlplus as system / sysdba?
	SQL> CREATE DIRECTORY EXPORT_IMPORT AS '/opt/oracle/export_import';
	```
1. Create a tablespace and datafile for the database to be imported:
	```bash
	SQL> create tablespace liferay_restore datafile 'liferay_restore.dbf' size 2g autoextend on;
	```
1. Grant tablespace privileges:
	```bash
	SQL> grant unlimited tablespace to liferay_restore;
	```
1. Grant the session privilege to allow logins by liferay_restore;
	```bash
	SQL> grant session to liferay_restore;
	```
1. Allow liferay_restore the creation of tables:
	```bash
	SQL> grant create table to liferay_restore;
	```
1. Allow liferay_restore to read and write (log files) from / to the export_import directory:
	```bash
	SQL> grant read, write on directory export_import to liferay_restore;
	```
1. Import the data with `impdp`:
	```bash
	impdp liferay_restore/<your-password>@liferay_restore DUMPFILE=LIFERAY_RESTORE.dmp full=y directory=export_import
	```
1. Configure `liferay/portal-ext.properties` accordingly:
	```bash
	##
	  #
	  # Oracle
	  #
	  jdbc.default.driverClassName=oracle.jdbc.OracleDriver
	  jdbc.default.url=jdbc:oracle:thin:@oracle:1521/liferay_restore
	  jdbc.default.username=liferay_restore
	  jdbc.default.password=<your-password>
	```


