create database sql_capstone_project;

CREATE TABLE amazon (
Invoice ID VARCHAR(30) NOT NULL,
Branch VARCHAR(5) NOT NULL,
City VARCHAR(30) NOT NULL,
Customer type VARCHAR NOT NULL,
Gender VARCHAR(10) NOT NULL,
Product line VARCHAR(100) NOT NULL,
Unit price FLOAT(10,2) NOT NULL,
Quantity INT NOT NULL,
Tax 5% FLOAT(6,4) NOT NULL,
Total FLOAT(10,2) NOT NULL,
Date Date NOT NULL,
Time Time NOT NULL,
Payment VARCHAR(20) NOT NULL,
cogs FLOAT(10,2) NOT NULL,
gross margin percentage FLOAT(11,9),
gross income FLOAT(10,2) NOT NULL,
Rating FLOAT(2,1)
);

use sql_capstone_project;
    
---------------------------------------------------------

-- To select all columns in the table

SELECT *
FROM amazon;

-- Check for null values in all columns

SELECT *
FROM amazon
WHERE 1=0;
-- This condition ensures that no rows are returned, but the structure of the table is preserved for inspection.

---------------------------------------------------------

-- TO add new column timeofday

ALTER TABLE amazon
ADD COLUMN timeofday VARCHAR(20);

UPDATE amazon
SET timeofday = 
    CASE 
        WHEN HOUR(time) >= 0 AND HOUR(time) < 6 THEN 'Night'
        WHEN HOUR(time) >= 6 AND HOUR(time) < 12 THEN 'Morning'
        WHEN HOUR(time) >= 12 AND HOUR(time) < 18 THEN 'Afternoon'
        ELSE 'Evening'
    END;

-- To add new column dayname

ALTER TABLE amazon
ADD COLUMN dayname VARCHAR(20);

UPDATE amazon
SET dayname = DAYNAME(date);

-- To add new column monthname

ALTER TABLE amazon
ADD COLUMN monthname VARCHAR(20);

UPDATE amazon
SET monthname = DATE_FORMAT(date, '%b');

----------------------------------------------------------

-- 1. What is the count of distinct cities in the dataset?

SELECT COUNT(DISTINCT City) AS City_count
FROM amazon;

---------------------------------------------------------

-- 2. For each branch, what is the corresponding city?

SELECT DISTINCT Branch, City
FROM amazon;

---------------------------------------------------------

-- 3. What is the count of distinct product lines in the dataset?

SELECT `Product line`, COUNT(`Product line`) AS `Number of Orders`
FROM amazon
GROUP BY `Product line`;

---------------------------------------------------------

-- 4. Which payment method occurs most frequently?

SELECT Payment, COUNT(Payment) AS Frequency
FROM amazon
GROUP BY Payment
ORDER BY frequency DESC
LIMIT 1;

----------------------------------------------------------

-- 5. Which product line has the highest sales?

SELECT `Product line`, SUM(Total) AS `Total Sales`
FROM amazon
GROUP BY `Product line`
ORDER BY `Total Sales` DESC
LIMIT 1;

-----------------------------------------------------------

-- 6. How much revenue is generated each month?

SELECT YEAR(Date) AS `Year`, MONTH(Date) AS `Month`, SUM(Total) AS `Monthly Revenue`
FROM amazon
GROUP BY `Month`, `Year`
ORDER BY `Month`;

------------------------------------------------------------

-- 7. In which month did the cost of goods sold reach its peak?

SELECT MONTHNAME(Date) AS `Month`, SUM(cogs) as `Cost of Goods Sold`
FROM amazon
GROUP BY `Month`
ORDER BY `Cost of Goods Sold` DESC
LIMIT 1;

-------------------------------------------------------------

-- 8. Which product line generated the highest revenue?

SELECT `Product line`, SUM(Total) AS `Total Revenue`
FROM `amazon`
GROUP BY `Product line`
ORDER BY `Total Revenue` DESC
LIMIT 1;

-------------------------------------------------------------

-- 9. In which city was the highest revenue recorded?

SELECT City, SUM(Total) AS `Total Revenue`
FROM amazon
GROUP BY City
ORDER BY `Total Revenue` DESC
LIMIT 1;

-------------------------------------------------------------

-- 10. Which product line incurred the highest Value Added Tax?

SELECT `Product line`, SUM(`Tax 5%`) AS `Highest Value Added Tax`
FROM AMAZON
GROUP BY `Product line`
ORDER BY `Highest Value Added Tax` DESC
LIMIT 1;

--------------------------------------------------------------

-- 11. For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."

SELECT `Product line`, SUM(Total) AS Sales,
CASE
WHEN SUM(Total) < (SELECT AVG(Total) FROM amazon) THEN 'Bad'
ELSE 'Good'
END AS `Sales Category`
FROM amazon
GROUP BY `Product line`;

--------------------------------------------------------------

-- 12. Identify the branch that exceeded the average number of products sold.

