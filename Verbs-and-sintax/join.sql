SELECT lastname, firstname, COUNT(orderid) AS "Order Total"
    FROM employees, orders
    WHERE employees.employeeid orders.employeeid
    GROUP BY lastname, firstname
ORDER BY 3 DESC;

SELECT employees.employeeid, lastname, firstname, COUNT(orderid) AS "Order Total" 
    FROM employees, orders
    WHERE employees.employeeid orders.employeeid
    GROUP BY employees.employeeid, lastname, firstname
ORDER BY 4 DESC;

SELECT lastname, firstname, COUNT(orderid) AS "Order Total"
    FROM employees E, orders 0
    WHERE E.employeeid 0.employeeid
    GROUP BY lastname, firstname
ORDER BY 3 DESC;

SELECT lastname, firstname, COUNT(orderid) AS "Order Total" 
    FROM employees E 
        JOIN orders O
            ON E.employeeid 0.employeeid
    GROUP BY lastname, firstname
ORDER BY 3 DESC;

SELECT lastname, firstname, SUM(unitprice * quantity) AS "Total Sales"
    FROM employees E
        JOIN orders O
            ON E.employeeid = O.enployeeid
            JOIN orderdetails D 
                ON O.orderid = D.orderid
    GROUP BY lastname, firstname
ORDER BY 3 DESC LIMIT 5;

-- Cartesian product
SELECT lastname, firstname,
        TO CHAR(SUM(unitprice * quantity), '999,999,999.00') AS "Total sales"
    FROM employees E,
        orders O,
        orderdetails D
    WHERE E.employeeid = O.employeeid
    GROUP BY lastname, firstname; -— wrong

SELECT lastname, firstname,
        TO CHAR(SUM(unitprice * quantity), '999,999,999.00') AS "Total sales"
    FROM employees E,
        orders O,
        orderdetails D
    WHERE E.employeeid = O.employeeid
        AND O.orderid = D.orderid
    GROUP BY lastname, firstname; -- correct