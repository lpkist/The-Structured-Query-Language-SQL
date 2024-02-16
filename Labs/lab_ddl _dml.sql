/* Create an “items” table with the following schema: 


items itemIDintegerprimary key, 
itemcode, varchar(5)null,
itemnamevarchar(40) not null default “ “,
quantity integernot null default 0,
price decimal (9,2)not null default 0
*/

DROP TABLE IF EXISTS items;

CREATE TABLE items
    (
    itemid      INT             PRIMARY KEY,
    itemcode    VARCHAR(5)      NULL,
    itemname    VARCHAR(40)     NOT NULL DEFAULT ' ',
    quantity    INT             NOT NULL DEFAULT 6,
    price       DECIMAL(9, 2)   NOT NULL DEFAULT 0
);

/* Populate your new table with data from the Products table
Consisting of productid, 
              concat(supplierid, categoryid,discontinued),
              productname, unitsinstock, unitprice
*/
INSERT INTO items
    (SELECT productid,
            concat(supplierid, categorid, discontinued) ,
            productname, unitsinstock, unitprice
        FROM products
    );

-- Verify that your table was created and populated successfully

SELECT * FROM items;

--Check to make sure that your ‘items’ table from Lab 8 is available and full of data

Select * from items;

-- Change the name of the ‘items’ table to ‘demo’  

ALTER TABLE items
	RENAME TO "demo";

-- Change the name of the ‘itemcode’ column to ‘itemclass’  

ALTER TABLE demo
	RENAME COLUMN "itemcode" TO "itemclass";

-- Add a new column ‘iteminfo’ to your ‘demo’ table  

ALTER TABLE demo
	ADD COLUMN "iteminfo" VARCHAR(5) NULL;

-- Add some data to your new column, copying the values from the itemclass column

UPDATE demo
	SET "iteminfo" = "itemclass";	

-- Take another look at your ALTERed table 

SELECT * FROM demo;

--Check to make sure that your ‘demo’ table from Lab 9 is available and full of data

SELECT * FROM demo;

/* Insert a new row of data into your "demo" table using format # 1 of the INSERT.  Include these values:

VALUES
    (101,'1234','Spicy Grillmate', 12, 1.99, '1234');
*/

INSERT INTO demo
    		(itemid, itemclass, itemname, quantity, price, iteminfo)
 	VALUES 
  		(101,'1234','Spicy Grillmate', 12, 1.99, '1234');

/* Insert a new row of data into your "demo" table using format # 2 of the INSERT.  Include these values:

VALUES
    (102,'6789','GlobalWarmer', 24, 42.99, '6789');
*/

INSERT INTO demo
    	  VALUES 
  		(102,'6789','GlobalWarmer', 24, 42.99, '6789');

-- Update the iteminfo column to ‘0000’ for rows where the itemid is greater than 100

UPDATE demo
    		SET "iteminfo" = '0000'
		WHERE itemid > 100;	

--Take another look at your updated table to make sure the updates took place as planned

SELECT * FROM demo;

-- Delete the rows you just added  to the “demo” table

DELETE FROM demo
		WHERE itemid > 100;

-- Drop the “demo” table  

DROP TABLE demo