SELECT Branch, SUM(Quantity) AS `Total Products Sold`
FROM amazon
GROUP BY Branch
HAVING SUM(Quantity) > (SELECT AVG(`Total Products Sold`)
FROM (SELECT Branch, SUM(Quantity) AS `Total Products Sold`
FROM amazon GROUP BY Branch) AS `Average Products Sold`)

--------------------------------------------------------------

-- 13. Which product line is most frequently associated with each gender?

WITH cte_most_frequent AS (
    SELECT `Product line`, Gender, COUNT(*) AS Frequency,
	ROW_NUMBER() OVER (PARTITION BY Gender ORDER BY COUNT(*) DESC) AS rn
    FROM amazon
    GROUP BY `Product line`, Gender
)

SELECT `Product line`, Gender, Frequency
FROM cte_most_frequent
WHERE rn = 1;

-------------------------------------------------------------

-- 14. Calculate the average rating for each product line.
SELECT `Product line`, ROUND(AVG(rating), 3) AS `Average Rating`
FROM amazon
GROUP BY `Product line`;

-------------------------------------------------------------

-- 15. Count the sales occurrences for each time of day on every weekday.

SELECT timeofday, dayname, COUNT(*) as `Sales Occurance`
FROM amazon
WHERE dayname NOT IN ('Saturday', 'Sunday')
GROUP BY timeofday, dayname
ORDER BY `Sales Occurance` DESC;

--------------------------------------------------------------

-- 16. Identify the customer type contributing the highest revenue.

SELECT `Customer type`, ROUND(SUM(Total), 3) AS Revenue
FROM amazon
GROUP BY `Customer type`
ORDER BY Revenue DESC
LIMIT 1;

--------------------------------------------------------------

-- 17. Determine the city with the highest VAT percentage.

SELECT City, MAX(`Tax 5%`) AS `Highest VAT`
FROM amazon
GROUP BY City
ORDER BY `Highest VAT` DESC
LIMIT 1;

--------------------------------------------------------------

-- 18. Identify the customer type with the highest VAT payments.

SELECT `Customer type`, ROUND(SUM(`Tax 5%`), 3) AS `Highest VAT Payment`
FROM amazon
GROUP BY `Customer type`
ORDER BY `Highest VAT Payment` DESC
LIMIT 1;

---------------------------------------------------------------

-- 19. What is the count of distinct customer types in the dataset?

SELECT COUNT(DISTINCT(`Customer type`)) AS `Types Of Customer`
FROM amazon;

---------------------------------------------------------------

-- 20. What is the count of distinct payment methods in the dataset?

SELECT COUNT(DISTINCT(`Payment`)) AS `Types Of Payment Methods`
FROM amazon;

----------------------------------------------------------------

-- 21. Which customer type occurs most frequently?

SELECT `Customer type` AS `Max. Type of Customers`
FROM amazon
GROUP BY `Customer type`
ORDER BY COUNT(*) DESC
LIMIT 1;

----------------------------------------------------------------

-- 22. Identify the customer type with the highest purchase frequency.

SELECT `Customer type`, COUNT(*) AS `Highest Purchase Frequency`
FROM amazon
GROUP BY `Customer type`
ORDER BY `Highest Purchase Frequency` DESC
LIMIT 1;

----------------------------------------------------------------

-- 23. Determine the predominant gender among customers.

SELECT Gender, COUNT(*) AS `Number of Customers`
FROM amazon
GROUP BY Gender
ORDER BY `Number of Customers` DESC
LIMIT 1;

----------------------------------------------------------------

-- 24. Examine the distribution of genders within each branch.

SELECT Branch, Gender, COUNT(*) AS `Number of Customers`
FROM amazon
GROUP BY Branch, Gender
ORDER BY `Number of Customers` DESC;

----------------------------------------------------------------

-- 25. Identify the time of day when customers provide the most ratings.

SELECT timeofday, COUNT(Rating) AS `Most Rating`
FROM amazon
GROUP BY timeofday
ORDER BY `Most Rating` DESC
LIMIT 1;

----------------------------------------------------------------

-- 26. Determine the time of day with the highest customer ratings for each branch.

SELECT Branch, MAX(Rating) AS Max_Rating, timeofday
FROM amazon
GROUP BY Branch, timeofday
ORDER BY Max_Rating DESC
LIMIT 5;

-----------------------------------------------------------------

-- 27. Identify the day of the week with the highest average ratings.

SELECT dayname, ROUND(AVG(Rating), 3) AS `Highest Average Rating`
FROM amazon
GROUP BY dayname
ORDER BY `Highest Average Rating` DESC
LIMIT 1;

------------------------------------------------------------------

-- 28. Determine the day of the week with the highest average ratings for each branch.

SELECT Branch, DayOfWeek, AvgRating
FROM (SELECT Branch, DAYNAME(Date) AS DayOfWeek, ROUND(AVG(Rating), 3) AS AvgRating,
ROW_NUMBER() OVER (PARTITION BY Branch ORDER BY AVG(Rating) DESC) AS rn
FROM amazon
GROUP BY Branch, DayOfWeek) AS ranked
WHERE rn = 1;