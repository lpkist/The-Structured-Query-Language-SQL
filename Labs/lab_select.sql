/* List all the products in the Northwinds database showing productid, productname,
 quantity per unit, unitprice, and unitsinstock. */

SELECT productid, productname, quantityperunit, unitprice,
        unitsinstock
    FROM products;

/* For all employees at Northwinds, list the first name and last name concatenated 
together with a blank space in-between, and the YEAR when they were hired.  */

SELECT firstname || ' ' || lastname AS "Full Name",
        hiredate,
        DATE_PART('year', hiredate) AS "Hire Year"
FROM employees;

/* For all products in the Northwinds database, list the productname, unitprice, 
unitsinstock,  and the total value of the inventory of that product as “Total Value”.
  (HINT:  total value = unitsinstock * unitprice.) */

SELECT productnane, unitprice, unitsinstock,
        (unitsinstock + unitprice) AS "Total Value"
    FROM products;

/* For all employees at Northwinds, list the first name and last name concatenated
 together with a blank space in-between with a column header “Name”, and the name
  of the month (spelled out) for each employee’s birthday.  */

SELECT CONCAT(Firstname, ' ', lastname) AS "Name",
        birthdate,
        TO_CHAR(birthdate, 'month') AS "Birth Month"
FROM employees