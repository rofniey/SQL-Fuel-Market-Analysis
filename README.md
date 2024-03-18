# National Fuel Market Analysis

### Project Overview
This data analysis project aims to provide insights into the Argentina Fuel Prices between 2019 and 2023. By analyzing various aspects of the Fuel Market, we seek to identify trends, make data-driven recommendations, and gain deeper understanding of different company's performance.

### Data Sources
FP20 Analytics Challenge. You can download the file below.
[Download](https://zoomchartswebstorage.blob.core.windows.net/contest/National_Fuel_Market_Analysis_FP20C14_ENG.zip)
### Tools
- Microsoft SQL Server Management Studio (SSMS)
- Power BI
### Data Cleaning/Preparations
The following tasks were completed for Data Cleaning process.
1. Data Import to SSMS from a CSV file.
2. Data Cleaning and Data Formatting.
3. Creating Fact and Dimension Tables.
### Exploratory Data Analysis
Exploratory Data Analysis (EDA) included answering some of the key questions, such as:
- What is the price range for Petrol unleaded - 95/98 Octane in the Buenos Aires province?
- What are the top 10 companies by sales revenue in 2023?
- Which month had the greatest profit win in the prices of Petrol unleaded - 95/98 Octane during the year 2022?
- What is the price range for Petrol unleaded - 95/98 Octane in the Buenos Aires province?
### Data Anlaysis
#### Which company showed the greatest volatility in the prices of all its products during the year 2023?
```sql
WITH
	CompanyPriceStats AS (
		SELECT
			f.[Company ID (Seller)],
			AVG(f.[Price (Arg Pesos)]) AS Avg_Price
		FROM
			FACT_Fuel f
		WHERE
			YEAR([Date]) = 2023
		GROUP BY
			f.[Company ID (Seller)]
	),
	CompanyPriceStdDev AS (
		SELECT
			cps.[Company ID (Seller)],
			SQRT(SUM(POWER(f.[Price (Arg Pesos)] - cps.Avg_Price, 2)) / COUNT(f.[Price (Arg Pesos)])) AS Price_StdDev
		FROM
			FACT_Fuel f
		INNER JOIN
			CompanyPriceStats cps ON f.[Company ID (Seller)] = cps.[Company ID (Seller)]
		WHERE
			YEAR([Date]) = 2023
		GROUP BY
			cps.[Company ID (Seller)]
	)

SELECT TOP 1
    c.[Company Name],
    cpsd.Price_StdDev AS Price_Volatility
FROM
    CompanyPriceStdDev cpsd
INNER JOIN
    DIM_Company c
ON
	cpsd.[Company ID (Seller)] = c.[Company ID (Seller)]
ORDER BY
    cpsd.Price_StdDev DESC;
```
### Results/Findings
The Analysis Results are summarized as follows:
1. The Average price of Gasoil Grade 2 across all provinces is 317.80 Argetina Pesos.
2. PAN AMERICAN ENERGY LLC, SUCURSAL ARGENTINA has the highest total sales by city.
3. The price of Petrol Premium - 95 Octane changed from 149.00 to 745.00 between September 2022 and October 2023, making a price change of 596.00 Argetina Pesos.
4. CENTRO region has the highest average price for Compressed Natural Gas at 164.70 Argetina Pesos.
5. There is no significant difference in fuel prices between daytime and nighttime shifts.
6. The price range for Petrol unleaded - 95/98 Octane in the Buenos Aires province is 18.79 Argetina Pesos at Minimum and 569.20 Argetina Pesos at Maximum.
7. AUTOMOVIL CLUB ARGENTINO sell 1 106 different types of products.
8. BARRANCAS city in Patagonia region has the highest recorded price for any fuel type.
9. Top 10 companies by sales revenue in 2023.
    - AUTOMOVIL CLUB ARGENTINO
      - 376 402.00 Argetina Pesos.
    - OPEESA
      - 204 846.98 Argetina Pesos.
    - PAN AMERICAN ENERGY LLC, SUCURSAL ARGENTINA
      - 142 718.40 Argetina Pesos.
    - OPESSA
      - 127 516.60 Argetina Pesos.
    - DEHEZA S.A.I.C.F.I.
      - 47 653.80 Argetina Pesos.
    - PETROVALLE S.A.
      - 42 278.00 Argetina Pesos.
    - REFINERIA BAHIA BLANCA S.A.U.
      - 41 334.40 Argetina Pesos.
    - AZUL COMBUSTIBLES SA
      - 26 223.40 Argetina Pesos.
    - DEHEZA S.A.I.C.I.F.I.
      - 25 271.80 Argetina Pesos.
    - BARBERO HERMANOS S.A.
      - 24 591.60 Argetina Pesos.
