/*write a query against the customer dimension table that returns all customers that are homeowners and that have more than one car
Include full customer names, number of cars owned, and email.
Group the number of cars owned, and you should categorize them into 2-3 and 4+
*/

SELECT
    CONCAT(FirstName,' ', LastName) AS FullName,
    EmailAddress
    NumberCarsOwned,
    CASE
        WHEN NumberCarsOwned IN(2,3) THEN '2-3'
        WHEN NumberCarsOwned >= 4 THEN '4+'
        ELSE 'UNKN'
        END AS NumberCarsOwnedCategory

FROM DimCustomer

WHERE HouseOwnerFlag = 1 
    AND NumberCarsOwned > 1