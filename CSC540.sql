drop view people_recommendation;
drop view view_record;
drop table people cascade constraints;
drop table People_Health_Supporter cascade constraints;
drop table Disease cascade constraints;
drop table Recommendation cascade constraints;
drop table Diagnosed_With cascade constraints;
drop table Measure cascade constraints;
drop table Disease_Specific_Reco cascade constraints;
drop table People_Specific_Reco cascade constraints;
drop table List_Of_Value cascade constraints;
drop table record cascade constraints;
drop table recommendation_measure cascade constraints;
drop table alert cascade constraints;

create table PEOPLE(
PID	VARCHAR2(60) PRIMARY KEY,	
DOB	Date	NOT NULL,
Address	VARCHAR2(120)	NOT NULL,
Gender	Char(1)	NOT NULL CHECK(Gender in ('F','M')), 
First_Name	VARCHAR2(60)	NOT NULL,
Last_Name	VARCHAR2(60)	NOT NULL,
Password	VARCHAR(60)	NOT NULL
);


create table People_Health_Supporter(
PID	VARCHAR2(60),
HID	VARCHAR2(60)
CONSTRAINT people_health_sup_hid_fk REFERENCES people(pid),	
IS_PRIMARY	CHAR(1)	NOT NULL CHECK (IS_PRIMARY in('N','Y')),
Authorization_Date	Date	NOT NULL,
Constraint people_heath_sup_pk primary key(pid,hid)
);


create table Disease(
D_NAME	VARCHAR2(60)	PRIMARY KEY,
Description	VARCHAR2(500)	
);


Create table Recommendation(
Recommendation_Name	Varchar(60)	PRIMARY KEY,
Description	Varchar(500),	
Is_General	Char(1)	NOT NULL CHECK (Is_general in ('N','Y'))
);


Create table Diagnosed_With(
PID	VARCHAR(60) constraint Diag_With_People_fk REFERENCES People(PID),
D_NAME	VARCHAR(60)	constraint Diag_With_Disease_fk REFERENCES Disease(D_Name),
DIAGNOSED_DATE	Date	NOT NULL,	
IS_ACTIVE	CHAR(1)	NOT NULL CHECK(IS_ACTIVE in ('N','Y')),
CONSTRAINT pk_Diag_with PRIMARY KEY (PID,D_NAME)
);


create table Measure(
Measure_Name varchar2(60) primary key,
Unit varchar2(60),
Upper_limit number,
Lower_limit number,
Frequency number,
Data_type varchar(60) Not null,
Number_of_Observations number,
Threshold number(4,2)
);

create table recommendation_measure (
recommendation_name varchar2(60),
measure_name varchar2(60),
constraint reco_measure_pk primary key(recommendation_name,measure_name),
constraint reco_measure_reco_fk foreign key(recommendation_name) references recommendation,
constraint reco_measure_measure_fk foreign key(measure_name) references measure
);

create table Disease_Specific_Reco(
Recommendation_Name varchar2(60),
Measure_Name varchar2(60),
D_NAME varchar2(60),
Upper_limit number,
Lower_limit number,
Frequency number,
Number_of_Observations number,
Threshold number(4,2),
CONSTRAINT pk_dis_spec PRIMARY KEY (Recommendation_Name,Measure_Name,D_NAME),
constraint dis_reco_measure_fk foreign key(recommendation_name,measure_name) references recommendation_measure,
CONSTRAINT fk_d_name_dsr FOREIGN KEY (D_NAME) REFERENCES Disease(D_Name)
);

create table People_Specific_Reco(
Recommendation_Name varchar2(60),
Measure_Name varchar2(60),
PID varchar2(60),
Upper_limit number,
Lower_limit number,
Frequency number,
Number_of_Observations number,
Threshold number(4,2),
CONSTRAINT pk_people_spec PRIMARY KEY (Recommendation_Name,Measure_Name,PID),
constraint ppl_reco_measure_fk foreign key(recommendation_name,measure_name) references recommendation_measure,
CONSTRAINT fk_pid_psr FOREIGN KEY (PID) REFERENCES People(PID)
);

