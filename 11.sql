create view empvu80 as
    select employee_id, last_name, department_id
    from employees
    where department_id = 80;
    
desc empvu80

select * from empvu80;

select * from (
    select employee_id, last_name, department_id
    from employees
    where department_id = 80);
    
create or replace view empvu80 as
    select employee_id, job_id
    from employees
    where department_id = 80;
    
desc empvu80

-- Í≥ºÏ†ú: 50Î≤? Î∂??Ñú?õê?ì§?ùò ?Ç¨Î≤?, ?ù¥Î¶? Î∂??ÑúÎ≤àÌò∏Î°? Íµ¨ÏÑ±?êú DEPT50 view Î•? ÎßåÎì§?ñ¥?ùº.
--       view Íµ¨Ï°∞?äî EMPNO, EMPLOYEE, DETNO ?ù¥?ã§.

create or replace view dept50 as
    select employee_id EMPNO, last_name EMPLOYEE, department_id DEPTNO
    from employees
    where department_id = 50;
    
desc dept50
select * from dept50;

create or replace view dept50(empno, employee, deptno) as
    select employee_id, last_name, department_id
    from employees
    where department_id = 50
    with check option constraint dept50_ck;
    
create table teams as
    select department_id team_id, department_name team_name
    from hr.departments;
    
create view team50 as
    select *
    from teams
    where team_id = 50;
    
select * from team50;

select count(*) from teams;

insert into team50
values(300, 'Maketing');

select count(*) from teams;
    
create or replace view team50 as
    select *
    from teams
    where team_id = 50
    with check option;
--  with check option ?ù¥ Í≤??Ç¨?ïò?äîÍ≤ÉÏ? where?†à?ù¥?ã§.
insert into team50 values(50, 'IT Support');
select count(*) from teams;
insert into team50 values(301, 'IT Support');

create or replace view empvu10(employee_num, employee_name, job_title) as
    select employee_id, last_name, job_id
    from employees
    where department_id = 10
    with read only;
    
insert into empvu10 values(501, 'abel', 'Sales');
select * from empvu10;

drop sequence team_teamid_seq;

create sequence team_teamid_seq;

select team_teamid_seq.nextval from dual;
select team_teamid_seq.nextval from dual;
select team_teamid_seq.currval from dual;

insert into teams
values(team_teamid_seq.nextval, 'Marketing');

select * from teams
where team_id < 5;

create sequence x_xid_seq
    start with 10
    increment by 5
    maxvalue 20 
    nocache-- ???ãú?ãúÏºúÎÜìÏß??ïä?äî?ã§.
    nocycle;-- ?àú?ôò?ïòÏß??ïä?äî?ã§.
    
select x_xid_seq.nextval from dual;

-- Í≥ºÏ†ú: DEPT ?Öå?ù¥Î∏îÏùò DEPARTMENT_ID ÏπºÎüº?ùò field value Î°? ?ì∏ sequence Î•? ÎßåÎì§?ñ¥?ùº.
--       sequence?äî 400?ù¥?ÉÅ, 1000?ù¥?ïòÎ°? ?Éù?Ñ±?ïú?ã§. 10?î© Ï¶ùÍ??ïú?ã§.

create sequence dept_deptid_seq
    start with 400
    increment by 10
    maxvalue 1000;
-- Í≥ºÏ†ú: ?úÑ sequenceÎ•? ?ù¥?ö©?ï¥?Ñú, DEPT ?Öå?ù¥Î∏îÏóê?Ñú Education Î∂??ÑúÎ•? insert ?ïò?ùº.
insert into dept(department_id, department_name)
values(dept_deptid_seq.nextval, 'Education');

commit;

drop index emp_lastname_idx;

create index emp_lastname_idx
on employees(last_name);

select last_name, rowid
from employees;

select last_name
from employees
where rowid =  'AAAEAbAAEAAAADNAAe';

select index_name, index_type, table_owner, table_name
from user_indexes;

-- Í≥ºÏ†ú: DEPT ?Öå?ù¥Î∏îÏùò DEPARTMENT_NAME ?óê ???ï¥ indexÎ•? ÎßåÎì§?ñ¥?ùº.
create index detp_detpname_idx
on dept(department_name);

drop synonym team;

create synonym team
for departments;

select * from team;

-- Í≥ºÏ†ú: EMPLOYEES ?Öå?ù¥Î∏îÏóê EMPS synonym ?ùÑ ÎßåÎì§?ñ¥?ùº.
create synonym EMPS
for employees;
