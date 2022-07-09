/*
Q. Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*\

SELECT CO.CONTINENT, FLOOR(AVG(CI.POPULATION))
FROM COUNTRY AS CO, CITY AS CI
WHERE CO.CODE = CI.COUNTRYCODE
GROUP BY CO.CONTINENT;
