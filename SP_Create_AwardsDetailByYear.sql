USE [Portfolio]
GO
/****** Object:  StoredProcedure [dbo].[AwardDetailByYear]    Script Date: 1/21/2024 5:58:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AwardDetailByYear]
@ThisYear nchar(10)
AS
SELECT 
	a.agency_code,
	a.agency_name,
	a.sub_agency_code,
	a.sub_agency_name,
	a.award_amount,
	b.subaward_amount, 
	DATENAME(MONTH,b.subaward_action_date)+'-'+TRIM(STR(DATEPART(yyyy,b.subaward_action_date))) AS award_term,
	b.subaward_report_month AS reportmonth,
	b.subaward_report_year AS reportyear
	FROM awards AS a
		inner join award_data AS b
			ON  a.subaward_report_year = b.subaward_report_year
			and a.award_fain = b.award_fain
			WHERE a.subaward_report_year = @ThisYear
			GROUP BY a.agency_code, a.agency_name, a.sub_agency_code, a.sub_agency_name, a.award_amount,
				b.subaward_report_month, b.subaward_report_year,b.subaward_amount, subaward_action_date
			ORDER BY a.agency_code, a.agency_name, a.sub_agency_code, a.sub_agency_name, a.award_amount,
				b.subaward_report_month, b.subaward_report_year,b.subaward_amount, subaward_action_date
