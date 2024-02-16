SELECT COUNT(*) AS "Staff Size"
    FROM employees;

SELECT COUNT(DISTINCT country) AS "Countries" 
    FROM customers;

SELECT SUM(unitsinstock) AS "Inventory" 
    FROM products;

SELECT MAX(unitprice) AS "High Price" 
    FROM products;

SELECT MIN (unitprice) AS "Low Price"  
    FROM products;

SELECT AVG(unitprice) AS "Average Price" 
    FROM products;

SELECT TO_CHAR(AVG(unitprice), '999,999.00') AS "Average Price" 
    FROM products;

SELECT COUNT(*) AS "Staff Size" 
    FROM employees;

SELECT COUNT(employeeid) AS "Staff Size" 
    FROM employees;
