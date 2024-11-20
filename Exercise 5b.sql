/* Return Account Description, Amounts
Filter for Actuals only, Canadian Division, Calendar year 2013, and expenditure accounts
Calculate Percent of Total
*/

SELECT
    da.AccountDescription AS AccountDescription,
    SUM(ff.Amount) AS Amount,
    SUM(ff.Amount)/(SELECT 
                        SUM(ff.Amount) 
                    FROM FactFinance AS ff
                        INNER JOIN DimScenario AS ds
                        ON ff.ScenarioKey = ds.ScenarioKey
                        INNER JOIN DimOrganization AS do
                        ON ff.OrganizationKey = do.OrganizationKey
                        INNER JOIN DimAccount AS da
                        ON ff.AccountKey = da.AccountKey
                        INNER JOIN DimDate AS dd
                        ON ff.DateKey = dd.DateKey
                    WHERE ds.ScenarioName = N'Actual'
                        AND da.AccountType = N'Expenditures'
                        AND dd.CalendarYear = 2013
                        AND do.OrganizationName = N'Canadian Division') AS PctofTotal

FROM FactFinance AS ff
    INNER JOIN DimScenario AS ds
    ON ff.ScenarioKey = ds.ScenarioKey
    INNER JOIN DimOrganization AS do
    ON ff.OrganizationKey = do.OrganizationKey
    INNER JOIN DimAccount AS da
    ON ff.AccountKey = da.AccountKey
    INNER JOIN DimDate AS dd
    ON ff.DateKey = dd.DateKey

WHERE ds.ScenarioName = N'Actual'
    AND da.AccountType = N'Expenditures'
    AND dd.CalendarYear = 2013
    AND do.OrganizationName = N'Canadian Division'

GROUP BY da.AccountDescription

ORDER BY Amount DESC