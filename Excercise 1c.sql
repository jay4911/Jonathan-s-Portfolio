-- Write a query to return the sales territory column from the FactInternetSales table and return a unique list of territories only.

SELECT
    DISTINCT SalesTerritoryKey

FROM FactInternetSales

ORDER BY SalesTerritoryKey

