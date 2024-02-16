DROP TABLE IF EXISTS shippers;

CREATE TABLE shippers
(
    shipperid   INT NOT NULL,
    companynane VARCHAR(40) NOT NULL ,
    phone       VARCHAR(20) NOT NULL DEFAULT '0'
);

SELECT * FROM shippers;

INSERT INTO shippers VALUES
    (1, 'Speedy Express', '(503) 555-9831');
INSERT INTO shippers VALUES
    (2, 'United Package', '(503) 555-3199');
INSERT INTO shippers VALUES
    (3, 'Federal Shipping');

SELECT * FROM shippers;

CREATE TABLE items
(
    itemid      INT             NOT NULL PRIMARY KEY,
    itemcode    VARCHAR(S)      UNIQUE,
    itemame     VARCHAR(4O)     NOT NULL DEFAULT * +,
    quantity    INT             NOT NULL DEFAULT 0,
    price       DECIMAL(9, 2)   CHECK (price < 1000)
);

DROP TABLE items:

CREATE TABLE items
( 
    itemid      INT             NOT NULL,
    supplierid  INT             NOT NULL,
    itemcode    VARCHAR(5)      UNIQUE,
    itemame     VARCHAR(40)     NOT NULL DEFAULT ' ',
    quantity    INT             NOT NULL DEFAULT 0,
    price       DECIMAL(9, 2)   CHECK (price < 1000),
    PRIMARY KEY (itemid, supplierid)
);

DROP TABLE IF EXISTS items;

CREATE TABLE items
(
    itemid      INT             NOT NULL,
    supplierid  INT             NOT NULL,
    itemname    VARCHAR(40)     NOT NULL DEFAULT ' ',
    quantity    INT             NOT NULL DEFAULT 0,
    price       DECIMAL(9, 2)   CHECK (price < 1000),
    itemcode    CHAR(4),
    PRIMARY KEY (itemid),
    CONSTRAINT fk supplier FOREIGN KEY(supplierid)
        REFERENCES suppliers(supplierid)
        ON DELETE NO ACTION
);

INSERT INTO items
(
SELECT productid, supplierid, productnane, unitsinstock,
        unitprice
    FROM products    
);

ALTER TABLE items
    RENAME TO "alters";

ALTER TABLE alters
    RENAME COLUMN "itemame" TO "itemdescription"

ALTER TABLE alters
    ADD COLUMN "itemunit" VARCHAR(5) NULL;

UPDATE alters
    SET "itemcode" = 22
    WHERE price < 20;

SELECT itemid, itemdescription, itemcode
    FROM alters;

ALTER TABLE alters
    DROP COLUMN "itemcoder;