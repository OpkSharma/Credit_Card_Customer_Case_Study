select * from project01.casestudy01;

use casestudy01;

select count(gender) from project01.casestudy01;

/* (01) Customer Age in different range*/
select case when Customer_Age<20 then "0-20" when Customer_Age between 20 and 30 then "20-30" 
when Customer_Age between 30 and 40 then "30-40" when  Customer_Age between 40 and 50 then "40-50" 
when Customer_Age between 50 and 60 then "50-60" when Customer_Age between 60 and 70 then "60-70" 
when Customer_Age between 70 and 80 then "70-80" when Customer_Age>80 then "Above 80" END as Age_Range,Count(*)  
from project01.casestudy01 where Attrition_Flag = "Attrited Customer" group by Age_Range order by Age_Range ;

/* (02) Number of Males vs Females in Existing & Attrited Customers*/
SELECT SUM(IF (Gender="M",1,"NULL")) as MaleExistingCustomers, SUM(IF (Gender="F",1,"NULL")) as FemaleExistingCustomers
from project01.casestudy01 where Attrition_Flag="Existing Customer";
SELECT SUM(IF (Gender="M",1,"NULL")) as MaleAttritedCustomers, SUM(IF (Gender="F",1,"NULL")) as FemaleAttritedCustomers
from project01.casestudy01 where Attrition_Flag="Attrited Customer";

/* (03) Dependent Count wise distribution of existing and attrited customers*/
SELECT Dependent_count,Count(*) from project01.casestudy01 where Attrition_Flag="Existing Customer" group by Dependent_count Order by count(*);
SELECT Dependent_count,Count(*) from project01.casestudy01 where Attrition_Flag="Attrited Customer" group by Dependent_count Order by count(*);

/* (04) Education Level wise distribution of existing and attrited customers*/
SELECT Education_Level,Count(*) from project01.casestudy01 where Attrition_Flag="Existing Customer" group by Education_Level order by Count(*);
SELECT Education_Level,Count(*) from project01.casestudy01 where Attrition_Flag="Attrited Customer" group by Education_Level order by Count(*);

/* (05)Matrital Status wise distribution of existing and attrited customer*/
SELECT Marital_Status,Count(*) from project01.casestudy01 where Attrition_Flag="Existing Customer" group by Marital_Status order by Count(*);
SELECT Marital_Status,Count(*) from project01.casestudy01 where Attrition_Flag="Attrited Customer" group by Marital_Status order by Count(*);

/* (06) Card Category wise distribution of existing and attrited customers*/
SELECT Card_Category,Count(*) from project01.casestudy01 where Attrition_Flag="Existing Customer" group by Card_Category order by Count(*);
SELECT Card_Category,Count(*) from project01.casestudy01 where Attrition_Flag="Attrited Customer" group by Card_Category order by Count(*);
casestudy01
/* (07) Distribution of Attrited customers based on Months on book*/
SELECT CASE WHEN Months_on_book<20 then "0-20" when Months_on_book between 20 and 30 then "20-30"
when Months_on_book between 30 and 40 then "30-40" when Months_on_book between 40 and 50 then "40-50"
when Months_on_book between 50 and 60 then "50-60" when Months_on_book>60 then "Above 60" END as Monthonbook_Range,
Count(*) from project01.casestudy01 where Attrition_Flag="Attrited Customer" group by Monthonbook_Range order by Monthonbook_Range;

/* (08) txisting and attrited customers based on Inactive months*/
SELECT Months_Inactive_12_mon, Count(*) from project01.casestudy01 where Attrition_Flag="Attrited Customer" group by Months_Inactive_12_mon order by Count(*);
SELECT Months_Inactive_12_mon, Count(*) from project01.casestudy01 where Attrition_Flag="Existing Customer" group by Months_Inactive_12_mon order by Count(*);

/* (09) Existing and attrited customers based on Average Utilization*/
SELECT Attrition_Flag, ROUND(Avg(Avg_Utilization_Ratio)*100,2) as AvgUtilization from project01.casestudy01 where Attrition_Flag="Attrited Customer";
SELECT Attrition_Flag, ROUND(Avg(Avg_Utilization_Ratio)*100,2) as AvgUtilization from project01.casestudy01 where Attrition_Flag="Existing customer";
