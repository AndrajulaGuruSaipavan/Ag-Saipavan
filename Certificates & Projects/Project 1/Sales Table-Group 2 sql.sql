-- Created Sales table using Factinternetsales and Factinternetsalesnew
CREATE TABLE Sales (
    ProductKey INT,
    OrderQuantity INT,
    UnitPrice DOUBLE,
    OrderDate DATE,
    DueDate DATE
);

SELECT * FROM salesdb.sales;
INSERT INTO Sales (ProductKey, OrderQuantity, UnitPrice, OrderDate, DueDate) 
SELECT 
    ProductKey, 
    OrderQuantity, 
    UnitPrice, 
    OrderDate, 
    DueDate 
FROM FactInternetSales 
UNION ALL 
SELECT 
    ProductKey, 
    OrderQuantity, 
    UnitPrice, 
    OrderDate, 
    DueDate 
FROM fact_internet_sales_new;



DESC FactInternetSales;
DESC fact_internet_sales_new;
