
-- Official Statistics Data Quality Audit
-- Housing affordability: house price-to-earnings ratio by local authority
-- Dataset structure: one row per local authority per year

-- 1. Record summary
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT local_authority_code) AS local_authorities,
    MIN(year) AS first_year,
    MAX(year) AS latest_year,
    SUM(CASE WHEN is_missing_value THEN 1 ELSE 0 END) AS missing_records,
    SUM(CASE WHEN is_outlier THEN 1 ELSE 0 END) AS outlier_records
FROM housing_quality;

-- 2. Missing values by year
SELECT
    year,
    SUM(CASE WHEN is_missing_value THEN 1 ELSE 0 END) AS missing_values
FROM housing_quality
GROUP BY year
ORDER BY year;

-- 3. Top 10 least affordable local authorities in 2025
SELECT
    country_region_name,
    local_authority_code,
    local_authority_name,
    house_price_to_earnings_ratio
FROM housing_quality
WHERE year = 2025
  AND house_price_to_earnings_ratio IS NOT NULL
ORDER BY house_price_to_earnings_ratio DESC
LIMIT 10;

-- 4. Regional affordability summary in 2025
SELECT
    country_region_name,
    COUNT(DISTINCT local_authority_code) AS local_authorities,
    ROUND(AVG(house_price_to_earnings_ratio), 2) AS mean_ratio,
    ROUND(MEDIAN(house_price_to_earnings_ratio), 2) AS median_ratio,
    ROUND(MIN(house_price_to_earnings_ratio), 2) AS min_ratio,
    ROUND(MAX(house_price_to_earnings_ratio), 2) AS max_ratio
FROM housing_quality
WHERE year = 2025
  AND house_price_to_earnings_ratio IS NOT NULL
GROUP BY country_region_name
ORDER BY median_ratio DESC;

-- 5. Records requiring review
SELECT
    country_region_name,
    local_authority_code,
    local_authority_name,
    year,
    house_price_to_earnings_ratio,
    data_quality_flag
FROM housing_quality
WHERE data_quality_flag <> 'OK'
ORDER BY year, country_region_name, local_authority_name;
