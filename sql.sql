create table course_tbl_02(
	sub_id varchar2(5) not null primary key,
	sub_name varchar2(40),
	credit number(6),
	lec_id number(6) not null,
	week number(2),
	start_hour number(4),
	end_hour number(4),
	foreign key(lec_id) references lecturer_tbl_02 (id)
)
create table lecturer_tbl_02(
	id number(6) not null primary key,
	name varchar2(10),
	major varchar2(30),
	field varchar2(30)
)
insert into course_tbl_02 values('10001','프로그래밍',2,1,1,0900,1100);
insert into course_tbl_02 values('10002','객체지향 프로그래밍',2,2,2,0900,1100);
insert into course_tbl_02 values('10003','자료구조',3,4,2,0900,1100);
insert into course_tbl_02 values('10004','알고리즘',3,4,4,0900,1100);
insert into course_tbl_02 values('20001','시스템 프로그래밍',2,5,1,1300,1600);
insert into course_tbl_02 values('20002','운영체체',3,5,2,1500,1800);
insert into course_tbl_02 values('20003','오토마타와 컴파일러',3,5,3,1330,1530);
insert into course_tbl_02 values('30001','소프트웨어 공학',2,3,4,1330,1530);
insert into course_tbl_02 values('30002','시스템 분석 및 설계',3,3,5,0900,1200);
insert into course_tbl_02 values('40001','데이터베이스',3,2,5,1300,1600);

insert into lecturer_tbl_02 values(1,'김교수','소프트웨어공학','알고리즘');
insert into lecturer_tbl_02 values(2,'이교수','소프트웨어공학','인공지능');
insert into lecturer_tbl_02 values(3,'박교수','소프트웨어공학','빅데이터');
insert into lecturer_tbl_02 values(4,'우교수','소프트웨어공학','데이터베이스');
insert into lecturer_tbl_02 values(5,'최교수','소프트웨어공학','임베디드 시스템');
insert into lecturer_tbl_02 values(6,'강교수','소프트웨어공학','멀티미디어');
insert into lecturer_tbl_02 values(7,'황교수','모바일시스템공학','네트워크');

select decode(length(start_hour), 3, '0' || substr(start_hour,1,1) || ':' || substr(start_hour,2,2), 4, substr(start_hour,1,2) || ':' || substr(start_hour,3,2)) from course_tbl_02

select c.sub_id, c.sub_name, c.credit, l.name, 
decode(c.week, 1,'월요일', 2,'화요일', 3,'수요일', 4,'목요일', 5,'금요일', 6,'토요일') week, 
decode(length(c.start_hour), 3, '0' || substr(c.start_hour,1,1) || ':' || substr(c.start_hour,2,2), 4, substr(c.start_hour,1,2) || ':' || substr(c.start_hour,3,2)) start_hour, 
decode(length(c.end_hour), 3, '0' || substr(c.end_hour,1,1) || ':' || substr(c.end_hour,2,2), 4, substr(c.end_hour,1,2) || ':' || substr(c.end_hour,3,2)) end_hour
from course_tbl_02 c, lecturer_tbl_02 l
where c.lec_id = l.id