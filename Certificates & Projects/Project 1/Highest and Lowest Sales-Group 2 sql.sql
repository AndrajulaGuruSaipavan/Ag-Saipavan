WITH YearlySales AS (
    SELECT 
        YEAR(OrderDate) AS Year, 
        SUM(UnitPrice * OrderQuantity) AS TotalSales
    FROM Sales
    GROUP BY YEAR(OrderDate)
)
SELECT 
    Year, 
    TotalSales, 
    CASE 
        WHEN TotalSales = (SELECT MAX(TotalSales) FROM YearlySales) THEN 'Highest' 
        WHEN TotalSales = (SELECT MIN(TotalSales) FROM YearlySales) THEN 'Lowest' 
    END AS SalesCategory
FROM YearlySales
WHERE TotalSales = (SELECT MAX(TotalSales) FROM YearlySales) 
   OR TotalSales = (SELECT MIN(TotalSales) FROM YearlySales);
