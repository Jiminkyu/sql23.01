--ddl null값을주는법은 null값을 명시하거나 column네임을 생략하면된다.
drop table hire_dates;

create table hire_dates(
emp_id number(8),
hire_date date default sysdate);
-- 기본값은 null이지만 default를 사용하면 기본값을 설정할수잇다.
-- data dictionary
-- meta data가 담겨잇는 공간

select tname
from tab
where tname not like 'BIN%';

insert into hire_dates values(1, to_date('2025/12/21'));
insert into hire_dates values(2, null);
insert into hire_dates(emp_id) values(3);

select * from hire_dates;

commit;

-- DCL (Data(Oracle) Control Language)
