/* Create a "TopCustomers" view  using the following SELECT statement to populate the view. 

SELECT companyname, sum(unitprice * quantity) as "Total Sales"
fromcustomers CJOIN
    orders O ONC.customerid  =  O.customerid JOIN
          orderdetails D ON O.orderid  =  D.orderid
GROUP BY companyname 
Order By 2 desc LIMIT5;
*/

CREATE VIEW topcustomers AS
     SELECT companyname, SUM(unitprice * quantity) as "Total Sales"
          FROM customers C 
               JOIN orders O ON
                    C.customerid  =  O.customerid 
               JOIN orderdetails D ON
                    O.orderid  =  D.orderid
          GROUP BY companyname 
     ORDER BY 2 DESC LIMIT 5;

--Run a Query Against Your View to ensure that it works

SELECT * FROM topcustomers;

-- Check to make sure that your view from Lab 11 is available and ready to use.  

SELECT * FROM topcustomers;

/* Let’s drop and recreate your view from Lab 11, adding a CASE expression.
  Add a third column to your view called “Assessment”.

    - Set the Assessment column equal to “Needs Focus” if the customer’s total
         sales is less than $60,000

    - Set the Assessment column equal to “Average” if the customer’s total sales
         is greater than or equal to $60,000 but less than $115,000.

    - Otherwise set the Assessment column equal to “Outstanding” if the customer’s
        total sales is greater than or equal to $115,000.
*/

DROP VIEW topcustomers

CREATE VIEW topcustomers AS
     SELECT companyname, SUM(unitprice * quantity) AS "Total Sales",
          CASE  
               WHEN SUM(unitprice * quantity) < 60000 THEN 'NeedsFocus'
               WHEN SUM(unitprice * quantity) < 110000 THEN 'Average'
               ELSE 'Outstanding'
          END  "Assessment"
          FROM customers C 
               JOIN orders O ON 
                    C.customerid  =  O.customerid 
               JOIN orderdetails D ON
                    O.orderid  =  D.orderid
          GROUP BY companyname 
     ORDER BY 2 DESC LIMIT 5;

-- Run a Query Against Your View to see the CASE results
SELECT * FROM topcustomers;