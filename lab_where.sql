 /* List the customerid, companyname, and country for all customers 
 NOT in the U.S.A. */

SELECT customerid, companyname, country
   FROM customers
   WHERE country != 'USA';

/* For all products in the Northwinds database, list the productname,
 unitprice, unitsinstock,  and the total value of the inventory of 
 that product as “Total Value” for all products with a Total Value 
 greater than $1000.  (HINT:  total value = unitsinstock * unitprice) */

SELECT productname, unitprice, unitsinstock,
      (unitsinstock * unitprice) AS "Total Value"
   FROM products
   WHERE (unitsinstock * unitprice) > 1000;

/*List the productid, productname, and quantityperunit for all products
 that come in bottles. */

SELECT productid, productname, quantityperunit
   FROM products
   WHERE quantityperunit LIKE '%bottle%';

/* List the productid, productname, and unitprice for all products 
whose categoryid is an ODD number.
   (HINT:  categoryid is a one digit integer less than 9 …) */

SELECT productid, productname, unitprice
   FROM products
   WHERE categoryid IN (1,3,5,7);

/* List the orderid,  customerid, and shippeddate for orders that
 shipped to Canada  in December 1996 through the end of January 1997. */
SELECT orderid, customerid, shippeddate
   FROM orders
   WHERE shipcountry = 'Canada' AND
      shippeddate BETWEEN '1996-12-01' AND '1997-01-31';
