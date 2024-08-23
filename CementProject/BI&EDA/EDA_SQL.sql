-- Create database
create database cement_db;
use cement_db;

-- View the table
select*from cement_data;
desc cement_data;


-- 1st Moment Business Decision
-- Calculating the mean for the below columns

SELECT AVG(Residue) AS Residue,
       AVG(Blaine) AS Blaine,
       AVG(C3A) AS C3A,
       AVG(C4AF) AS C4AF,
       AVG(`G-SO3`) AS G_SO3,
       AVG(`G-Moisture`) AS G_Moisture,
       AVG(`FA-Blaine`) AS FA_Blaine,
       AVG(`Gypsum Weigh Feeder_TPH`) AS Gypsum_Weigh_Feeder_TPH,
       AVG(`Fly Ash SFF_TPH`) AS Fly_Ash_SFF_TPH,
       AVG(`Drive Power_MILL_KW`) AS Drive_Power_MILL_KW,
       AVG(Separator_speed_RPM) AS Separator_speed_RPM,
       AVG(`Position_Master Roller1_mm`) AS Position_Master_Roller1_mm,
       AVG(`Counter Pressure_HLSM_mm`) AS Counter_Pressure_HLSM_mm,
       AVG(Hydraulic_pressure) AS Hydraulic_pressure,
       AVG(`Fan Power_Kw`) AS Fan_Power_Kw
       
FROM cement_data;

-- Calculating the median for the below columns
-- Calculate the median for the specified columns using SUBSTRING_INDEX (MySQL)
SELECT
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(Residue ORDER BY Residue), ',', (COUNT(*)+1)/2), ',', -1) AS MedianResidue,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(Blaine ORDER BY Blaine), ',', (COUNT(*)+1)/2), ',', -1) AS MedianBlaine,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(C3A ORDER BY C3A), ',', (COUNT(*)+1)/2), ',', -1) AS MedianC3A,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(C4AF ORDER BY C4AF), ',', (COUNT(*)+1)/2), ',', -1) AS MedianC4AF,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(`G-SO3` ORDER BY `G-SO3`), ',', (COUNT(*)+1)/2), ',', -1) AS MedianG_SO3,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(`G-Moisture` ORDER BY `G-Moisture`), ',', (COUNT(*)+1)/2), ',', -1) AS MedianG_Moisture,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(`FA-Blaine` ORDER BY `FA-Blaine`), ',', (COUNT(*)+1)/2), ',', -1) AS MedianFA_Blaine,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(`Gypsum Weigh Feeder_TPH` ORDER BY `Gypsum Weigh Feeder_TPH`), ',', (COUNT(*)+1)/2), ',', -1) AS MedianGypsum_Weigh_Feeder_TPH,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(`Fly Ash SFF_TPH` ORDER BY `Fly Ash SFF_TPH`), ',', (COUNT(*)+1)/2), ',', -1) AS MedianFly_Ash_SFF_TPH,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(`Drive Power_MILL_KW` ORDER BY `Drive Power_MILL_KW`), ',', (COUNT(*)+1)/2), ',', -1) AS MedianDrive_Power_MILL_KW,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(`Separator_speed_RPM` ORDER BY `Separator_speed_RPM`), ',', (COUNT(*)+1)/2), ',', -1) AS MedianSeparator_speed_RPM,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(`Position_Master Roller1_mm` ORDER BY `Position_Master Roller1_mm`), ',', (COUNT(*)+1)/2), ',', -1) AS MedianPosition_Master_Roller1_mm,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(`Counter Pressure_HLSM_mm` ORDER BY `Counter Pressure_HLSM_mm`), ',', (COUNT(*)+1)/2), ',', -1) AS MedianCounter_Pressure_HLSM_mm,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(`Hydraulic_pressure` ORDER BY `Hydraulic_pressure`), ',', (COUNT(*)+1)/2), ',', -1) AS MedianHydraulic_Pressure,
    SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(`Fan Power_Kw` ORDER BY `Fan Power_Kw`), ',', (COUNT(*)+1)/2), ',', -1) AS MedianFan_Power_Kw
FROM cement_data;

-- Calculate the mode for the specified columns

