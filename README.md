# Crowdfunding project by Pradeepa 
In this projects, have used four tools MS Excel ,Power BI ,Tableau and MySQL Workbench to answer the same set of business questions using Kickstarter dataset.

**Workflow:**
Converted Epoch time to regular date format.
Created Calendar Table with year, month, financial quarter, etc.
Converted goal amount into USD using a static rate
Joined tables: Projects, Locations, Calendar, Creator, Category.
Solved business questions using each tools.
Designed dashboards in Excel, Power BI, and Tableau
SQL was used only for queries, not for dashboards.

**Instructions:**
1. Calendar Table.xlsx -- Has data about year, month, financial quarter, etc. in date format
2. Crowdfunding_MYSQL.sql -- Solved business questions using MySQL Workbench
3.  Crowdfunding_Tableau.twbx - Solved business questions using Tableau
4.  Crowdfunding_PowerBi.pbix - Solved business questions using PowerBI
5.  Kickstarter_crowdfunding_project.pptx -- Presentation about the Crowdfunding project

** Business questions :**
1. Convert the Date fields to Natural Time ( Currently the dates are in Epoch time Read the attached Artical for Reference on Epoch Time 
             https://www.epochconverter.com/ )
2. Build a Calendar Table using the Date Column Created Date ( Which has Dates from Minimum Dates and Maximum Dates)
  Add all the below Columns in the Calendar Table using the Formulas.
   A.Year
   B.Monthno
   C.Monthfullname
   D.Quarter(Q1,Q2,Q3,Q4)
   E. YearMonth ( YYYY-MMM)
   F. Weekdayno
   G.Weekdayname
   H.FinancialMOnth ( April = FM1, May= FM2  …. March = FM12)
   I. Financial Quarter ( Quarters based on Financial Month FQ-1 . FQ-2..)

3. Build the Data Model using the attached Excel Files.

4. Convert the Goal amount into USD using the Static USD Rate.

5. Projects Overview KPI :
     Total Number of Projects based on outcome 
     Total Number of Projects based on Locations
     Total Number of Projects based on  Category
     Total Number of Projects created by Year , Quarter , Month

6.  Successful Projects
     Amount Raised 
     Number of Backers
     Avg NUmber of Days for successful projects

7 . Top Successful Projects :
    Based on Number of Backers
    Based on Amount Raised.

8. Percentage of Successful Projects overall
   Percentage of Successful Projects  by Category
   Percentage of Successful Projects by Year , Month etc..
   Percentage of Successful projects by Goal Range ( decide the range as per your need )
   `created_at_ natural_time`
 


