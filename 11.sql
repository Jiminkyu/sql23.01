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

-- κ³Όμ : 50λ²? λΆ????€? ?¬λ²?, ?΄λ¦? λΆ??λ²νΈλ‘? κ΅¬μ±? DEPT50 view λ₯? λ§λ€?΄?Ό.
--       view κ΅¬μ‘°? EMPNO, EMPLOYEE, DETNO ?΄?€.

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
--  with check option ?΄ κ²??¬??κ²μ? where? ?΄?€.
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
    nocache-- ????μΌλμ§????€.
    nocycle;-- ???μ§????€.
    
select x_xid_seq.nextval from dual;

-- κ³Όμ : DEPT ??΄λΈμ DEPARTMENT_ID μΉΌλΌ? field value λ‘? ?Έ sequence λ₯? λ§λ€?΄?Ό.
--       sequence? 400?΄?, 1000?΄?λ‘? ??±??€. 10?© μ¦κ???€.

create sequence dept_deptid_seq
    start with 400
    increment by 10
    maxvalue 1000;
-- κ³Όμ : ? sequenceλ₯? ?΄?©?΄?, DEPT ??΄λΈμ? Education λΆ??λ₯? insert ??Ό.
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

-- κ³Όμ : DEPT ??΄λΈμ DEPARTMENT_NAME ? ???΄ indexλ₯? λ§λ€?΄?Ό.
create index detp_detpname_idx
on dept(department_name);

drop synonym team;

create synonym team
for departments;

select * from team;

-- κ³Όμ : EMPLOYEES ??΄λΈμ EMPS synonym ? λ§λ€?΄?Ό.
create synonym EMPS
for employees;
