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

-- 과제: 50번 부서원들의 사번, 이름 부서번호로 구성된 DEPT50 view 를 만들어라.
--       view 구조는 EMPNO, EMPLOYEE, DETNO 이다.

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
--  with check option 이 검사하는것은 where절이다.
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
    nocache-- 대시시켜놓지않는다.
    nocycle;-- 순환하지않는다.
    
select x_xid_seq.nextval from dual;

-- 과제: DEPT 테이블의 DEPARTMENT_ID 칼럼의 field value 로 쓸 sequence 를 만들어라.
--       sequence는 400이상, 1000이하로 생성한다. 10씩 증가한다.

create sequence dept_deptid_seq
    start with 400
    increment by 10
    maxvalue 1000;
-- 과제: 위 sequence를 이용해서, DEPT 테이블에서 Education 부서를 insert 하라.
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

-- 과제: DEPT 테이블의 DEPARTMENT_NAME 에 대해 index를 만들어라.
create index detp_detpname_idx
on dept(department_name);

drop synonym team;

create synonym team
for departments;

select * from team;

-- 과제: EMPLOYEES 테이블에 EMPS synonym 을 만들어라.
create synonym EMPS
for employees;
