/* Return the sum of Actuals
Transactions only from January 2011, Southwest Division, expenditures
Retuen Organization, Account Type, and Account Name
Group by Organization and account
*/

SELECT
    do.OrganizationName AS Organization,
    da.AccountType AS AccountType,
    da.AccountDescription AS Account,
    SUM(ff.Amount) AS Amt

FROM FactFinance AS ff
    INNER JOIN DimScenario AS ds
    ON ff.ScenarioKey = ds.ScenarioKey
    INNER JOIN DimOrganization AS do
    ON ff.OrganizationKey = do.OrganizationKey
    INNER JOIN DimAccount AS da
    ON ff.AccountKey = da.AccountKey
    INNER JOIN DimDate AS dd
    ON ff.DateKey = dd.DateKey

WHERE dd.EnglishMonthName = N'January'
    AND dd.CalendarYear = 2011
    AND do.OrganizationName = N'Southwest Division' 
    AND da.AccountType = N'Expenditures' 
    AND ds.ScenarioName = N'Actual'

GROUP BY do.OrganizationName,da.AccountType,da.AccountDescription

ORDER BY Amt DESC