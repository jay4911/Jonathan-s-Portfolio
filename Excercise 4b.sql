/*Return a list of all current Sales Representatives or Sales Managers in Europeam territory
Group by each person, title and currency
Include Full name, Employee title, curreny, and total sales
*/

SELECT
    CONCAT(de.FirstName, ' ', de.LastName) AS EmployeeName,
    de.Title AS EmployeeTitle,
    dc.CurrencyName As Currency,
    SUM(fs.SalesAmount) AS TotalSalesAmount

FROM FactResellerSales AS fs

INNER JOIN DimCurrency AS dc
    ON fs.CurrencyKey = dc.CurrencyKey
INNER JOIN DimSalesTerritory AS dst
    ON fs.SalesTerritoryKey = dst.SalesTerritoryKey
INNER JOIN DimEmployee AS de
    ON fs.EmployeeKey = de.EmployeeKey

WHERE dst.SalesTerritoryGroup = N'Europe'
    AND de.[Status] = N'Current'

GROUP BY de.FirstName, de.LastName, de.Title,dc.CurrencyName

ORDER BY EmployeeName, TotalSalesAmount DESC 