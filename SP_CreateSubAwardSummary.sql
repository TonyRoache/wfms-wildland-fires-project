-- =============================================
-- Author:		<Anthony Roache>
-- Create date: <2024-01-09>
-- Description:	<SubAward Summary>
-- =============================================
CREATE PROCEDURE SubAwardSummary
AS 
SELECT 
	a.agency_code,
	a.agency_name,
	SUM(b.subaward_amount) AS subaward_total,
	b.sub_agency_name,
	b.subaward_report_month,
	b.subaward_report_year
FROM portfolio.dbo.agencies AS a
	inner join portfolio.dbo.sub_transaction AS b
		ON a.agency_code = b.agency_code
		WHERE b.award_amount > 0 and b.subaward_amount > 0 
		GROUP BY a.agency_code, a.agency_name, b.sub_agency_name, b.subaward_report_month, b.subaward_report_year
		ORDER BY a.agency_code, a.agency_name, b.sub_agency_name, b.subaward_report_month, b.subaward_report_year
GO