create table List_Of_Value(
Lov_name varchar2(60),
Measure_Name varchar2(60),
Lov_value number not null,
Description varchar2(500),
CONSTRAINT pk_lov PRIMARY KEY (Lov_name, Measure_Name),
CONSTRAINT fk_meas_name_lov FOREIGN KEY (Measure_Name) REFERENCES Measure(Measure_Name)
);

create table record (
record_id number(10),
pid varchar2(60),
recommendation_name varchar2(60) not null,
measure_name varchar2(60) not null,
value varchar2(60),
recorded_date date not null,
created_date date not null,
created_by varchar2(60) not null,
constraint record_pk primary key(record_id,pid),
constraint record_reco_measure_fk foreign key(recommendation_name,measure_name) references recommendation_measure,
constraint record_people_fk foreign key(created_by) references people
);

create table alert (
alert_id number(10),
pid varchar2(60),
type varchar2(60) not null check(type in ('Low Activity','Outside Limit')),
recommendation_name varchar2(60) not null,
measure_name varchar2(60) not null,
record_id number(10),
is_active char(1) not null check(is_active in ('Y','N')),
is_viewed char(1) not null check(is_viewed in ('Y','N')),
cleared_date date,
cleared_by varchar2(60),
constraint alert_pk primary key(alert_id,pid),
constraint alert_record_fk foreign key(record_id, pid) references record(record_id, pid),
constraint alert_pid_fk foreign key(pid) references people,
constraint alert_reco_measure_fk foreign key(recommendation_name,measure_name) references recommendation_measure,
constraint alert_people_fk foreign key(cleared_by) references people,
constraint cannot_clear_LA_alert CHECK(not(pid=cleared_by and type='Low Activity')),
constraint clear_only_after_view CHECK(not(is_active='N' and is_viewed='N' and cleared_by is not null))
);

create view people_recommendation (PID,RECOMMENDATION_NAME,MEASURE_NAME,UPPER_LIMIT,LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD) as
select PID,RECOMMENDATION_NAME,MEASURE_NAME,UPPER_LIMIT,LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD from people_specific_reco
union
select PID,RECOMMENDATION_NAME,MEASURE_NAME,UPPER_LIMIT,LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD from DIAGNOSED_WITH join DISEASE_SPECIFIC_RECO on DIAGNOSED_WITH.D_NAME=DISEASE_SPECIFIC_RECO.D_NAME where (PID,RECOMMENDATION_NAME,MEASURE_NAME) not in (select PID,RECOMMENDATION_NAME,MEASURE_NAME from people_specific_reco)
union
select PEOPLE.PID,RECOMMENDATION.RECOMMENDATION_NAME,MEASURE.MEASURE_NAME,UPPER_LIMIT,LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD from 
PEOPLE, RECOMMENDATION join RECOMMENDATION_MEASURE on RECOMMENDATION.RECOMMENDATION_NAME=RECOMMENDATION_MEASURE.RECOMMENDATION_NAME join MEASURE on RECOMMENDATION_MEASURE.MEASURE_NAME=MEASURE.MEASURE_NAME 
where is_general='Y' and (PEOPLE.PID,RECOMMENDATION.RECOMMENDATION_NAME,MEASURE.MEASURE_NAME) not in (select PID,RECOMMENDATION_NAME,MEASURE_NAME from people_specific_reco union select PID,RECOMMENDATION_NAME,MEASURE_NAME from DIAGNOSED_WITH join DISEASE_SPECIFIC_RECO on DIAGNOSED_WITH.D_NAME=DISEASE_SPECIFIC_RECO.D_NAME where (PID,RECOMMENDATION_NAME,MEASURE_NAME) not in (select PID,RECOMMENDATION_NAME,MEASURE_NAME from people_specific_reco));

create view view_record (record_id,pid,recommendation_name,measure_name,value,recorded_date,created_date,created_by) as 
select record_id,pid,recommendation_name,measure_name,value,recorded_date,created_date,created_by from record where measure_name not in (select distinct measure_name from list_of_value)
union
select record_id,pid,recommendation_name,record.measure_name,lov_name,recorded_date,created_date,created_by from record join list_of_value on record.measure_name=list_of_value.measure_name and record.value=list_of_value.lov_value;
