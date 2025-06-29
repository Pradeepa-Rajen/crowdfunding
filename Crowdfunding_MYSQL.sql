/*2.Build a Calendar Table using the Date Column Created Date ( Which has Dates from Minimum Dates and Maximum Dates) */


/* insert into calendars (id,created_at,Date,Year,Quarter,MonthNo,Month,YearMonth,WeekdayNo,WeekdayName, FinancialMOnth,FinancialQuarter)
select creator_id,created_at, 
           from_unixtime(created_at) as Date,
           year(from_unixtime(created_at)) as Year ,
          concat('Q',Quarter(from_unixtime(created_at))) as Quarter,
          month (from_unixtime(created_at)) as MonthNo,
          monthname (from_unixtime(created_at)) as Month,
           concat(year(from_unixtime(created_at)) ,'-', month (from_unixtime(created_at))) as YearMonth,
           weekday(from_unixtime(created_at)) as WeekdayNo,
           dayname(from_unixtime(created_at)) as WeekdayName,
          IF(MONTH( from_unixtime(created_at)) >= 4, MONTH( from_unixtime(created_at)) - 3, MONTH( from_unixtime(created_at)) + 9) AS financialMonth,
         CASE
           WHEN MONTH( from_unixtime(created_at)) IN (4, 5, 6) THEN 'Q1'
           WHEN MONTH( from_unixtime(created_at)) IN (7, 8, 9) THEN 'Q2'
           WHEN MONTH( from_unixtime(created_at)) IN (10, 11, 12) THEN 'Q3'
            ELSE 'Q4'
			END AS financialQuarter
	from projects;
 */


select * from calendars;

/* 4. Convert the Goal amount into USD using the Static USD Rate. */

select name,(goal*static_usd_rate) as GoalAmont from projects;


/*5.a  Total Number of Projects based on outcome */

select state as outcome , count(ProjectID) as TotalProjects from projects
group by state
order by count(ProjectID) desc;

/* 5.b. Total Number of Projects based on Locations */

select L.country as location , count(ProjectID) as TotalProjects from projects p
join crowdfunding_location L
where P.location_id = L.id
group by L.country
order by count(ProjectID) desc;

/* 5.c. Total Number of Projects based on  Category */
select c.name as categoryname , count(ProjectID) as TotalProjects from projects p
join crowdfunding_category c
where P.location_id = c.id
group by c.name
order by count(ProjectID) desc;

/* 5.d. Total Number of Projects based on  Year , Quarter , Month */
select year,quarter,month ,count(ProjectID) from projects p
join Calendars cal
where cal.id = P. creator_id
group by year,quarter,month
order by year,quarter,month;

/* 6.a. Amount Raised on successful projects, NumberOfBackers ,AverageDays  */

select sum(goal*static_usd_rate) as AmountRaised , 
        count(backers_count) as NumberOfBackers , 
		round(avg((deadline - created_at)/86400.0)) as AverageDays
        from projects 
        where state = "successful";
        
/* 7 a. Top Successful Projects  based on AmountRaised */

select name , sum(goal*static_usd_rate) as AmountRaised
from projects 
        where state = "successful"
        group by name
        order by AmountRaised desc limit 10;
        
/* 7 b. Top Successful Projects  based on NumberOfBackers */
        
select name , count(backers_count) as NumberOfBackers
from projects 
        where state = "successful"
        group by name
        order by NumberOfBackers desc limit 10;
        
/* 8a.Percentage of Successful Projects  by year,quarter,month */
        
select year,quarter,month ,
concat(round(sum( state  = "successful" )*100 / count(*),0),"%") as "Percentage by Year" from projects p
join Calendars cal
where cal.id = P. creator_id
group by year,quarter,month
order by year,quarter,month;

/* 8b. Total Number of Projects based on  Category */
select c.name as categoryname , 
concat(round(sum( state  = "successful" )*100 / count(*),0),"%") as  "Percentage by Category" from projects p
join crowdfunding_category c
where P.location_id = c.id
group by c.name
order by categoryname desc;


/* 8b. Total Number of Projects based on  Goal */

select   sum(goal*static_usd_rate)  as GoalAmount ,
concat(round(sum( state= "Successful")*100 / count(*),0),"%") as  "Percentage by goal",
case
when goal < 5000 then '0-5000'
when goal between  5000 and 50000 then "$5001 - $50000"
when goal between  50000 and 100000 then "$50001 - $100000"
when goal > 100000 then "More than $100000"
else "Unknown"
end as GoalRange 
from projects p
group by GoalRange ;



