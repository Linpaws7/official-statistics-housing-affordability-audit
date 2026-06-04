# Official Statistics Housing Affordability Data Quality Audit

This project audits an official ONS housing-affordability dataset covering local-authority house price-to-earnings ratios in England and Wales from 2002 to 2025.

The project demonstrates an official-statistics-style workflow using Python and DuckDB SQL to check data coverage, missing values, duplicate records, local-authority code validity, statistical outliers, regional affordability patterns and analysis-ready outputs.

## Project Aim

The aim is not to build a causal housing model. The aim is to show the data-quality discipline expected in official-statistics and public-sector analyst roles: validate the data before analysis, preserve uncertainty, flag records requiring review and communicate limitations clearly.

## Dataset

Source: Office for National Statistics  
Dataset: House price to residence-based earnings ratio  
Selected sheet: 5c  
Geography: Local authority districts, England and Wales  
Period: 2002 to 2025  
Measure: Ratio of median house price to median gross annual residence-based earnings

## Tools Used

- Python
- pandas
- DuckDB SQL
- matplotlib
- Excel

## Main Outputs

- 318 local authorities checked
- 7,632 year-level records created after reshaping
- 61 missing ratio values flagged
- 110 statistical outlier records identified
- 0 duplicate local-authority codes
- 0 invalid local-authority code patterns
- Quality-flagged long-format dataset created
- Final PDF audit report produced

## Key Findings

Across local authorities with both 2002 and 2025 data, the average house price-to-earnings ratio increased from 5.11 in 2002 to 7.98 in 2025.

In 2025, the least affordable local authorities included Kensington and Chelsea, Westminster, Hammersmith and Fulham, Camden and Brent.

London had the highest regional median house price-to-earnings ratio in 2025.

## Repository Structure

```text
data/
  processed/
outputs/
  figures/
  tables/
sql/
  01_housing_affordability_quality_audit.sql
official_statistics_housing_affordability_audit.ipynb
official_statistics_housing_affordability_audit.pdf
README.md
