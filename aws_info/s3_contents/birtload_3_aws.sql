/* run inside */
/* psql --host=dhenton-postgres.csptohoxpe5z.us-east-2.rds.
amazonaws.com --port=5432 --username=mainuser --password --dbname=jdatabase -f birtload_2_aws.sql */
alter sequence customers_customernumber\q_seq restart 700;
alter sequence employees_employeenumber_seq restart 2000;



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


GRANT ALL PRIVILEGES ON TABLE productlines to test;


/* clean up keys */


alter table offices alter column officecode type CHAR(10);
alter table employees alter column officecode type CHAR(10);

/* with the jpa I'm using cannot have composite keys */

alter table orderDetails drop constraint orderdetails_pkey;
-- alter table orderDetails drop column pid;
alter table orderDetails add column pId SERIAL PRIMARY KEY;