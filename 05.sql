select avg(salary), max(salary), min(salary), sum(salary)
from employees;

select min(hire_date), max(hire_date)
from employees;

-- 과제: 최고월급과 최소월급의 차액을 조회하라.
select max(salary) - min(salary) 
from employees;
--count row의 갯수를 세다.
select count(*)
from employees;

-- 과제: 70번 부서원이 몇명인 지 조회하라.
select count(*)
from employees
where department_id = 70;
--pk field
select count(employee_id)
from employees;
-- key는 null값이올수 없다.
select count(manager_id)
from employees;

select avg(commission_pct)
from employees;

-- 과제: 조직의 평균 커미션율을 조회하라.
select avg(nvl(commission_pct, 0))
from employees;

select avg(all salary)
from employees;

select avg(distinct salary)
from employees;

-- 과제: 직원이 배치된 부서 개수를 조회하라.
select count(distinct department_id)
from employees;

-- 과제: 매니저 수를 조회하라.
select count(distinct manager_id)
from employees;
--select 절에 그룹 네임이 들어오면 group by 를 써야한다.
select department_id, count(employee_id)
from employees
group by department_id
order by department_id;

select employee_id
from employees
where department_id = 30;

select department_id, job_id, count(employee_id)
from employees
group by department_id, job_id
order by department_id;

--과제: 직업별 사원수를 조회하라.
select job_id, count(employee_id)
from employees
group by job_id;

select department_id, max(salary)
from employees
group by department_id
having department_id > 50;

select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000;

select department_id, max(salary) max_sal
from employees
group by department_id
having max_sal > 10000;

select department_id, max(salary)
from employees
where department_id > 50
group by department_id;
-- 그룹 함수는 where에쓸수없고 having에써야한다.
select department_id, max(salary)
from employees
where max(salary) > 10000
group by department_id;
-- 그룹 네임은 where, having 둘다가능
select job_id, sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by payroll;

--과제: 매니저ID, 매니저별 관리 직원들 중 최소 월급을 조회하라.
--      최소월급이 $6,000 초과여야한다.
select manager_id, min(salary) min_sal
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min_sal desc;

select max(avg(salary))
from employees
group by department_id;
--그룹함수안에 그룹함수가잇는것은 group by 로 n번실행할수잇게해주지만 1번 초과하면 안된다.
select sum(max(avg(salary)))
from employees
group by department_id;

select department_id, round(avg(salary))
from employees
group by department_id;

select department_id, round(avg(salary))
from employees;

-- 과제: 2001년, 2002년, 2003년도별 입사자 수를 조회하라.
select to_char(hire_date, 'yyyy') hire_year, count(*) emp_cnt
from employees
where to_char(hire_date, 'yyyy') in (2001, 2002, 2003)
group by to_char(hire_date, 'yyyy')
order by hire_year;

select sum(decode(to_char(hire_date, 'yyyy'), '2001', 1, 0)) "2001",
    sum(decode(to_char(hire_date, 'yyyy'), '2002', 1, 0)) "2002",
    sum(decode(to_char(hire_date, 'yyyy'), '2003', 1, 0)) "2003"
from employees;

select count(case when hire_date like '2001%' then 1 else null end) "2001",
    count(case when hire_date like '2002%' then 1 else null end) "2002",
    count(case when hire_date like '2003%' then 1 else null end) "2003"
from employees;

-- 과제: 직업별, 부서별 월급합을 조회하라.
--       부서는 20, 50, 80 이다.
select job_id, sum(decode(department_id, 20, salary)) "20",
    sum(decode(department_id, 50, salary)) "50",
    sum(decode(department_id, 80, salary)) "80"
from employees
group by job_id;