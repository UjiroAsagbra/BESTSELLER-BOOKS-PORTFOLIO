SELECT *
FROM ['bestsellers with categories$']

--TO GET AVERAGE PRICE OF BESTSELLER BOOKS
SELECT AVG(price) [AVERAGE PRICE]
FROM ['bestsellers with categories$']

--TOP 5 AUTHOR WITH THE MOST BESTSELLING BOOKS
SELECT DISTINCT TOP 5 author, COUNT(name) AS [Number of bestsellers]
FROM ['bestsellers with categories$']
GROUP BY Author
ORDER BY [Number of bestsellers] DESC

--AMOUNT SOLD BY EACH BESTSELLING AUTHOR
SELECT  DISTINCT TOP 5 author, COUNT(name) AS [Number of bestsellers], SUM(price) AS [AMOUNT SOLD]
FROM ['bestsellers with categories$']
GROUP BY author
ORDER BY [Number of bestsellers] DESC

--PERCENTAGE OF FICTION AND NON-FICTION

SELECT bestSellerCategories.Genre, COUNT(bestSellerCategories.Genre) AS TotalCountofGenre,
	((COUNT(bestSellerCategories.Genre) * 1.0) /
	(
		SELECT COUNT(Genre) * 1.0
		FROM ['bestsellers with categories$']
	)) * 100 AS Percentage
FROM ['bestsellers with categories$'] bestSellerCategories
GROUP BY bestSellerCategories.Genre


--TOP 10 BOOKS WITH THE MOST REVIEWS
SELECT DISTINCT TOP 5 name, sum(Reviews) AS [Top Reviews]
FROM ['bestsellers with categories$']
GROUP BY name
ORDER BY [Top Reviews] DESC

--TOTAL AMOUNT MADE PER YEAR FROM SALES
SELECT Year, SUM(price) AS [AMOUNT SOLD]
FROM ['bestsellers with categories$']
GROUP BY Year