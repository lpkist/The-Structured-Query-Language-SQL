DROP VIEW IF EXISTS topemployeesorders;

CREATE VIEW topemployeesorders AS
    SELECT lastname, firstnane,
        TO CHAR((SUM(unitprice * quantity)), '999,999,999.99') AS "Total Sales"
    FROM employees E
        JOIN orders O ON
            E.employeeid = O.employeeid
        JOIN orderdetails D ON
            O.orderid = D.orderid
    GROUP BY lastname, firstname
ORDER BY 3 DESC LIMIT 5;

SELECT * FROM topemployeesorders;

SELECT productid, productnane, unitprice,
        CASE
            WHEN unitprice < 20 THEN 'Economy'
            WHEN unitprice < 80 THEN 'Standart'
            ELSE 'Premium'
        END category -- name of the column
    FROM products;

SELECT categoryname, SUM(unitsinstock)
    FROM categories C
        JOIN products P ON
            C.categoryid = P.categoryid
    GROUP BY categoryname
UNION

SELECT 'Total', SUM(unitsinstock)
    FROM products
ORDER BY 2;

DROP TABLE IF EXISTS shoppers;

CREATE TABLE shoppers
(
    shopperid   INTEGER         NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    shoppername VARCHAR (40)    NOT NULL,
    phone       VARCHAR(20)     NOT NULL DEFAULT '0'
);

INSERT INTO shoppers (shoppername, phone)
    VALUES ('AlanParadise', '800-432-6543') ;

SELECT * FROM shoppers;

INSERT INTO shoppers (shoppername, phone)
    VALUES ('AlanParadise', '800-500-6543') ;

INSERT INTO shoppers (shoppername, phone)
VALUES ('AlanParadise', '800-500-2043') ;

DELETE FROM shoppers
WHERE phone = '800-500-6543';

SELECT * FROM shoppers

SELECT CURRVAL (pg_get_serial_sequence('shoppers', 'shopperid'));

ALTER TABLE shoppers
    ALTER COLUMN shopperid
    RESTART WITH 10;

SELECT CURRVAL (pg_get_serial_sequence('shoppers', 'shopperid'));

INSERT INTO shoppers (shoppername, phone)
    VALUES ('Lucas', '900-500-9844');

SELECT * FROM shoppers;