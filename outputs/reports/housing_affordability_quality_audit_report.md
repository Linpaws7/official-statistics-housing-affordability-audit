
# Official Statistics Data Quality Audit of Local Authority Housing Affordability Indicators

## 1. Project purpose

This project audits an official ONS housing-affordability dataset before analysis. The dataset reports the ratio of median house price to median gross annual residence-based earnings for local authority districts in England and Wales between 2002 and 2025.

The purpose is to demonstrate an official-statistics-style workflow: checking data coverage, local authority code consistency, missing values, outliers, comparability risks and analysis-ready outputs.

## 2. Dataset and structure

Source file: ONS house price to residence-based earnings ratio workbook  
Selected sheet: 5c  
Geography: Local authority districts, England and Wales  
Measure: Ratio of median house price to median gross annual residence-based earnings  
Period: 2002 to 2025

After reshaping the dataset from wide to long format, the audit dataset contains:

                                            metric        value
           Total local authorities in source sheet          318
          Total year-level records after reshaping         7632
                                     Years covered 2002 to 2025
     Missing house price-to-earnings ratio records           61
               Statistical outlier records flagged          110
  Local authorities with at least one missing year           23
         Local authorities with valid code pattern          318
             Invalid local authority code patterns            0
                   Duplicate local authority codes            0
              Areas with both 2002 and 2025 values          295
               Average affordability ratio in 2002         5.11
               Average affordability ratio in 2025         7.98
Average affordability-ratio increase, 2002 to 2025         2.87

## 3. Main data quality findings

The local-authority code structure was clean. All 318 local authority codes followed the expected English/Welsh area-code pattern, and no duplicate local authority codes were found in the source sheet.

However, the audit found 61 missing year-level ratio values across the long-format dataset. Twenty-three local authorities had at least one missing year. The largest coverage gaps were found for the Isles of Scilly and the City of London, which require caution in longitudinal comparisons.

The audit also flagged 110 statistical outlier records using a year-specific interquartile range rule. These should not automatically be treated as errors. In this dataset, recurring outliers mainly reflect structurally high-affordability-pressure areas, especially inner London boroughs.

## 4. Main analytical findings

Across local authorities with both 2002 and 2025 data, the average house price-to-earnings ratio increased from 5.11 in 2002 to 7.98 in 2025. The average absolute increase was 2.87 ratio points.

In 2025, the least affordable local authorities were:

  local_authority_name country_region_name  house_price_to_earnings_ratio
Kensington and Chelsea              London                          21.87
           Westminster              London                          16.44
Hammersmith and Fulham              London                          14.83
                Camden              London                          14.49
                 Brent              London                          13.89
           Mole Valley          South East                          13.51
                Ealing              London                          13.21
              Haringey              London                          13.02
  Richmond upon Thames              London                          12.58
             Elmbridge          South East                          12.52

The most affordable local authorities in 2025 were:

       local_authority_name      country_region_name  house_price_to_earnings_ratio
                   Hyndburn               North West                           3.86
                    Burnley               North West                           3.91
             Merthyr Tydfil                    Wales                           3.98
              Blaenau Gwent                    Wales                           4.02
                 Cumberland               North West                           4.18
                  Blackpool               North West                           4.27
              County Durham               North East                           4.28
              Middlesbrough               North East                           4.36
Kingston upon Hull, City of Yorkshire and The Humber                           4.46
          Neath Port Talbot                    Wales                           4.54

Regional summary for 2025:

     country_region_name  local_authorities  mean_ratio  median_ratio  min_ratio  max_ratio
                  London                 32   11.951875        11.540       9.59      21.87
              South East                 64    9.432187         9.400       6.82      13.51
         East of England                 45    8.727333         8.620       6.32      12.39
              South West                 26    8.313462         8.320       6.39      11.03
           East Midlands                 35    6.731143         6.830       5.36       7.96
           West Midlands                 30    6.947000         6.630       4.73       9.17
                   Wales                 22    5.788182         5.835       3.98       7.46
              North West                 35    5.759714         5.730       3.86       8.67
Yorkshire and The Humber                 15    5.698000         5.530       4.46       7.53
              North East                 12    4.920000         4.830       4.28       5.89

## 5. Quality flags created

Each year-level record was assigned a data quality flag:

- OK
- Missing ratio value
- Statistical outlier

The quality-flagged dataset allows users to analyse the data while preserving information about records that require caution or review.

## 6. Limitations

This audit does not explain the causes of housing affordability differences. It checks data quality and produces descriptive indicators only.

The outlier method is statistical, not substantive. Some outliers may be valid extreme values rather than errors.

Missing values were not imputed. They were preserved and flagged to avoid creating artificial estimates.

Boundary changes and local government reorganisation may affect comparability across time for some areas.

## 7. Employer relevance

This project demonstrates skills relevant to official statistics, public-sector analytics and research analyst roles:

- Python data cleaning
- SQL validation and summarisation
- missing-value auditing
- duplicate and code-pattern checks
- outlier detection
- local-authority public data handling
- reproducible reporting
- clear communication of limitations
- policy-facing statistical interpretation
