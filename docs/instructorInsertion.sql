use university


insert into instructor(instructor_id,first_name,last_name,E_mail,dep_id)

values(1,'mohammed','youssif','mohmmed@gmail.com',8976);


insert into instructor(instructor_id,first_name,last_name,E_mail,dep_id)
values(2,'manar','oqpy','manar@gmail.com',9945);

insert into instructor(instructor_id,first_name,last_name,E_mail,dep_id)
values(3,'nabil','nasr_aldin','nabil@gmail.com',2267);

insert into instructor(instructor_id,first_name,last_name,E_mail,dep_id)
values(4,'gomaa','shaban','gomaa@gmail.com',7907); 

insert into instructor(instructor_id,first_name,last_name,E_mail,dep_id)
values(5,'mona','mohammed','mona@gmail.com',1166);

insert into instructor(instructor_id,first_name,last_name,E_mail,dep_id)
values(6,'hala','yasser','hala@gmail.com',7543);

select* from instructor;

delete from instructor
where instructor_id=7689;
