use call_center;

create table if not exists calls (
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
/*
	AUTHOR: Cash Carlson
    DATE: 2019-04-12
    DESCRIPTION: Insert all rows for calls
*/
INSERT INTO calls VALUES (1,'2017-01-22','2:19:00','7:46:00','morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non',TRUE,TRUE,TRUE,6,1,1)
, (2,'2018-05-01','1:20:00','9:58:00','proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue',TRUE,TRUE,TRUE,6,2,2)
, (3,'2016-08-02','3:02:00','6:26:00','praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi',TRUE,FALSE,FALSE,7,3,3)
, (4,'2016-09-26','1:23:00','1:35:00','lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum',FALSE,FALSE,FALSE,5,4,4)
, (5,'2016-07-14','0:32:00','8:55:00','montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus',TRUE,TRUE,TRUE,4,5,5)
, (6,'2015-07-16','12:27:00','7:52:00','ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis',TRUE,TRUE,FALSE,6,6,6)
, (7,'2018-07-18','18:54:00','17:43:00','natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida',TRUE,TRUE,FALSE,5,7,7)
, (8,'2016-04-27','23:26:00','14:17:00','venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus',TRUE,FALSE,TRUE,6,8,8)
, (9,'2018-04-12','5:55:00','22:02:00','neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi',TRUE,TRUE,FALSE,2,9,9)
, (10,'2018-03-26','13:09:00','10:36:00','ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices',FALSE,TRUE,TRUE,7,10,10)
, (11,'2017-04-19','5:48:00','23:25:00','metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu',TRUE,TRUE,TRUE,6,11,11)
, (12,'2018-03-14','11:05:00','12:09:00','morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet',FALSE,TRUE,TRUE,4,12,12)
, (13,'2018-04-11','17:17:00','11:31:00','massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at',TRUE,FALSE,TRUE,5,13,13)
, (14,'2015-05-13','15:04:00','8:53:00','dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst',TRUE,TRUE,TRUE,2,14,14)
, (15,'2015-07-13','3:32:00','7:56:00','tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla',TRUE,TRUE,TRUE,1,15,15)
, (16,'2018-01-15','14:26:00','1:19:00','auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis',FALSE,TRUE,FALSE,2,16,16)
, (17,'2015-10-20','20:52:00','17:03:00','libero nam dui proin leo odio porttitor id consequat in',FALSE,TRUE,TRUE,1,17,17)
, (18,'2017-03-05','11:58:00','17:15:00','et tempus semper est quam pharetra magna ac consequat metus sapien',FALSE,TRUE,FALSE,2,18,18)
, (19,'2018-04-01','19:39:00','12:16:00','nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu',TRUE,FALSE,TRUE,3,19,19)
, (20,'2017-05-27','19:22:00','1:48:00','nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor',TRUE,FALSE,TRUE,5,20,20)
, (21,'2016-09-16','16:40:00','5:55:00','erat id mauris vulputate elementum nullam varius nulla facilisi cras',FALSE,FALSE,FALSE,1,21,21)
, (22,'2016-04-03','1:44:00','18:27:00','orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula',FALSE,FALSE,FALSE,4,22,22)
, (23,'2014-12-08','14:14:00','6:17:00','enim blandit mi in porttitor pede justo eu massa donec dapibus duis',TRUE,TRUE,FALSE,3,23,23)
, (24,'2018-05-10','0:33:00','2:35:00','turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue',FALSE,TRUE,FALSE,7,24,24)
, (25,'2014-05-15','19:56:00','7:16:00','morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit',TRUE,FALSE,TRUE,5,25,25)
, (26,'2017-08-07','5:02:00','15:53:00','mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy',TRUE,TRUE,TRUE,4,26,26)
, (27,'2014-11-11','3:40:00','22:01:00','vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna',TRUE,FALSE,FALSE,7,27,27)
, (28,'2014-06-02','19:55:00','7:46:00','metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et',FALSE,TRUE,FALSE,3,28,28)
, (29,'2018-03-30','7:55:00','14:18:00','ac est lacinia nisi venenatis tristique fusce congue diam id ornare',FALSE,TRUE,TRUE,6,29,29)
, (30,'2016-05-30','12:32:00','0:25:00','condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan',FALSE,FALSE,TRUE,3,30,30)
, (31,'2016-03-13','10:31:00','23:40:00','tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo',FALSE,FALSE,FALSE,4,31,31)
, (32,'2017-02-17','17:24:00','16:28:00','justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus',TRUE,TRUE,FALSE,4,32,32)
, (33,'2017-11-21','19:43:00','23:47:00','scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis',FALSE,TRUE,TRUE,2,33,33)
, (34,'2018-09-03','4:12:00','21:50:00','velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat',TRUE,TRUE,TRUE,5,34,34)
, (35,'2014-07-30','19:41:00','21:05:00','quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse',FALSE,FALSE,TRUE,6,35,35)
, (36,'2015-10-04','0:30:00','2:26:00','lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci',FALSE,FALSE,TRUE,2,36,36)
, (37,'2015-10-13','1:28:00','6:18:00','faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel',FALSE,FALSE,FALSE,1,37,37)
, (38,'2016-10-14','3:54:00','0:46:00','nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi',FALSE,FALSE,TRUE,1,38,38)
, (39,'2015-12-01','8:52:00','23:32:00','posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi',FALSE,TRUE,FALSE,2,39,39)
, (40,'2014-04-23','23:22:00','22:15:00','diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae',FALSE,FALSE,TRUE,5,40,40)
, (41,'2016-12-18','7:03:00','6:57:00','leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices',TRUE,TRUE,TRUE,2,41,41)
, (42,'2018-01-09','9:16:00','14:54:00','varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam',FALSE,FALSE,FALSE,7,42,42)
, (43,'2015-05-21','3:06:00','21:29:00','aliquet maecenas leo odio condimentum id luctus nec molestie sed',FALSE,TRUE,TRUE,6,43,43)
, (44,'2017-09-11','19:40:00','20:37:00','phasellus in felis donec semper sapien a libero nam dui',FALSE,TRUE,TRUE,4,44,44)
, (45,'2014-09-02','19:53:00','16:23:00','nulla dapibus dolor vel est donec odio justo sollicitudin ut',TRUE,FALSE,FALSE,5,45,45)
, (46,'2014-11-10','18:25:00','18:48:00','viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac',TRUE,TRUE,FALSE,2,46,46)
, (47,'2016-10-07','11:01:00','4:48:00','erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis',TRUE,TRUE,TRUE,4,47,47)
, (48,'2016-03-24','5:36:00','1:32:00','eu est congue elementum in hac habitasse platea dictumst morbi',TRUE,FALSE,TRUE,6,48,48)
, (49,'2016-05-02','15:45:00','21:57:00','commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id',FALSE,FALSE,TRUE,2,49,49)
, (50,'2016-10-01','11:34:00','11:58:00','ligula nec sem duis aliquam convallis nunc proin at turpis a',FALSE,FALSE,TRUE,3,50,50);
