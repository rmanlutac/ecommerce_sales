CREATE TABLE sales_invoice (
    Id              INT             PRIMARY KEY,
    InvoiceNo       VARCHAR,
    StockCode       VARCHAR,
    Description     VARCHAR,
    Quantity        INT,
    InvoiceDate     DATETIME,
    UnitPrice       FLOAT,
    CustomerId      INT,
    Country         VARCHAR
);

CREATE SEQUENCE seq_sales_invoice_id START 1;

INSERT INTO sales_invoice (
    Id, InvoiceNo, StockCode, Description, Quantity, InvoiceDate,
    UnitPrice, CustomerId, Country
)
SELECT 
    nextval('seq_sales_invoice_id'), InvoiceNo, StockCode, Description, Quantity, InvoiceDate,
    UnitPrice, CustomerId, Country
FROM read_csv_auto('.\data\Dataset.csv');


CREATE TABLE country AS (
    SELECT *
    FROM read_csv_auto('.\data\country.csv')
);