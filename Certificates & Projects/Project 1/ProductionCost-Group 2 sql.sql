-- Calculate Production cost
SELECT 
    ProductKey, 
    OrderQuantity, 
    UnitPrice, 
    (UnitPrice * OrderQuantity) AS ProductionCost
FROM Sales;



