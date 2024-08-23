-- Create the database to load the client data
create database TMT_Steel_CL_db;
use TMT_Steel_CL_db;

-- View the data
SELECT * FROM steel_data;

-- Metadata/ info
desc steel_data;

-- 1st Moment Business Decision
-- Calculating the mean for the below columns

SELECT AVG(Quantity) AS MeanQuantity,
       AVG(Rate) AS MeanRate,
       AVG(Value) AS MeanValue
FROM steel_data;


-- Calculate the median for the specified columns using SUBSTRING_INDEX (MySQL)

SET @rowindex := -1;
 
SELECT
   AVG(Quantity) as Median 
FROM
   (SELECT @rowindex:=@rowindex + 1 AS rowindex,
           Quantity AS Quantity
    FROM steel_data
    ORDER BY Quantity) AS q
WHERE
q.rowindex IN (FLOOR(@rowindex / 2), CEIL(@rowindex / 2));

SET @rowindex := -1;
 
SELECT
   AVG(Rate) as Median 
FROM
   (SELECT @rowindex:=@rowindex + 1 AS rowindex,
           Rate AS Rate
    FROM steel_data
    ORDER BY Rate) AS r
WHERE
r.rowindex IN (FLOOR(@rowindex / 2), CEIL(@rowindex / 2));

SET @rowindex := -1;
 
SELECT
   AVG(Value) as Median 
FROM
   (SELECT @rowindex:=@rowindex + 1 AS rowindex,
           Value AS Value
    FROM steel_data
    ORDER BY Value) AS v
WHERE
v.rowindex IN (FLOOR(@rowindex / 2), CEIL(@rowindex / 2));

-- Calculate the mode for the specified columns

