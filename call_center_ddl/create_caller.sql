use call_center;


create table caller(
	caller_id int primary key auto_increment comment 'ID of the caller'
    , caller_first_name varchar(200) comment 'The first name (given name) of the caller'
    , caller_last_name varchar(200) comment 'The last name (family name) of the caller'
    , caller_sex varchar(10) comment 'The sex of the caller (if known)'
    , caller_relationship_status enum('single', 'married', 'divorced', 'engaged', 'dating'
		, 'living together', 'separated', 'widowed', 'unkonw')
        comment 'Relationship status of caller'
    , caller_address varchar(200) comment 'Address fo the caller. If null caller is homeless'
    , zip_code varchar(10) comment 'Zip coe of caller\'s address'
	, caller_sexual_orientation enum('bisexual', 'heterosexual', 'lesbian', 'gay', 'questioning'
		, 'unknown', 'prefer_not_answer', 'straight', 'undecided') comment 'Sexual orientation of caller'
	, caller_email varchar(200) comment 'The email of teh caller'
    , military_status enum('active_duty', 'deployed', 'honorably_discharged', 'prefer_not_to_answer', 'inactive', 'veteran') comment 'if caller has an active,
		inactive, veteran, or unknown military status'
	, military_branch enum('air force', 'army', 'navy', 'coast guard', 'national gaurd', 'marines', 'reserves')
		comment 'Identifies which branc of military the caller is in'
	, caller_phone_number varchar(15) comment 'caller phone number'
)comment 'Represents a caller';


