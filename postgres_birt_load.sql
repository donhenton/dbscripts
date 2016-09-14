/*
This is script uses the exact files from the birt download.
The location must be absolute, and this is run from psql client

*/


copy customers from '/Users/dhenton/Downloads/ClassicModels-MySQL/datafiles/Customers.txt' ( FORMAT csv,NULL('NULL'),ENCODING('Windows-1252') )  ;
alter sequence customers_customernumber_seq restart 700;
copy employees from '/Users/dhenton/Downloads/ClassicModels-MySQL/datafiles/Employees.txt' ( FORMAT csv,NULL('NULL'),ENCODING('Windows-1252') )  ;
alter sequence employees_employeenumber_seq restart 2000;
copy offices from '/Users/dhenton/Downloads/ClassicModels-MySQL/datafiles/Offices.txt' ( FORMAT csv,NULL('NULL'),ENCODING('Windows-1252') )  ;
copy orderdetails from '/Users/dhenton/Downloads/ClassicModels-MySQL/datafiles/OrderDetails.txt' ( FORMAT csv,NULL('NULL'),ENCODING('Windows-1252') )  ;
copy orders from '/Users/dhenton/Downloads/ClassicModels-MySQL/datafiles/Orders.txt' ( FORMAT csv,NULL('NULL'),ENCODING('Windows-1252') )  ;
copy payments from '/Users/dhenton/Downloads/ClassicModels-MySQL/datafiles/Payments.txt' ( FORMAT csv,NULL('NULL'),ENCODING('Windows-1252') )  ;
copy products from '/Users/dhenton/Downloads/ClassicModels-MySQL/datafiles/Products.txt' ( FORMAT csv,NULL('NULL'),ENCODING('Windows-1252') )  ;
