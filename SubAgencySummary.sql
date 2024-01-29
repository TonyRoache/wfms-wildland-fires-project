-- Create by: Anthony Roache
-- Date Created: January 27, 2024
-- SQL Query to Select Agency Transactions Summary from primary sub-transaction table in Portfolio
-- database create from USASPENDING.COM csv containing 500k records
-- SP_SubAgencySummary created from code
SELECT 
      sub_agency_name
     ,SUM(subaward_amount) as award
	 ,action_fiscal_year
	 INTO portfolio.dbo.subagency_transactions
    FROM [Portfolio].[dbo].[sub_usda]
	GROUP BY sub_agency_name, action_fiscal_year
	ORDER BY sub_agency_name, action_fiscal_year
	
