To load to heroku

* have a clean db on heroku
* locate resource name via the heroku interface eg (https://postgres.heroku.com/databases/donhenton-spring-boot-database)
* run the following command locally
```
  heroku pg:push $DATABASE_URL <resource name> --app <heroku app name>
```

$DATABASE_URL is a system variable which is the full url to the local database
```
postgres://test:test@localhost:5433/jdatabase
```
