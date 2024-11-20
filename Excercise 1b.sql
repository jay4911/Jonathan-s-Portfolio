-- Write a query to return InvoiceNumber, InvoiceLineNumber, and SalesAmount from the FactInternetSales table. Then return only lines where the currency key is 100.

SELECT
    SalesOrderNumber AS InvoiceNumber,
    SalesOrderLineNumber AS InvoiceLineNumber,
    SalesAmount

FROM FactInternetSales

WHERE CurrencyKey = 100