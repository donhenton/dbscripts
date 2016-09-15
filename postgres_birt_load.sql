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

/*

Add the extra productlines table which is part of the diagram
but not the official BIRT release


*/

DROP TABLE IF EXISTS  productlines;


CREATE TABLE productlines(
  id SERIAL PRIMARY KEY,
  description CHAR(150) NOT NULL 
);


INSERT INTO productlines (description) VALUES ('Vintage Cars');
INSERT INTO productlines (description) VALUES ('Planes');
INSERT INTO productlines (description) VALUES ('Trains');
INSERT INTO productlines (description) VALUES ('Classic Cars');
INSERT INTO productlines (description) VALUES ('Motorcycles');
INSERT INTO productlines (description) VALUES ('Ships');
INSERT INTO productlines (description) VALUES ('Trucks and Buses');

alter table products add column productline_id int not null default -1;
update products set productline_id = productlines.id from productlines where productlines.description = products.productline;
alter table products drop column productline;

/* clean up keys */


alter table offices alter column officecode type CHAR(10);
alter table employees alter column officecode type CHAR(10);

/* with the jpa I'm using cannot have composite keys */

alter table orderDetails drop constraint orderdetails_pkey;
-- alter table orderDetails drop column pid;
alter table orderDetails add column pId SERIAL PRIMARY KEY;
