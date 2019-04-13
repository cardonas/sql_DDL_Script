use call_center;

/*
	AUTHOR: Steven Cardona
    DATE: 2019-04-12
    DESCRIPTION: Create service_agencies table
*/
create table service_agencies(
    service_agency_id int primary key auto_increment comment 'ID of service agency'
    , service_agency_name varchar(200) not null comment 'Name of service agency'
    , service_provided varchar(200) not null comment 'Service provided by agency'
    , service_description varchar(300) not null comment 'Short description of service provided'
    , service_phone varchar(15) not null comment 'Phone number of a service agency'
    , service_address varchar(200) not null comment 'Address of a service'
    , zip_code varchar(10) not null comment 'zipcode of service agency'
    , constraint service_agencies_fk_zipcode
        foreign key (zip_code)
        references zip_codes(zip_code)
)comment 'Represents service agencies that get referred';



/*
	AUTHOR: Cash Carlson
	DATE: 2019-04-12
    DESCRIPTION: INSERT values into service_agencies table.
*/
INSERT INTO service_agencies VALUES (1,'We Care Inc.','Homeless shelter','A local homeless shelter will be recommended','920-650-3238','8 Hoffman Plaza',10517)
, (2,'Suicide Prevention Hotline','Suicide hotline','A hotline to help those who are feeling suicidal','153-407-5261','3149 Hayes Lane',10518)
, (3,'Signa','Food assistance','A local department that assists with food assistance will be recommended','483-806-7395','11060 Arrowood Avenue',10519)
, (4,'Cherry Hills Safe Center','Domestic abuse safe center','A local safe center for those who are in danger of domestic abuse will be recommended','253-822-2013','8 Tennessee Park',10520)
, (5,'Department of Human Services','Childcare Services','A local department that assists with childcare services will be recommended','675-892-1555','5121 Hudson Park',10522)
, (6,'Find a Doc','Find a doctor','The find a doc hotline will help those who are in need of a primary care physician','753-645-9345','4 Ryan Place',10523)
, (7,'We Help Inc.','Domestic Abuse Hotline','A service that helps with those who are dealing with domestic abuse','822-373-0333','60 Sycamore Alley',10524);
