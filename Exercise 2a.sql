/*Write a query against the FactInternet Sales table that returns orders placed in December only for Sales Territory 1. 
 Include SalesOrderNumber, SalesOrderLineNumber, SalesAmount and TaxAmount
 */

SELECT
    SalesOrderNumber,
    SalesOrderLineNumber,
    SalesAmount,
    TaxAmt

FROM FactInternetSales

WHERE MONTH(OrderDate) = 12 
    AND SalesTerritoryKey = 1