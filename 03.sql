-- single fuction
desc dual
select * from dual;

select lower('SQL Course')
from dual;--전부 소문자

select upper('SQL Course')
from dual;-- 전부대문자

select initcap('SQL Course')
from dual;-- 단어의앞에만대문자

select last_name
from employees
where last_name = 'higgins';

select last_name
from employees
where last_name = 'Higgins';

select last_name
from employees
where lower(last_name) = 'higgins';
--lower의 리턴값과 higgins를 비교

select concat('Hello', 'World')
from dual;-- 'Hello'필드와 'World'필드를 받아서 하나의 row로리턴

select substr('HelloWorld', 2, 5)
from dual;

select substr('Hello', -1, 1)
from dual;

select length('Hello')
from dual;

select instr('Hello', 'l')
from dual;--리턴값이0보다크면 참.

select instr('Hello', 'w')
from dual;

select lpad(salary, 5, '*')
from employees;

select rpad(salary, 5, '*')
from employees;

select replace('JACK and JUE', 'J', 'BL')
from dual;

select trim('H' from 'Hello')
from dual;

select trim('l' from 'Hello')
from dual;

select trim(' ' from  ' Hello ')
from dual;

-- 과제: 위 query에서 ' '가 trim 됐음을, 눈으로 확인할 수 있게 조회하라.
select '|' || trim(' ' from  ' Hello ') || '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Comtains 'a'?"
from employees
where substr(job_id, 4) = 'PROG';

--과제: 위 query에서 , where 절을 like 로 refactoring 하라.
select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Comtains 'a'?"
from employees
where job_id like'%PROG';