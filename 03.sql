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

select lpad(salary, 5,'*')
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

-- 과제: 이름이 J나 A나 M으로 시작하는 사원들의 이름, 이름의 글자수를 조회하라.
--         이름의 첫글자는 대문자, 나머지는 소문자로 출력한다.
select initcap(last_name), length(last_name)
from employees
where last_name like'J%' or
         last_name like'A%' or
         last_name like'M%';

select round(45.926, 2)
from dual;
select trunc(45.926, 2)
from dual;

select round(45.923, 0), round(45.923)
from dual;
select trunc(45.923, 0), trunc(45.923)
from dual;

--과제: 사원들의 이름, 월급, 15.5% 인상된 월급(New Salary, 정수), 인상액(Increase)을 조회하라.

select last_name, salary, 
        round(1.155 * salary) "New Salary", 
        0.155 * salary "increase"
from employees;

select sysdate
from dual;

select sysdate + 1
from dual;

select sysdate - 1
from dual;

select sysdate - sysdate
from dual;

select last_name, sysdate - hire_date
from employees
where department_id = 90;

select months_between('2023/12/31', '2022/12/31')
from dual;

select add_months('2024/01/18', 3)
from dual;

select next_day('2023/01/18', 5)
from dual;-- 1월 18일 이후로 첫번째 목요일
-- 일월화수목금토 - 1234567
select next_day('2023/01/18', 4)
from dual;--1월 18일 이후로 첫번째 수요일

select next_day('2023/01/18', 'thursday')
from dual;

select next_day('2023/01/18', 'thu')
from dual;

select last_day('2023/01/18')
from dual;

-- 과제: 20년 이상  재직한 사원들의 이름, 첫월급일을 조회하라.
--        월급은 매월 말일에 지급한다.

select last_name, last_day(hire_date)
from employees
where months_between(sysdate, hire_date) >= 20 * 12 ;

-- 과제: 사원들의 이름, 월급, 월급 그래프를 조회하라.
--         그래프는 $1000 당 *하나를 표시한다.

select last_name,salary, rpad(' ', salary / 1000 + 1,'*') sal
from employees
order by sal desc;