SELECT
    (SELECT Residue
     FROM cement_data
     GROUP BY Residue
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeResidue,

    (SELECT Blaine
     FROM cement_data
     GROUP BY Blaine
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeBlaine,

    (SELECT C3A
     FROM cement_data
     GROUP BY C3A
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeC3A,

    (SELECT C4AF
     FROM cement_data
     GROUP BY C4AF
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeC4AF,

    (SELECT `G-SO3`
     FROM cement_data
     GROUP BY `G-SO3`
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeG_SO3,

    (SELECT `G-Moisture`
     FROM cement_data
     GROUP BY `G-Moisture`
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeG_Moisture,

    (SELECT `FA-Blaine`
     FROM cement_data
     GROUP BY `FA-Blaine`
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeFA_Blaine,

    (SELECT `Gypsum Weigh Feeder_TPH`
     FROM cement_data
     GROUP BY `Gypsum Weigh Feeder_TPH`
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeGypsum_Weigh_Feeder_TPH,

    (SELECT `Fly Ash SFF_TPH`
     FROM cement_data
     GROUP BY `Fly Ash SFF_TPH`
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeFly_Ash_SFF_TPH,

    (SELECT `Drive Power_MILL_KW`
     FROM cement_data
     GROUP BY `Drive Power_MILL_KW`
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeDrive_Power_MILL_KW,

    (SELECT Separator_speed_RPM
     FROM cement_data
     GROUP BY Separator_speed_RPM
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeSeparator_speed_RPM,

    (SELECT `Position_Master Roller1_mm`
     FROM cement_data
     GROUP BY `Position_Master Roller1_mm`
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModePosition_Master_Roller1_mm,

    (SELECT `Counter Pressure_HLSM_mm`
     FROM cement_data
     GROUP BY `Counter Pressure_HLSM_mm`
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeCounter_Pressure_HLSM_mm,

    (SELECT Hydraulic_Pressure
     FROM cement_data
     GROUP BY Hydraulic_Pressure
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeHydraulic_Pressure,

    (SELECT `Fan Power_Kw`
     FROM cement_data
     GROUP BY `Fan Power_Kw`
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS ModeFan_Power_Kw;

     
-- 2nd Moment Business Decision
-- Calculating variance for the specififed columns.

SELECT VAR_POP(Residue) AS VarianceResidue,
       VAR_POP(Blaine) AS VarianceBlaine,
       VAR_POP(C3A) AS VarianceC3A,
       VAR_POP(C4AF) AS VarianceC4AF,
       VAR_POP(`G-SO3`) AS VarianceG_SO3,
       VAR_POP(`G-Moisture`) AS VarianceG_Moisture,
       VAR_POP(`FA-Blaine`) AS VarianceFA_Blaine,
       VAR_POP(`Gypsum Weigh Feeder_TPH`) AS VarianceGypsum_Weigh_Feeder_TPH,
       VAR_POP(`Fly Ash SFF_TPH`) AS VarianceFly_Ash_SFF_TPH,
       VAR_POP(`Drive Power_MILL_KW`) AS VarianceDrive_Power_MILL_KW,
       VAR_POP(Separator_speed_RPM) AS VarianceSeparator_speed_RPM,
       VAR_POP(`Position_Master Roller1_mm`) AS VariancePosition_Master_Roller1_mm,
       VAR_POP(`Counter Pressure_HLSM_mm`) AS VarianceCounter_Pressure_HLSM_mm,
       VAR_POP(Hydraulic_Pressure) AS VarianceHydraulic_Pressure,
       VAR_POP(`Fan Power_Kw`) AS VarianceFan_Power_Kw
FROM cement_data;

-- Calculating std-dev for the specififed columns.
SELECT STDDEV_POP(Residue) AS StdDevResidue,
       STDDEV_POP(Blaine) AS StdDevBlaine,
       STDDEV_POP(C3A) AS StdDevC3A,
       STDDEV_POP(C4AF) AS StdDevC4AF,
       STDDEV_POP(`G-SO3`) AS StdDevG_SO3,
       STDDEV_POP(`G-Moisture`) AS StdDevG_Moisture,
       STDDEV_POP(`FA-Blaine`) AS StdDevFA_Blaine,
       STDDEV_POP(`Gypsum Weigh Feeder_TPH`) AS StdDevGypsum_Weigh_Feeder_TPH,
       STDDEV_POP(`Fly Ash SFF_TPH`) AS StdDevFly_Ash_SFF_TPH,
       STDDEV_POP(`Drive Power_MILL_KW`) AS StdDevDrive_Power_MILL_KW,
       STDDEV_POP(Separator_speed_RPM) AS StdDevSeparator_speed_RPM,
       STDDEV_POP(`Position_Master Roller1_mm`) AS StdDevPosition_Master_Roller1_mm,
       STDDEV_POP(`Counter Pressure_HLSM_mm`) AS StdDevCounter_Pressure_HLSM_mm,
       STDDEV_POP(Hydraulic_Pressure) AS StdDevHydraulic_Pressure,
       STDDEV_POP(`Fan Power_Kw`) AS StdDevFan_Power_Kw
FROM cement_data;

-- Calculating range for the specififed columns.

SELECT MAX(Residue) - MIN(Residue) AS RangeResidue,
       MAX(Blaine) - MIN(Blaine) AS RangeBlaine,
       MAX(C3A) - MIN(C3A) AS RangeC3A,
       MAX(C4AF) - MIN(C4AF) AS RangeC4AF,
       MAX(`G-SO3`) - MIN(`G-SO3`) AS RangeG_SO3,
       MAX(`G-Moisture`) - MIN(`G-Moisture`) AS RangeG_Moisture,
       MAX(`FA-Blaine`) - MIN(`FA-Blaine`) AS RangeFA_Blaine,
       MAX(`Gypsum Weigh Feeder_TPH`) - MIN(`Gypsum Weigh Feeder_TPH`) AS RangeGypsum_Weigh_Feeder_TPH,
       MAX(`Fly Ash SFF_TPH`) - MIN(`Fly Ash SFF_TPH`) AS RangeFly_Ash_SFF_TPH,
       MAX(`Drive Power_MILL_KW`) - MIN(`Drive Power_MILL_KW`) AS RangeDrive_Power_MILL_KW,
       MAX(Separator_speed_RPM) - MIN(Separator_speed_RPM) AS RangeSeparator_speed_RPM,
       MAX(`Position_Master Roller1_mm`) - MIN(`Position_Master Roller1_mm`) AS RangePosition_Master_Roller1_mm,
       MAX(`Counter Pressure_HLSM_mm`) - MIN(`Counter Pressure_HLSM_mm`) AS RangeCounter_Pressure_HLSM_mm,
       MAX(Hydraulic_Pressure) - MIN(Hydraulic_Pressure) AS RangeHydraulic_Pressure,
       MAX(`Fan Power_Kw`) - MIN(`Fan Power_Kw`) AS RangeFan_Power_Kw
FROM cement_data;

-- 3rd Moment Business Decision
-- Calculating skewness for the specified columns.
SELECT
    (SUM(POWER(Residue - Mean, 3)) / (COUNT(Residue) * POW(StdDev, 3))) AS SkewnessResidue,
    (SUM(POWER(Blaine - Mean, 3)) / (COUNT(Blaine) * POW(StdDev, 3))) AS SkewnessBlaine,
    (SUM(POWER(C3A - Mean, 3)) / (COUNT(C3A) * POW(StdDev, 3))) AS SkewnessC3A,
    (SUM(POWER(C4AF - Mean, 3)) / (COUNT(C4AF) * POW(StdDev, 3))) AS SkewnessC4AF,
    (SUM(POWER(`G-SO3` - Mean, 3)) / (COUNT(`G-SO3`) * POW(StdDev, 3))) AS SkewnessG_SO3,
    (SUM(POWER(`G-Moisture` - Mean, 3)) / (COUNT(`G-Moisture`) * POW(StdDev, 3))) AS SkewnessG_Moisture,
    (SUM(POWER(`FA-Blaine` - Mean, 3)) / (COUNT(`FA-Blaine`) * POW(StdDev, 3))) AS SkewnessFA_Blaine,
    (SUM(POWER(`Gypsum Weigh Feeder_TPH` - Mean, 3)) / (COUNT(`Gypsum Weigh Feeder_TPH`) * POW(StdDev, 3))) AS SkewnessGypsum_Weigh_Feeder_TPH,
    (SUM(POWER(`Fly Ash SFF_TPH` - Mean, 3)) / (COUNT(`Fly Ash SFF_TPH`) * POW(StdDev, 3))) AS SkewnessFly_Ash_SFF_TPH,
    (SUM(POWER(`Drive Power_MILL_KW` - Mean, 3)) / (COUNT(`Drive Power_MILL_KW`) * POW(StdDev, 3))) AS SkewnessDrive_Power_MILL_KW,
    (SUM(POWER(Separator_speed_RPM - Mean, 3)) / (COUNT(Separator_speed_RPM) * POW(StdDev, 3))) AS SkewnessSeparator_speed_RPM,
    (SUM(POWER(`Position_Master Roller1_mm` - Mean, 3)) / (COUNT(`Position_Master Roller1_mm`) * POW(StdDev, 3))) AS SkewnessPosition_Master_Roller1_mm,
    (SUM(POWER(`Counter Pressure_HLSM_mm` - Mean, 3)) / (COUNT(`Counter Pressure_HLSM_mm`) * POW(StdDev, 3))) AS SkewnessCounter_Pressure_HLSM_mm,
    (SUM(POWER(Hydraulic_Pressure - Mean, 3)) / (COUNT(Hydraulic_Pressure) * POW(StdDev, 3))) AS SkewnessHydraulic_Pressure,
    (SUM(POWER(`Fan Power_Kw` - Mean, 3)) / (COUNT(`Fan Power_Kw`) * POW(StdDev, 3))) AS SkewnessFan_Power_Kw
FROM (
    SELECT AVG(Residue) AS Mean FROM cement_data
) AS MeanTable,
(
    SELECT STDDEV_POP(Residue) AS StdDev FROM cement_data
) AS StdDevTable,
cement_data
GROUP BY Mean, StdDev;



-- 4th Monment business decision.
-- Calculate kurtosis for the specified columns.
SELECT
    (SUM(POWER((Residue - Mean), 4)) / (COUNT(Residue) * POW(StdDev, 4))) - 3 AS KurtosisResidue,
    (SUM(POWER((Blaine - Mean), 4)) / (COUNT(Blaine) * POW(StdDev, 4))) - 3 AS KurtosisBlaine,
    (SUM(POWER((C3A - Mean), 4)) / (COUNT(C3A) * POW(StdDev, 4))) - 3 AS KurtosisC3A,
    (SUM(POWER((C4AF - Mean), 4)) / (COUNT(C4AF) * POW(StdDev, 4))) - 3 AS KurtosisC4AF,
    (SUM(POWER((`G-SO3` - Mean), 4)) / (COUNT(`G-SO3`) * POW(StdDev, 4))) - 3 AS KurtosisG_SO3,
    (SUM(POWER((`G-Moisture` - Mean), 4)) / (COUNT(`G-Moisture`) * POW(StdDev, 4))) - 3 AS KurtosisG_Moisture,
    (SUM(POWER((`FA-Blaine` - Mean), 4)) / (COUNT(`FA-Blaine`) * POW(StdDev, 4))) - 3 AS KurtosisFA_Blaine,
    (SUM(POWER((`Gypsum Weigh Feeder_TPH` - Mean), 4)) / (COUNT(`Gypsum Weigh Feeder_TPH`) * POW(StdDev, 4))) - 3 AS KurtosisGypsum_Weigh_Feeder_TPH,
    (SUM(POWER((`Fly Ash SFF_TPH` - Mean), 4)) / (COUNT(`Fly Ash SFF_TPH`) * POW(StdDev, 4))) - 3 AS KurtosisFly_Ash_SFF_TPH,
    (SUM(POWER((`Drive Power_MILL_KW` - Mean), 4)) / (COUNT(`Drive Power_MILL_KW`) * POW(StdDev, 4))) - 3 AS KurtosisDrive_Power_MILL_KW,
    (SUM(POWER((Separator_speed_RPM - Mean), 4)) / (COUNT(Separator_speed_RPM) * POW(StdDev, 4))) - 3 AS KurtosisSeparator_speed_RPM,
    (SUM(POWER((`Position_Master Roller1_mm` - Mean), 4)) / (COUNT(`Position_Master Roller1_mm`) * POW(StdDev, 4))) - 3 AS KurtosisPosition_Master_Roller1_mm,
    (SUM(POWER((`Counter Pressure_HLSM_mm` - Mean), 4)) / (COUNT(`Counter Pressure_HLSM_mm`) * POW(StdDev, 4))) - 3 AS KurtosisCounter_Pressure_HLSM_mm,
    (SUM(POWER((Hydraulic_Pressure - Mean), 4)) / (COUNT(Hydraulic_Pressure) * POW(StdDev, 4))) - 3 AS KurtosisHydraulic_Pressure,
    (SUM(POWER((`Fan Power_Kw` - Mean), 4)) / (COUNT(`Fan Power_Kw`) * POW(StdDev, 4))) - 3 AS KurtosisFan_Power_Kw
FROM (
    SELECT AVG(Residue) AS Mean FROM cement_data
) AS MeanTable,
(
    SELECT STDDEV_POP(Residue) AS StdDev FROM cement_data
) AS StdDevTable,
cement_data
GROUP BY Mean, StdDev;

-- PREPROCESSING
-- For Residue
SELECT
    (SELECT AVG(Residue) FROM cement_data WHERE Residue <= (SELECT Residue FROM cement_data ORDER BY Residue ASC LIMIT 250, 1)) AS Q1Residue,
    (SELECT AVG(Residue) FROM cement_data WHERE Residue >= (SELECT Residue FROM cement_data ORDER BY Residue DESC LIMIT 250, 1)) AS Q3Residue;

SET @upper_threshold_residue = Q3Residue + 1.5 * (Q3Residue - Q1Residue);
SET @lower_threshold_residue = Q1Residue - 1.5 * (Q3Residue - Q1Residue);

UPDATE cement_data
SET Residue = @upper_threshold_residue
WHERE Residue > @upper_threshold_residue;

UPDATE cement_data
SET Residue = @lower_threshold_residue
WHERE Residue < @lower_threshold_residue;

SELECT Residue FROM cement_data
WHERE Residue > @upper_threshold_residue;

-- For Blaine
SELECT
    (SELECT AVG(Blaine) FROM cement_data WHERE Blaine <= (SELECT Blaine FROM cement_data ORDER BY Blaine ASC LIMIT 250, 1)) AS Q1Blaine,
    (SELECT AVG(Blaine) FROM cement_data WHERE Blaine >= (SELECT Blaine FROM cement_data ORDER BY Blaine DESC LIMIT 250, 1)) AS Q3Blaine;

SET @upper_threshold_blaine = Q3Blaine + 1.5 * (Q3Blaine - Q1Blaine);
SET @lower_threshold_blaine = Q1Blaine - 1.5 * (Q3Blaine - Q1Blaine);

UPDATE cement_data
SET Blaine = @upper_threshold_blaine
WHERE Blaine > @upper_threshold_blaine;

UPDATE cement_data
SET Blaine = @lower_threshold_blaine
WHERE Blaine < @lower_threshold_blaine;

SELECT Blaine FROM cement_data
WHERE Blaine > @upper_threshold_blaine;

-- For C3A
SELECT
    (SELECT AVG(C3A) FROM cement_data WHERE C3A <= (SELECT C3A FROM cement_data ORDER BY C3A ASC LIMIT 250, 1)) AS Q1C3A,
    (SELECT AVG(C3A) FROM cement_data WHERE C3A >= (SELECT C3A FROM cement_data ORDER BY C3A DESC LIMIT 250, 1)) AS Q3C3A;

SET @upper_threshold_c3a = Q3C3A + 1.5 * (Q3C3A - Q1C3A);
SET @lower_threshold_c3a = Q1C3A - 1.5 * (Q3C3A - Q1C3A);

UPDATE cement_data
SET C3A = @upper_threshold_c3a
WHERE C3A > @upper_threshold_c3a;

UPDATE cement_data
SET C3A = @lower_threshold_c3a
WHERE C3A < @lower_threshold_c3a;

SELECT C3A FROM cement_data
WHERE C3A > @upper_threshold_c3a;

-- For C4AF
SELECT
    (SELECT AVG(C4AF) FROM cement_data WHERE C4AF <= (SELECT C4AF FROM cement_data ORDER BY C4AF ASC LIMIT 250, 1)) AS Q1C4AF,
    (SELECT AVG(C4AF) FROM cement_data WHERE C4AF >= (SELECT C4AF FROM cement_data ORDER BY C4AF DESC LIMIT 250, 1)) AS Q3C4AF;

SET @upper_threshold_c4af = Q3C4AF + 1.5 * (Q3C4AF - Q1C4AF);
SET @lower_threshold_c4af = Q1C4AF - 1.5 * (Q3C4AF - Q1C4AF);

UPDATE cement_data
SET C4AF = @upper_threshold_c4af
WHERE C4AF > @upper_threshold_c4af;

UPDATE cement_data
SET C4AF = @lower_threshold_c4af
WHERE C4AF < @lower_threshold_c4af;

SELECT C4AF FROM cement_data
WHERE C4AF > @upper_threshold_c4af;

-- For G-SO3
SELECT
    (SELECT AVG(`G-SO3`) FROM cement_data WHERE `G-SO3` <= (SELECT `G-SO3` FROM cement_data ORDER BY `G-SO3` ASC LIMIT 250, 1)) AS Q1G_SO3,
    (SELECT AVG(`G-SO3`) FROM cement_data WHERE `G-SO3` >= (SELECT `G-SO3` FROM cement_data ORDER BY `G-SO3` DESC LIMIT 250, 1)) AS Q3G_SO3;

SET @upper_threshold_g_so3 = Q3G_SO3 + 1.5 * (Q3G_SO3 - Q1G_SO3);
SET @lower_threshold_g_so3 = Q1G_SO3 - 1.5 * (Q3G_SO3 - Q1G_SO3);

UPDATE cement_data
SET `G-SO3` = @upper_threshold_g_so3
WHERE `G-SO3` > @upper_threshold_g_so3;

UPDATE cement_data
SET `G-SO3` = @lower_threshold_g_so3
WHERE `G-SO3` < @lower_threshold_g_so3;

SELECT `G-SO3` FROM cement_data
WHERE `G-SO3` > @upper_threshold_g_so3;

-- For G-Moisture
SELECT
    (SELECT AVG(`G-Moisture`) FROM cement_data WHERE `G-Moisture` <= (SELECT `G-Moisture` FROM cement_data ORDER BY `G-Moisture` ASC LIMIT 250, 1)) AS Q1G_Moisture,
    (SELECT AVG(`G-Moisture`) FROM cement_data WHERE `G-Moisture` >= (SELECT `G-Moisture` FROM cement_data ORDER BY `G-Moisture` DESC LIMIT 250, 1)) AS Q3G_Moisture;

SET @upper_threshold_g_moisture = Q3G_Moisture + 1.5 * (Q3G_Moisture - Q1G_Moisture);
SET @lower_threshold_g_moisture = Q1G_Moisture - 1.5 * (Q3G_Moisture - Q1G_Moisture);

UPDATE cement_data
SET `G-Moisture` = @upper_threshold_g_moisture
WHERE `G-Moisture` > @upper_threshold_g_moisture;

UPDATE cement_data
SET `G-Moisture` = @lower_threshold_g_moisture
WHERE `G-Moisture` < @lower_threshold_g_moisture;

SELECT `G-Moisture` FROM cement_data
WHERE `G-Moisture` > @upper_threshold_g_moisture;

-- For FA-Blaine
SELECT
    (SELECT AVG(`FA-Blaine`) FROM cement_data WHERE `FA-Blaine` <= (SELECT `FA-Blaine` FROM cement_data ORDER BY `FA-Blaine` ASC LIMIT 250, 1)) AS Q1FA_Blaine,
    (SELECT AVG(`FA-Blaine`) FROM cement_data WHERE `FA-Blaine` >= (SELECT `FA-Blaine` FROM cement_data ORDER BY `FA-Blaine` DESC LIMIT 250, 1)) AS Q3FA_Blaine;

SET @upper_threshold_fa_blaine = Q3FA_Blaine + 1.5 * (Q3FA_Blaine - Q1FA_Blaine);
SET @lower_threshold_fa_blaine = Q1FA_Blaine - 1.5 * (Q3FA_Blaine - Q1FA_Blaine);

UPDATE cement_data
SET `FA-Blaine` = @upper_threshold_fa_blaine
WHERE `FA-Blaine` > @upper_threshold_fa_blaine;

UPDATE cement_data
SET `FA-Blaine` = @lower_threshold_fa_blaine
WHERE `FA-Blaine` < @lower_threshold_fa_blaine;

SELECT `FA-Blaine` FROM cement_data
WHERE `FA-Blaine` > @upper_threshold_fa_blaine;

-- For Gypsum Weigh Feeder_TPH
SELECT
    (SELECT AVG(`Gypsum Weigh Feeder_TPH`) FROM cement_data WHERE `Gypsum Weigh Feeder_TPH` <= (SELECT `Gypsum Weigh Feeder_TPH` FROM cement_data ORDER BY `Gypsum Weigh Feeder_TPH` ASC LIMIT 250, 1)) AS Q1Gypsum_Weigh_Feeder_TPH,
    (SELECT AVG(`Gypsum Weigh Feeder_TPH`) FROM cement_data WHERE `Gypsum Weigh Feeder_TPH` >= (SELECT `Gypsum Weigh Feeder_TPH` FROM cement_data ORDER BY `Gypsum Weigh Feeder_TPH` DESC LIMIT 250, 1)) AS Q3Gypsum_Weigh_Feeder_TPH;

SET @upper_threshold_gypsum_weigh = Q3Gypsum_Weigh_Feeder_TPH + 1.5 * (Q3Gypsum_Weigh_Feeder_TPH - Q1Gypsum_Weigh_Feeder_TPH);
SET @lower_threshold_gypsum_weigh = Q1Gypsum_Weigh_Feeder_TPH - 1.5 * (Q3Gypsum_Weigh_Feeder_TPH - Q1Gypsum_Weigh_Feeder_TPH);

UPDATE cement_data
SET `Gypsum Weigh Feeder_TPH` = @upper_threshold_gypsum_weigh
WHERE `Gypsum Weigh Feeder_TPH` > @upper_threshold_gypsum_weigh;

UPDATE cement_data
SET `Gypsum Weigh Feeder_TPH` = @lower_threshold_gypsum_weigh
WHERE `Gypsum Weigh Feeder_TPH` < @lower_threshold_gypsum_weigh;

SELECT `Gypsum Weigh Feeder_TPH` FROM cement_data
WHERE `Gypsum Weigh Feeder_TPH` > @upper_threshold_gypsum_weigh;


-- For Fly Ash SFF_TPH
SELECT
    (SELECT AVG(`Fly Ash SFF_TPH`) FROM cement_data WHERE `Fly Ash SFF_TPH` <= (SELECT `Fly Ash SFF_TPH` FROM cement_data ORDER BY `Fly Ash SFF_TPH` ASC LIMIT 250, 1)) AS Q1Fly_Ash_SFF_TPH,
    (SELECT AVG(`Fly Ash SFF_TPH`) FROM cement_data WHERE `Fly Ash SFF_TPH` >= (SELECT `Fly Ash SFF_TPH` FROM cement_data ORDER BY `Fly Ash SFF_TPH` DESC LIMIT 250, 1)) AS Q3Fly_Ash_SFF_TPH;

SET @upper_threshold_fly_ash = Q3Fly_Ash_SFF_TPH + 1.5 * (Q3Fly_Ash_SFF_TPH - Q1Fly_Ash_SFF_TPH);
SET @lower_threshold_fly_ash = Q1Fly_Ash_SFF_TPH - 1.5 * (Q3Fly_Ash_SFF_TPH - Q1Fly_Ash_SFF_TPH);

UPDATE cement_data
SET `Fly Ash SFF_TPH` = @upper_threshold_fly_ash
WHERE `Fly Ash SFF_TPH` > @upper_threshold_fly_ash;

UPDATE cement_data
SET `Fly Ash SFF_TPH` = @lower_threshold_fly_ash
WHERE `Fly Ash SFF_TPH` < @lower_threshold_fly_ash;

SELECT `Fly Ash SFF_TPH` FROM cement_data
WHERE `Fly Ash SFF_TPH` > @upper_threshold_fly_ash;

-- For Drive Power_MILL_KW
SELECT
    (SELECT AVG(`Drive Power_MILL_KW`) FROM cement_data WHERE `Drive Power_MILL_KW` <= (SELECT `Drive Power_MILL_KW` FROM cement_data ORDER BY `Drive Power_MILL_KW` ASC LIMIT 250, 1)) AS Q1Drive_Power_MILL_KW,
    (SELECT AVG(`Drive Power_MILL_KW`) FROM cement_data WHERE `Drive Power_MILL_KW` >= (SELECT `Drive Power_MILL_KW` FROM cement_data ORDER BY `Drive Power_MILL_KW` DESC LIMIT 250, 1)) AS Q3Drive_Power_MILL_KW;

SET @upper_threshold_drive_power = Q3Drive_Power_MILL_KW + 1.5 * (Q3Drive_Power_MILL_KW - Q1Drive_Power_MILL_KW);
SET @lower_threshold_drive_power = Q1Drive_Power_MILL_KW - 1.5 * (Q3Drive_Power_MILL_KW - Q1Drive_Power_MILL_KW);

UPDATE cement_data
SET `Drive Power_MILL_KW` = @upper_threshold_drive_power
WHERE `Drive Power_MILL_KW` > @upper_threshold_drive_power;

UPDATE cement_data
SET `Drive Power_MILL_KW` = @lower_threshold_drive_power
WHERE `Drive Power_MILL_KW` < @lower_threshold_drive_power;

SELECT `Drive Power_MILL_KW` FROM cement_data
WHERE `Drive Power_MILL_KW` > @upper_threshold_drive_power;

-- For Separator_speed_RPM
SELECT
    (SELECT AVG(`Separator_speed_RPM`) FROM cement_data WHERE `Separator_speed_RPM` <= (SELECT `Separator_speed_RPM` FROM cement_data ORDER BY `Separator_speed_RPM` ASC LIMIT 250, 1)) AS Q1Separator_speed_RPM,
    (SELECT AVG(`Separator_speed_RPM`) FROM cement_data WHERE `Separator_speed_RPM` >= (SELECT `Separator_speed_RPM` FROM cement_data ORDER BY `Separator_speed_RPM` DESC LIMIT 250, 1)) AS Q3Separator_speed_RPM;

SET @upper_threshold_separator_speed = Q3Separator_speed_RPM + 1.5 * (Q3Separator_speed_RPM - Q1Separator_speed_RPM);
SET @lower_threshold_separator_speed = Q1Separator_speed_RPM - 1.5 * (Q3Separator_speed_RPM - Q1Separator_speed_RPM);

UPDATE cement_data
SET `Separator_speed_RPM` = @upper_threshold_separator_speed
WHERE `Separator_speed_RPM` > @upper_threshold_separator_speed;

UPDATE cement_data
SET `Separator_speed_RPM` = @lower_threshold_separator_speed
WHERE `Separator_speed_RPM` < @lower_threshold_separator_speed;

SELECT `Separator_speed_RPM` FROM cement_data
WHERE `Separator_speed_RPM` > @upper_threshold_separator_speed;

-- For Position_Master Roller1_mm
SELECT
    (SELECT AVG(`Position_Master Roller1_mm`) FROM cement_data WHERE `Position_Master Roller1_mm` <= (SELECT `Position_Master Roller1_mm` FROM cement_data ORDER BY `Position_Master Roller1_mm` ASC LIMIT 250, 1)) AS Q1Position_Master_Roller1_mm,
    (SELECT AVG(`Position_Master Roller1_mm`) FROM cement_data WHERE `Position_Master Roller1_mm` >= (SELECT `Position_Master Roller1_mm` FROM cement_data ORDER BY `Position_Master Roller1_mm` DESC LIMIT 250, 1)) AS Q3Position_Master_Roller1_mm;

SET @upper_threshold_position_master_roller = Q3Position_Master_Roller1_mm + 1.5 * (Q3Position_Master_Roller1_mm - Q1Position_Master_Roller1_mm);
SET @lower_threshold_position_master_roller = Q1Position_Master_Roller1_mm - 1.5 * (Q3Position_Master_Roller1_mm - Q1Position_Master_Roller1_mm);

UPDATE cement_data
SET `Position_Master Roller1_mm` = @upper_threshold_position_master_roller
WHERE `Position_Master Roller1_mm` > @upper_threshold_position_master_roller;

UPDATE cement_data
SET `Position_Master Roller1_mm` = @lower_threshold_position_master_roller
WHERE `Position_Master Roller1_mm` < @lower_threshold_position_master_roller;

SELECT `Position_Master Roller1_mm` FROM cement_data
WHERE `Position_Master Roller1_mm` > @upper_threshold_position_master_roller;

-- For Counter Pressure_HLSM_mm
SELECT
    (SELECT AVG(`Counter Pressure_HLSM_mm`) FROM cement_data WHERE `Counter Pressure_HLSM_mm` <= (SELECT `Counter Pressure_HLSM_mm` FROM cement_data ORDER BY `Counter Pressure_HLSM_mm` ASC LIMIT 250, 1)) AS Q1Counter_Pressure_HLSM_mm,
    (SELECT AVG(`Counter Pressure_HLSM_mm`) FROM cement_data WHERE `Counter Pressure_HLSM_mm` >= (SELECT `Counter Pressure_HLSM_mm` FROM cement_data ORDER BY `Counter Pressure_HLSM_mm` DESC LIMIT 250, 1)) AS Q3Counter_Pressure_HLSM_mm;

SET @upper_threshold_counter_pressure = Q3Counter_Pressure_HLSM_mm + 1.5 * (Q3Counter_Pressure_HLSM_mm - Q1Counter_Pressure_HLSM_mm);
SET @lower_threshold_counter_pressure = Q1Counter_Pressure_HLSM_mm - 1.5 * (Q3Counter_Pressure_HLSM_mm - Q1Counter_Pressure_HLSM_mm);

UPDATE cement_data
SET `Counter Pressure_HLSM_mm` = @upper_threshold_counter_pressure
WHERE `Counter Pressure_HLSM_mm` > @upper_threshold_counter_pressure;

UPDATE cement_data
SET `Counter Pressure_HLSM_mm` = @lower_threshold_counter_pressure
WHERE `Counter Pressure_HLSM_mm` < @lower_threshold_counter_pressure;

SELECT `Counter Pressure_HLSM_mm` FROM cement_data
WHERE `Counter Pressure_HLSM_mm` > @upper_threshold_counter_pressure;

-- For Hydraulic_pressure
SELECT
    (SELECT AVG(`Hydraulic_pressure`) FROM cement_data WHERE `Hydraulic_pressure` <= (SELECT `Hydraulic_pressure` FROM cement_data ORDER BY `Hydraulic_pressure` ASC LIMIT 250, 1)) AS Q1Hydraulic_pressure,
    (SELECT AVG(`Hydraulic_pressure`) FROM cement_data WHERE `Hydraulic_pressure` >= (SELECT `Hydraulic_pressure` FROM cement_data ORDER BY `Hydraulic_pressure` DESC LIMIT 250, 1)) AS Q3Hydraulic_pressure;

SET @upper_threshold_hydraulic_pressure = Q3Hydraulic_pressure + 1.5 * (Q3Hydraulic_pressure - Q1Hydraulic_pressure);
SET @lower_threshold_hydraulic_pressure = Q1Hydraulic_pressure - 1.5 * (Q3Hydraulic_pressure - Q1Hydraulic_pressure);

UPDATE cement_data
SET `Hydraulic_pressure` = @upper_threshold_hydraulic_pressure
WHERE `Hydraulic_pressure` > @upper_threshold_hydraulic_pressure;

UPDATE cement_data
SET `Hydraulic_pressure` = @lower_threshold_hydraulic_pressure
WHERE `Hydraulic_pressure` < @lower_threshold_hydraulic_pressure;

SELECT `Hydraulic_pressure` FROM cement_data
WHERE `Hydraulic_pressure` > @upper_threshold_hydraulic_pressure;

-- For Fan Power_Kw
SELECT
    (SELECT AVG(`Fan Power_Kw`) FROM cement_data WHERE `Fan Power_Kw` <= (SELECT `Fan Power_Kw` FROM cement_data ORDER BY `Fan Power_Kw` ASC LIMIT 250, 1)) AS Q1Fan_Power_Kw,
    (SELECT AVG(`Fan Power_Kw`) FROM cement_data WHERE `Fan Power_Kw` >= (SELECT `Fan Power_Kw` FROM cement_data ORDER BY `Fan Power_Kw` DESC LIMIT 250, 1)) AS Q3Fan_Power_Kw;

SET @upper_threshold_fan_power = Q3Fan_Power_Kw + 1.5 * (Q3Fan_Power_Kw - Q1Fan_Power_Kw);
SET @lower_threshold_fan_power = Q1Fan_Power_Kw - 1.5 * (Q3Fan_Power_Kw - Q1Fan_Power_Kw);

UPDATE cement_data
SET `Fan Power_Kw` = @upper_threshold_fan_power
WHERE `Fan Power_Kw` > @upper_threshold_fan_power;

UPDATE cement_data
SET `Fan Power_Kw` = @lower_threshold_fan_power
WHERE `Fan Power_Kw` < @lower_threshold_fan_power;

SELECT `Fan Power_Kw` FROM cement_data
WHERE `Fan Power_Kw` > @upper_threshold_fan_power;











