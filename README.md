#DB SCRIPTS

Various database scripts used for demonstration programming

## Zip File postgres_tar_files

Restoring the tar files is done in the following way:

## Restore from tar files

* create the database from the tar file name (northwind.tar -> 'northwind')
* ```CREATE DATABASE dbname OWNER <rolename>;``` (used user 'test' in this case)
* ```pg_restore -d northwind -U test -h localhost -C northwind.tar```
