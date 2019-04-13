-- create the database
drop database if exists call_center;
create database call_center;

use call_center;

-- create the tables

create table counselor(
	counselor_id int primary key auto_increment comment 'ID number of counselor'
    , counselor_first_name varchar(200) comment 'First name (given name) of the counselor'
    , counselor_last_name varchar(200) comment 'Last name (family name) of the counselor'
    , counselor_employment_type enum('volunteer', 'employee') comment 'The employment level of the counselor'
) comment 'Represents a employee or volunteer';

create table caller(
	caller_id int primary key auto_increment comment 'ID of the caller'
    , caller_first_name varchar(200) comment 'The first name (given name) of the caller'
    , caller_last_name varchar(200) comment 'The last name (family name) of the caller'
    , caller_sex varchar(10) comment 'The sex of the caller (if known)'
    , caller_address varchar(200) comment 'Address fo the caller. If null caller is homeless'
    , zip_code varchar(10) comment 'Zip coe of caller\'s address'
    , caller_relationship_status enum('single', 'married', 'divorced', 'engaged', 'dating'
		, 'living together', 'separated', 'widowed', 'unkonw')
        comment 'Relationship status of caller'
	, caller_sexual_orientation enum('bisexual', 'heterosexual', 'lesbian/gay', 'questioning'
		, 'unknown') comment 'Sexual orientation of caller'
	, caller_email varchar(200) comment 'The email of teh caller'
    , military_status enum('Active', 'Inactive', 'verteran') comment 'if caller has an active,
		inactive, veteran, or unknown military status'
	, military_branch enum('Air Force', 'Army', 'Namy', 'Coast Guard', 'National Gaurd')
		comment 'Identifies which branc of military the caller is in'
	, caller_phone_number varchar(15) comment 'caller phone number'
)comment 'Represents a caller';

create table zip_codes(
	zip_code varchar(10) primary key comment 'zipcode of caller'
    , city_name varchar(200) not null comment 'Name of city'
    , state varchar(200) not null comment 'State of City'
)comment 'ZipCode of caller\'s residence';

create table calls (
	call_id int primary key auto_increment comment 'ID number of the caller'
	, call_date date not null comment 'The date the call too place'
	, call_start_time time not null comment 'The start time of the call'
	, call_end_time time not null comment 'The end time of the call'
	, call_notes varchar(300) not null comment 'Notes concerning the call'
	, was_suggested_service boolean comment 'True/False if a service was referred'
	, law_enforcement_needed boolean comment 'True/False if police was called'
	, ambulance_called boolean comment 'True/False if ambulance was called'
	, service_agency_id int comment 'ID of the service that was referred to caller.'
	, counselor_id int not null comment 'ID of the counselor that took the call'
	, caller_id int not null comment 'ID fo the Caller'
	, constraint calls_fk_counselor
		foreign key (counselor_id)
		references counselor (counselor_id)
	, constraint calls_fk_caller
		foreign key (caller_id)
        references caller(caller_id)
)comment 'Represents a call that took place';

create table service_agencies(
	service_agency_id int primary key auto_increment comment 'ID of service agency'
    , service_agency_name varchar(200) not null comment 'Name of service agency'
    , service_provided varchar(200) not null comment 'Service provided by agency'
    , service_description varchar(300) not null comment 'Short description of service provided'
    , service_phone varchar(15) not null comment 'Phone number of a service agency'
    , zip_code varchar(10) not null comment 'zipcode of service agency'
    , constraint service_agencies_fk_zipcode
		foreign key (zip_code)
        references zip_codes(zip_code)
)comment 'Represents service agencies that get referred';

