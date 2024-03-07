SELECT * FROM 1st_project.finance_11;
select year(issue_d) from finance_1;
alter table finance_1 modify column issue_d date;
select year(issue_d) as Year,sum(loan_amnt) as Total_loan from  finance_1 group by year;  #(year not coming b/c text constraint)

select f1.grade as grade,f1.sub_grade as sub_grade,sum(f2.revol_bal) as total_revol_bal from 
finance_1 as f1 join finance_2 as f2 using(id)
group by grade,sub_grade order by grade;

select f1.verification_status as v_status ,round(sum(f2.total_pymnt),2) as t_pymnt from
finance_1 as f1 join finance_2 as f2 using(id) group by v_status;

select distinct(f1.addr_state) as state ,last_value(f2.last_credit_pull_d) over( partition by f1.addr_state),loan_status
from finance_1 as f1 join finance_2 as f2 using (id)  ;

select distinct(f1.home_ownership) as home_ownership , last_value(f2.last_credit_pull_d) over (partition by home_ownership) from
finance_1 as f1 join finance_2 as f2 using (id) order by home_ownership;



create database 2ndproject;
