# Using on AWS

## Running commands

* commands should be run on an ec2 instance that has access to the rds instance.
* the RDS instance can be configured to only take traffic from the subnet
* you can ssh into the EC2s via the connection right click menu option off the instance

## Copying the files

* move the contents of s3_contents folder to an s3 bucket
* to copy the entire contents of the an s3 bucket:  

```bash
aws s3 sync <local> s3://<bucket.name>
aws s3 sync s3://<bucket.name> <local>
```

* ec2 instance will need readonly permissions on s3
* may need permissions on the ec2 box to connect to postgres instance?

## Sec Database

```bash
psql --host=dhenton-postgres.csptohoxpe5z.us-east-2.rds.amazonaws.com /
--port=5432 --username=mainuser --password --dbname=jdatabase -f loadsec.sql
```

## Birt Database

```bash
psql --host=dhenton-postgres.csptohoxpe5z.us-east-2.rds.amazonaws.com /
--port=5432 --username=mainuser --password --dbname=jdatabase -f birtload_2_aws.sql
```

then read the text files
run copy_data_2.sh on the ec2 machine see the comments in that file for more info
