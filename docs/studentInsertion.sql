use university

insert into student ( stu_id,national_ID,first_name,last_name,b_date,gpa,gender)
values(1122,306080,'enjy','ashraf','20\5\2006',3,'female')

insert into student ( stu_id,national_ID,first_name,last_name,b_date,gpa,gender)
values(1234,306070,'ola','mahmoud','15\7\2006',3.5,'female')

insert into student ( stu_id,national_ID,first_name,last_name,b_date,gpa,gender)
values(4321,306090,'areej','hesham','30\7\2006',3.1,'female')

insert into student ( stu_id,national_ID,first_name,last_name,b_date,gpa,gender)
values(1423,306020,'mohmmed','moez','11\11\2006',3.2,'male')

insert into student ( stu_id,national_ID,first_name,last_name,b_date,gpa,gender)
values(1342,306040,'abdelrhman','abbas','20\11\2006',3.3,'male')

insert into student ( stu_id,national_ID,first_name,last_name,b_date,gpa,gender)
values(3422,306060,'yasser','osama','9\2\2006',3.1,'male')

insert into student ( stu_id,national_ID,first_name,last_name,b_date,gpa,gender)
values(3425,306010,'habiba','ahmed','24\3\2006',3,'female')

insert into student ( stu_id,national_ID,first_name,last_name,b_date,gpa,gender)
values(4351,306050,'hazem','ahmed','8\9\2006',3,'male')

insert into student ( stu_id,national_ID,first_name,last_name,b_date,gpa,gender)
values(1245,306078,'hadeer','sarhan','2\1\2006',3,'female')

insert into student ( stu_id,national_ID,first_name,last_name,b_date,gpa,gender)
values(1478,306098,'mohammed','bakr','6\3\2006',4,'male')

select * from student;

update student set last_name='ashraf' where last_name='ahraf';
update student set last_name='montasar' where last_name='sarhan';