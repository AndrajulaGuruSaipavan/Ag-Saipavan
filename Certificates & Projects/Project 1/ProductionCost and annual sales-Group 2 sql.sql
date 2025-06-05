-- Calculate Production cost
SELECT 
    ProductKey, 
    OrderQuantity, 
    UnitPrice, 
    (UnitPrice * OrderQuantity) AS ProductionCost
FROM Sales;

-- Year wise Sales
SELECT 
    YEAR(OrderDate) AS Year, 
    SUM(UnitPrice * OrderQuantity) AS TotalSales
FROM Sales
GROUP BY YEAR(OrderDate)
ORDER BY Year;

-- Month wise Sales
SELECT 
    YEAR(OrderDate) AS Year, 
    MONTH(OrderDate) AS MonthNumber, 
    MONTHNAME(OrderDate) AS Month, 
    SUM(UnitPrice * OrderQuantity) AS TotalSales
FROM Sales
GROUP BY YEAR(OrderDate), MONTH(OrderDate), MONTHNAME(OrderDate)
ORDER BY Year, MonthNumber;

-- YoY Growth Sales
WITH YearlySales AS (
    SELECT 
        YEAR(OrderDate) AS Year, 
        SUM(UnitPrice * OrderQuantity) AS TotalSales
    FROM Sales
    GROUP BY YEAR(OrderDate)
)
SELECT 
    y1.Year, 
    y1.TotalSales, 
    y2.TotalSales AS LastYearSales,
    ROUND(((y1.TotalSales - y2.TotalSales) / y2.TotalSales) * 100, 2) AS YoY_Growth_Percentage
FROM YearlySales y1
LEFT JOIN YearlySales y2 ON y1.Year = y2.Year + 1
ORDER BY y1.Year;




