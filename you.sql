select tname
from tab;
-- pk 정하기 constraint 테이블명_칼럼명_pk primary key
-- constraint 은 무결성을 확보하기위해 쓴다.
-- primary key 는 테이블내에 유일해야하기때문에 null 값이올수없다.
-- primary key 특성에 위배되기 때문이다.
create table depts(
department_id number(3) constraint depts_deptid_pk primary key,
department_name varchar2(20));

desc user_constraints

select constraint_name, constraint_type, table_name
from user_constraints;

create table emps(
employee_id number(3) primary key,
emp_name varchar2(10) constraint emps_empname_nn not null,
email varchar2(20),
salary number(6) constraint emps_sal_ck check(salary > 1000),
department_id number(3),
constraint emps_email_uk unique(email),
constraint emps_deptid_fk foreign key(department_id)
    references depts(department_id));
    
select constraint_name, constraint_type, table_name
from user_constraints;

-- pk = not null + unique

insert into depts values(100, 'Development');
insert into emps values(500, 'musk', 'musk@gmail.com', 5000, 100);
insert into emps values(501, 'a', 'musk@gmail.net', 2000, 100);

drop table emps cascade constraints;
-- 테이블을 삭제할때 cascade로 제약조건까지 제거한다.
select constraint_name, constraint_type, table_name
from user_constraints;

select * from depts;