insert into calls values
(1,'1-22-2017','2:19:00','7:46:00','morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non',TRUE,TRUE,TRUE,1,1,6)
,(2,'5-1-2018','1:20:00','9:58:00','proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue',TRUE,TRUE,TRUE,2,2,6)
,(3,'8-2-2016','3:02:00','6:26:00','praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi',TRUE,FALSE,FALSE,3,3,7)
,(4,'9-26-2016','1:23:00','1:35:00','lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum',FALSE,FALSE,FALSE,4,4,5)
,(5,'7-14-2016','0:32:00','8:55:00','montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus',TRUE,TRUE,TRUE,5,5,4)
,(6,'7-16-2015','12:27:00','7:52:00','ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis',TRUE,TRUE,FALSE,6,6,6)
,(7,'7-18-2018','18:54:00','17:43:00','natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida',TRUE,TRUE,FALSE,7,7,5)
,(8,'4-27-2016','23:26:00','14:17:00','venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus',TRUE,FALSE,TRUE,8,8,6)
,(9,'4-12-2018','5:55:00','22:02:00','neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi',TRUE,TRUE,FALSE,9,9,2)
,(10,'3-26-2018','13:09:00','10:36:00','ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices',FALSE,TRUE,TRUE,10,10,7)
,(11,'4-19-2017','5:48:00','23:25:00','metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu',TRUE,TRUE,TRUE,11,11,6)
,(12,'3-14-2018','11:05:00','12:09:00','morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet',FALSE,TRUE,TRUE,12,12,4)
,(13,'4-11-2018','17:17:00','11:31:00','massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at',TRUE,FALSE,TRUE,13,13,5)
,(14,'5-13-2015','15:04:00','8:53:00','dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst',TRUE,TRUE,TRUE,14,14,2)
,(15,'7-13-2015','3:32:00','7:56:00','tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla',TRUE,TRUE,TRUE,15,15,1)
,(16,'1-15-2018','14:26:00','1:19:00','auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis',FALSE,TRUE,FALSE,16,16,2)
,(17,'10-20-2015','20:52:00','17:03:00','libero nam dui proin leo odio porttitor id consequat in',FALSE,TRUE,TRUE,17,17,1)
,(18,'3-5-2017','11:58:00','17:15:00','et tempus semper est quam pharetra magna ac consequat metus sapien',FALSE,TRUE,FALSE,18,18,2)
,(19,'4-1-2018','19:39:00','12:16:00','nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu',TRUE,FALSE,TRUE,19,19,3)
,(20,'5-27-2017','19:22:00','1:48:00','nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor',TRUE,FALSE,TRUE,20,20,5)
,(21,'9-16-2016','16:40:00','5:55:00','erat id mauris vulputate elementum nullam varius nulla facilisi cras',FALSE,FALSE,FALSE,21,21,1)
,(22,'4-3-2016','1:44:00','18:27:00','orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula',FALSE,FALSE,FALSE,22,22,4)
,(23,'12-8-2014','14:14:00','6:17:00','enim blandit mi in porttitor pede justo eu massa donec dapibus duis,TRUE,food_assistance',TRUE,FALSE,FALSE,23,23,3)
,(24,'5-10-2018','0:33:00','2:35:00','turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue',FALSE,TRUE,FALSE,24,24,7)
,(25,'5-15-2014','19:56:00','7:16:00','morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit',TRUE,FALSE,TRUE,25,25,5)
,(26,'8-7-2017','5:02:00','15:53:00','mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy',TRUE,TRUE,TRUE,26,26,4)
,(27,'11-11-2014','3:40:00','22:01:00','vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna',TRUE,FALSE,FALSE,27,27,7)
,(28,'6-2-2014','19:55:00','7:46:00','metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et',FALSE,TRUE,FALSE,28,28,3)
,(29,'3-30-2018','7:55:00','14:18:00','ac est lacinia nisi venenatis tristique fusce congue diam id ornare',FALSE,TRUE,TRUE,29,29,6)
,(30,'5-30-2016','12:32:00','0:25:00','condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan',FALSE,FALSE,TRUE,30,30,3)
,(31,'3-13-2016','10:31:00','23:40:00','tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo',FALSE,FALSE,FALSE,31,31,4)
,(32,'2-17-2017','17:24:00','16:28:00','justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus',TRUE,TRUE,FALSE,32,32,4)
,(33,'11-21-2017','19:43:00','23:47:00','scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis',FALSE,TRUE,TRUE,33,33,2)
,(34,'9-3-2018','4:12:00','21:50:00','velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat',TRUE,TRUE,TRUE,34,34,5)
,(35,'7-30-2014','19:41:00','21:05:00','quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse',FALSE,FALSE,TRUE,35,35,6)
,(36,'10-4-2015','0:30:00','2:26:00','lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci',FALSE,FALSE,TRUE,36,36,2)
,(37,'10-13-2015','1:28:00','6:18:00','faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel',FALSE,FALSE,FALSE,37,37,1)
,(38,'10-14-2016','3:54:00','0:46:00','nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi',FALSE,FALSE,TRUE,38,38,1)
,(39,'12-1-2015','8:52:00','23:32:00','posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi',FALSE,TRUE,FALSE,39,39,2)
,(40,'4-23-2014','23:22:00','22:15:00','diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae',FALSE,FALSE,TRUE,40,40,5)
,(41,'12-18-2016','7:03:00','6:57:00','leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices',TRUE,TRUE,TRUE,41,41,2)
,(42,'1-9-2018','9:16:00','14:54:00','varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam',FALSE,FALSE,FALSE,42,42,7)
,(43,'5-21-2015','3:06:00','21:29:00','aliquet maecenas leo odio condimentum id luctus nec molestie sed',FALSE,TRUE,TRUE,43,43,6)
,(44,'9-11-2017','19:40:00','20:37:00','phasellus in felis donec semper sapien a libero nam dui',FALSE,TRUE,TRUE,44,44,4)
,(45,'9-2-2014','19:53:00','16:23:00','nulla dapibus dolor vel est donec odio justo sollicitudin ut',TRUE,FALSE,FALSE,45,45,5)
,(46,'11-10-2014','18:25:00','18:48:00','viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac,TRUE,suicide_hotline',TRUE,TRUE,FALSE,46,46,2)
,(47,'10-7-2016','11:01:00','4:48:00','erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis',TRUE,TRUE,TRUE,47,47,4)
,(48,'3-24-2016','5:36:00','1:32:00','eu est congue elementum in hac habitasse platea dictumst morbi',TRUE,FALSE,TRUE,48,48,6)
,(49,'5-2-2016','15:45:00','21:57:00','commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id',FALSE,FALSE,TRUE,49,49,2)
,(50,'10-1-2016','11:34:00','11:58:00','ligula nec sem duis aliquam convallis nunc proin at turpis a',FALSE,FALSE,TRUE,50,50,3)
;




