INSERT INTO caller VALUES (1,'Maddi','Measor','other','married','3 Hovde Junction','10517','gay','mmeasor0@sphinn.com','veteran','army','304-456-7318')
, (2,'Katya','Tansly','female','married','600 Transport Junction','10518','gay','ktansly1@nifty.com','deployed','army','960-118-6142')
, (3,'Arabelle','Lowensohn','male','single','43722 Reindahl Way','10519','undecided','alowensohn2@ebay.com','active_duty','navy','259-926-7197')
, (4,'Oby','O''Hickey','male','single','07091 Evergreen Center','10520','undecided','oohickey3@adobe.com','honorably_discharged','reserves','229-571-8712')
, (5,'Phillis','Camelli','male','single','696 Old Gate Crossing','10522','gay','pcamelli4@shareasale.com','prefer_not_to_answer','marines','200-325-8422')
, (6,'Aldin','Ibell','other','married','34916 Kedzie Avenue','10523','prefer_not_answer','aibell5@unc.edu','veteran','army','990-571-8146')
, (7,'Cora','Adamsky','other','married','57234 Weeping Birch Terrace','10524','undecided','cadamsky6@deliciousdays.com','deployed','navy','689-485-0806')
, (8,'Pavlov','Dudney','female','single','0 Killdeer Junction','10526','undecided','pdudney7@geocities.com','active_duty','army','902-172-1927')
, (9,'Arleen','Lynes','female','married','5707 Loomis Parkway','10527','prefer_not_answer','alynes8@weebly.com','honorably_discharged','reserves','806-587-2621')
, (10,'Vin','Sandy','female','married','57037 Westend Drive','10528','prefer_not_answer','vsandy9@guardian.co.uk','prefer_not_to_answer','reserves','706-483-9238')
, (11,'Leah','O''Crevan','other','married','484 Doe Crossing Alley','10530','undecided','locrevana@t-online.de','veteran','army','654-756-7175')
, (12,'Trent','Faloon','female','single','17 Kropf Point','10532','undecided','tfaloonb@elegantthemes.com','deployed','reserves','284-416-0390')
, (13,'Gregorius','Ghiroldi','other','married','5973 South Place','10533','straight','gghiroldic@zdnet.com','active_duty','navy','801-219-6755')
, (14,'Livvy','Hounsham','male','single','419 Independence Hill','10535','undecided','lhounshamd@ucsd.edu','honorably_discharged','army','144-402-1381')
, (15,'Kailey','Borham','female','married','03089 Duke Court','10536','gay','kborhame@ezinearticles.com','prefer_not_to_answer','army','855-431-1755')
, (16,'Myca','Breston','female','married','33125 Rowland Street','10537','straight','mbrestonf@amazon.co.uk','veteran','marines','958-141-4072')
, (17,'Jena','Absolem','female','single','83 Knutson Junction','10538','prefer_not_answer','jabsolemg@1688.com','deployed','army','515-733-8053')
, (18,'Caprice','Tuley','other','single','243 Bunting Pass','10541','prefer_not_answer','ctuleyh@chron.com','active_duty','marines','121-318-6444')
, (19,'Jessalyn','Lambertini','other','married','91526 Jana Place','10543','prefer_not_answer','jlambertinii@constantcontact.com','honorably_discharged','reserves','203-603-8813')
, (20,'Marja','Roubeix','female','single','0014 Warner Parkway','10545','straight','mroubeixj@google.co.jp','prefer_not_to_answer','navy','839-620-6782')
, (21,'Miguela','Bertot','female','married','2361 Hagan Terrace','10546','straight','mbertotk@elpais.com','veteran','reserves','649-368-6047')
, (22,'Marla','Capewell','other','single','0828 Di Loreto Circle','10547','gay','mcapewelll@kickstarter.com','deployed','army','136-442-1368')
, (23,'Artemis','McClounan','other','single','93298 Miller Parkway','10548','straight','amcclounanm@jimdo.com','active_duty','army','789-731-6753')
, (24,'Darren','Puttergill','female','married','127 Sloan Hill','10549','undecided','dputtergilln@state.gov','honorably_discharged','reserves','746-387-0137')
, (25,'Harper','Slewcock','other','married','00760 Moose Road','10550','undecided','hslewcocko@baidu.com','prefer_not_to_answer','navy','502-327-1210')
, (26,'Celle','Ockleshaw','male','married','0 Brentwood Plaza','10552','prefer_not_answer','cockleshawp@google.ca','veteran','reserves','201-750-0767')
, (27,'Kaitlynn','Farlham','other','single','17 Marcy Road','10553','gay','kfarlhamq@hexun.com','deployed','navy','416-554-6652')
, (28,'Eadmund','Morehall','other','single','95 Cardinal Way','10560','straight','emorehallr@paginegialle.it','active_duty','reserves','969-815-9107')
, (29,'Marty','Espada','male','single','91 Basil Parkway','10562','undecided','mespadas@scientificamerican.com','honorably_discharged','navy','950-788-5640')
, (30,'Meaghan','Cristobal','other','single','6289 Briar Crest Crossing','10566','straight','mcristobalt@nytimes.com','prefer_not_to_answer','navy','447-829-1120')
, (31,'Norean','Goadsby','other','single','08 Russell Circle','10567','undecided','ngoadsbyu@virginia.edu','veteran','navy','607-292-2803')
, (32,'Laughton','Balf','female','single','90535 Fieldstone Alley','10570','straight','lbalfv@freewebs.com','deployed','army','340-980-7654')
, (33,'Elisabetta','Hayler','male','single','32023 Sunfield Plaza','10573','straight','ehaylerw@about.me','active_duty','marines','741-876-1041')
, (34,'Hattie','Kinforth','other','married','41981 Caliangt Avenue','10576','straight','hkinforthx@hugedomains.com','honorably_discharged','reserves','109-882-6975')
, (35,'Boone','Tidder','other','single','7 Ruskin Hill','10577','undecided','btiddery@dot.gov','prefer_not_to_answer','army','609-200-6933')
, (36,'Lanie','Jakel','male','single','2373 Loomis Center','10578','gay','ljakelz@e-recht24.de','veteran','marines','154-342-0211')
, (37,'Rolf','Quilleash','female','married','2 Steensland Junction','10579','undecided','rquilleash10@usda.gov','deployed','army','792-616-7233')
, (38,'Loleta','Vasiljevic','other','single','30 Ridgeview Point','10580','undecided','lvasiljevic11@vimeo.com','active_duty','navy','797-134-1632')
, (39,'Lenore','Gillmor','other','married','71 Longview Parkway','10583','prefer_not_answer','lgillmor12@reference.com','honorably_discharged','navy','974-110-0196')
, (40,'Randolf','Lackham','male','single','20640 Nevada Trail','10588','prefer_not_answer','rlackham13@chron.com','prefer_not_to_answer','reserves','475-948-3310')
, (41,'Clemens','Schimek','other','married','81 Green Ridge Junction','10589','prefer_not_answer','cschimek14@nhs.uk','veteran','reserves','952-804-2016')
, (42,'Abbe','Simmance','female','single','01268 Calypso Avenue','10590','gay','asimmance15@google.fr','deployed','reserves','532-109-6555')
, (43,'Genny','Lidell','female','single','16 Red Cloud Alley','10591','prefer_not_answer','glidell16@npr.org','active_duty','reserves','665-769-6786')
, (44,'Cary','Penticost','other','single','6180 Carberry Trail','10594','gay','cpenticost17@dmoz.org','honorably_discharged','reserves','310-484-3667')
, (45,'Mikaela','Morehall','female','single','234 Parkside Terrace','10595','straight','mmorehall18@skyrock.com','prefer_not_to_answer','navy','599-407-0634')
, (46,'Bartolomeo','Oehme','other','married','03503 Ronald Regan Park','10596','straight','boehme19@topsy.com','veteran','army','546-587-1459')
, (47,'Friedrick','Limbourne','male','married','18792 Milwaukee Place','10597','prefer_not_answer','flimbourne1a@nsw.gov.au','deployed','navy','203-682-5844')
, (48,'Rodina','Beeze','male','married','009 Rutledge Parkway','10598','prefer_not_answer','rbeeze1b@artisteer.com','active_duty','navy','943-509-9249')
, (49,'Meade','Agron','other','single','497 Sutherland Street','10601','prefer_not_answer','magron1c@angelfire.com','honorably_discharged','reserves','814-831-6247')
, (50,'Frants','Weir','other','single','9 Talmadge Hill','10603','prefer_not_answer','fweir1d@shareasale.com','prefer_not_to_answer','army','102-329-6773');
