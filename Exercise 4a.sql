/*-Return top 5 selling subcategories by Sales Amount
Only Internet sales (website)
Country is United States only and USD currency
*/

SELECT TOP(5)
     dps.EnglishProductSubcategoryName AS SubCategory,
     SUM(fs.SalesAmount) AS SalesAmount

FROM FactInternetSales AS fs

INNER JOIN DimProduct AS dp
    ON fs.ProductKey = dp.ProductKey
INNER JOIN DimProductSubcategory AS dps
    ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
INNER JOIN DimCurrency AS dc
    ON fs.CurrencyKey = dc.CurrencyKey
INNER JOIN DimSalesTerritory AS dst
    ON fs.SalesTerritoryKey = dst.SalesTerritoryKey


WHERE dc.CurrencyAlternateKey = 'USD'
    AND dst.SalesTerritoryCountry = 'United States'


GROUP BY dps.EnglishProductSubcategoryName

ORDER BY SalesAmount DESC