SELECT
    (SELECT Date
     FROM steel_data
     GROUP BY Date
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeDate,

    (SELECT FY
     FROM steel_data
     GROUP BY FY
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeFY,

    (SELECT Products
     FROM steel_data
     GROUP BY Products
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeProducts,

    (SELECT dia
     FROM steel_data
     GROUP BY dia
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeDia,

    (SELECT `dia group`
     FROM steel_data
     GROUP BY `dia group`
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeDiaGroup,

    (SELECT grade
     FROM steel_data
     GROUP BY grade
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeGrade,

    (SELECT type
     FROM steel_data
     GROUP BY type
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeType,

    (SELECT length
     FROM steel_data
     GROUP BY length
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeLength,

    (SELECT `Voucher Type`
     FROM steel_data
     GROUP BY `Voucher Type`
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeVoucherType,

    (SELECT Quantity
     FROM steel_data
     GROUP BY Quantity
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeQuantity,

    (SELECT Rate
     FROM steel_data
     GROUP BY Rate
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeRate,

    (SELECT Value
     FROM steel_data
     GROUP BY Value
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeValue;


-- 2nd Moment Business Decision

-- Calculating variance for the specififed columns.
SELECT
    VAR_POP(Quantity) AS VarianceQuantity,
    VAR_POP(Rate) AS VarianceRate,
    VAR_POP(Value) AS VarianceValue
FROM steel_data;

-- Calculating standard deviation for the specififed columns.
SELECT
    STDDEV_POP(Quantity) AS StdDevQuantity,
    STDDEV_POP(Rate) AS StdDevRate,
    STDDEV_POP(Value) AS StdDevValue
FROM steel_data;

-- Calculating range for the specififed columns.
SELECT
	MAX(Quantity) - MIN(Quantity) AS RangeQuantity,
    MAX(Rate) - MIN(Length) AS RangeRate,
    MAX(Value) - MIN(Value) AS RangeValue
FROM steel_data;


-- 3rd Moment Business Decision
-- Calculating skewness for the specified columns.
SELECT
    (SUM(POWER(Quantity - Mean, 3)) / (COUNT(Quantity) * POW(StdDev, 3))) AS Skewness
FROM (
    SELECT AVG(Quantity) AS Mean FROM steel_data
) AS MeanTable,
(
    SELECT STDDEV_POP(Quantity) AS StdDev FROM steel_data
) AS StdDevTable,
steel_data
GROUP BY Mean, StdDev;

SELECT
    (SUM(POWER(Rate - Mean, 3)) / (COUNT(Rate) * POW(StdDev, 3))) AS Skewness
FROM (
    SELECT AVG(Rate) AS Mean FROM steel_data
) AS MeanTable,
(
    SELECT STDDEV_POP(Rate) AS StdDev FROM steel_data
) AS StdDevTable,
steel_data
GROUP BY Mean, StdDev;

SELECT
    (SUM(POWER(Value - Mean, 3)) / (COUNT(Value) * POW(StdDev, 3))) AS Skewness
FROM (
    SELECT AVG(Value) AS Mean FROM steel_data
) AS MeanTable,
(
    SELECT STDDEV_POP(Value) AS StdDev FROM steel_data
) AS StdDevTable,
steel_data
GROUP BY Mean, StdDev;


-- 4th Monment business decision.
-- Calculate kurtosis for the specified columns.
SELECT
    (SUM(POWER((Quantity - Mean), 4)) / (COUNT(Quantity) * POW(StdDev, 4))) - 3 AS Kurtosis
FROM (
    SELECT AVG(Quantity) AS Mean FROM steel_data
) AS MeanTable,
(
    SELECT STDDEV_POP(Quantity) AS StdDev FROM steel_data
) AS StdDevTable,
steel_data
GROUP BY Mean, StdDev;

SELECT
    (SUM(POWER((Rate - Mean), 4)) / (COUNT(Rate) * POW(StdDev, 4))) - 3 AS Kurtosis
FROM (
    SELECT AVG(Rate) AS Mean FROM steel_data
) AS MeanTable,
(
    SELECT STDDEV_POP(Rate) AS StdDev FROM steel_data
) AS StdDevTable,
steel_data
GROUP BY Mean, StdDev;

SELECT
    (SUM(POWER((Value - Mean), 4)) / (COUNT(Value) * POW(StdDev, 4))) - 3 AS Kurtosis
FROM (
    SELECT AVG(Value) AS Mean FROM steel_data
) AS MeanTable,
(
    SELECT STDDEV_POP(Value) AS StdDev FROM steel_data
) AS StdDevTable,
steel_data
GROUP BY Mean, StdDev;

------------------------------------------------------------------------------------------------------

-- Date:	     The date of the transaction.
-- FY:	         The fiscal year.
-- Products:	 The name of the product sold.
-- dia:	         The diameter of the product in millimeters.
-- dia group:	 The diameter group of the product.
-- grade:	     The grade of the product.
-- type:	     The type of product.
-- length:	     The length of the product in meters.
-- Voucher Type: The type of voucher used for the transaction.
-- Quantity:	 The quantity of the product sold in tons.
-- Rate:	     The rate of the product in INR per ton.
-- Value:	     The value of the product sold in INR.

-- Univariate Analysis
-- 1. Display count, min, max, avg, and std values for a column in the dataset. 
SELECT COUNT(Quantity),
MIN(Quantity),
MAX(Quantity),
STD(Quantity)
FROM steel_data;

-- 2. Find the no. of missing values.
SELECT COUNT(*) FROM steel_data
WHERE Quantity IS NULL;

-- 3. Count the no. of occurences of each product.
SELECT Products, COUNT(Products) FROM steel_data
GROUP BY Products;

-- 4. Most frequently ordered length
 SELECT length, COUNT(length) FROM steel_data
GROUP BY length;

-- Bivariate Analysis
-- (Numeric - Numeric)
-- 1.  How does the rate vary as the quantity of product changes?
SELECT
    CONCAT((FLOOR(Quantity / 10) * 10), '-', (FLOOR(Quantity / 10) * 10 + 10)) AS Quantity_Range,
    AVG(Rate) AS Average_Rate
FROM steel_data
WHERE Quantity >= 0 AND Quantity <= 100 -- Assuming your quantity values are between 0 and 100
GROUP BY Quantity_Range
ORDER BY Quantity_Range;

-- 2. Find the most preferred grade of steel rod based on value.
SELECT grade, SUM(Value) AS Total_sales 
FROM steel_data
GROUP BY grade;

-- Data Pre-processing
-- checking for duplicate values
select count(*) from steel_data1;
SELECT Date, FY, Products, dia, `dia group`, grade, type, length, `Voucher Type`, Quantity, Rate, Value, COUNT(*) AS count
FROM steel_data
GROUP BY Date, FY, Products, dia, `dia group`, grade, type, length, `Voucher Type`, Quantity, Rate, Value
HAVING COUNT(*) > 1;

-- remove duplicates
DELETE s.*
FROM steel_data1 s
JOIN (
    SELECT Date, FY, Products, dia, `dia group`, grade, type, length, `Voucher Type`, Quantity, Rate, Value,
           ROW_NUMBER() OVER(PARTITION BY Date, FY, Products, dia, `dia group`, grade, type, length, `Voucher Type`, Quantity, Rate, Value ORDER BY Date) AS RowNum
    FROM steel_data1
) AS DuplicateCTE ON
    s.Date = DuplicateCTE.Date AND
    s.FY = DuplicateCTE.FY AND
    s.Products = DuplicateCTE.Products AND
    s.dia = DuplicateCTE.dia AND
    s.`dia group` = DuplicateCTE.`dia group` AND
    s.grade = DuplicateCTE.grade AND
    s.type = DuplicateCTE.type AND
    s.length = DuplicateCTE.length AND
    s.`Voucher Type` = DuplicateCTE.`Voucher Type` AND
    s.Quantity = DuplicateCTE.Quantity AND
    s.Rate = DuplicateCTE.Rate AND
    s.Value = DuplicateCTE.Value
WHERE DuplicateCTE.RowNum > 1;





-- Checking for outliers

SELECT
    Q1,
    Q3,
    @upper_threshold := Q3 + 1.5 * (Q3 - Q1) AS upper_threshold,
    @lower_threshold := Q1 - 1.5 * (Q3 - Q1) AS lower_threshold
FROM (
    SELECT
        AVG(CASE WHEN RowNumber BETWEEN 1 AND TotalRows / 4 THEN Quantity END) AS Q1,
        AVG(CASE WHEN RowNumber BETWEEN 3 * TotalRows / 4 AND TotalRows THEN Quantity END) AS Q3
    FROM (
        SELECT
            Quantity,
            ROW_NUMBER() OVER (ORDER BY Quantity) AS RowNumber,
            COUNT(*) OVER () AS TotalRows
        FROM
            steel_data
    ) RankedData
) Quartiles;

SELECT
    Q1,
    Q3,
    @upper_threshold := Q3 + 1.5 * (Q3 - Q1) AS upper_threshold,
    @lower_threshold := Q1 - 1.5 * (Q3 - Q1) AS lower_threshold
FROM (
    SELECT
        AVG(CASE WHEN RowNumber BETWEEN 1 AND TotalRows / 4 THEN Rate END) AS Q1,
        AVG(CASE WHEN RowNumber BETWEEN 3 * TotalRows / 4 AND TotalRows THEN Rate END) AS Q3
    FROM (
        SELECT
            Rate,
            ROW_NUMBER() OVER (ORDER BY Rate) AS RowNumber,
            COUNT(*) OVER () AS TotalRows
        FROM
            steel_data
    ) RankedData
) Quartiles;

SELECT Value
FROM steel_data
WHERE Value > (SELECT AVG(Value) + 1.5 * STDDEV(Value) FROM steel_data);

SELECT
    
    LOG(Value) AS TransformedValue
FROM
    steel_data;


/*UPDATE tmt_steel
SET Diameter = @upper_threshold
WHERE Diameter > @upper_threshold;*/

select Quantity from steel_data
WHERE Quantity > @upper_threshold OR Quantity < @lower_threshold ;

select Rate from steel_data
WHERE Rate > @upper_threshold OR Rate < @lower_threshold ;




