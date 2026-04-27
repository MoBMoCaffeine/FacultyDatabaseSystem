use university
insert into department(dep_id,department_name,capacity)
values (8976,'IT',50);

insert into department(dep_id,department_name,capacity)
values (9945,'AI',35);

insert into department(dep_id,department_name,capacity)
values (2267,'CS',40);

insert into department(dep_id,department_name,capacity)
values (7907,'IS',45);

insert into department(dep_id,department_name,capacity)
values (1166,'software engineering',60);

insert into department(dep_id,department_name,capacity)
values (7543,'cyber security',70);



select * from department;



update department
set instructor_id=1
where department_name='IT';

update department
set instructor_id=2
where department_name='AI';

update department
set instructor_id=3
where department_name='CS';


update department
set instructor_id=4
where department_name='IS';

update department
set instructor_id=5
where department_name='software engineering';


update department
set instructor_id=6
where department_name='cyber security';

