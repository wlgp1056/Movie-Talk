create table USERINFO(
   	user_id varchar2(100) not null primary key,
   	user_name varchar2(100) unique,
  	user_pw varchar2(100),
  	user_email varchar2(100),
  	user_gender varchar2(30));
  	
 select * from USERINFO;