/* List the total (unitprice * quantity) as “Total Value” by
 orderid for the top 5 orders.  (That is, the five orders with
  the highest Total Value.)  */

SELECT orderid, SUM(unitprice * quantity) AS "Total Value"
    FROM orderdetails
    GROUP BY orderid
ORDER BY 2 DESC LIMIT 5;
-- How many products does Northwinds have in inventory?  

SELECT COUNT(productid)
    FROM products
    WHERE unitsinstock > 0;

-- How many products are out of stock? 

SELECT COUNT(productid)
    FROM products
    WHERE unitsinstock = 0;

-- From which supplier(s) does Northwinds carry the fewest products? 

SELECT supplierid, COUNT(DISTINCT productid)
    FROM products
    GROUP BY supplierid
ORDER BY 2;

-- Which Northwinds employees (just show their employeeid) had over 100 orders ? 

SELECT employeeid, COUNT(orderid) AS "Orders"
    FROM orders
    GROUP BY employeeid
        HAVING COUNT(orderid) > 100
ORDER BY 2 DESC;
