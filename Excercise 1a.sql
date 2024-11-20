-- Create a list of product costs grouped by invoice numbers that have a total product cost per invoice number greater than 2,000

SELECT
    SalesOrderNumber AS InvoiceNumber,
    SUM(ProductStandardCost) AS TotalProductCost

FROM FactInternetSales

GROUP BY SalesOrderNumber

HAVING SUM(ProductStandardCost) > 2000

ORDER BY TotalProductCost DESC