insert into people(pid, dob, address, gender, first_name, last_name, password)
values('P1', '26-May-1984', '2500 Sacramento, Apt 903, Santa Cruz, CA-90021', 'M', 'Sheldon', 'Cooper', 'password');
insert into people(pid, dob, address, gender, first_name, last_name, password)
values('P2', '19-Apr-1989', '2500 Sacramento, Apt 904, Santa Cruz, CA-90021', 'M', 'Leonard', 'Hofstader', 'password');
insert into people(pid, dob, address, gender, first_name, last_name, password)
values('P3', '25-Dec-1990', '2500 Sacramento, Apt 904, Santa Cruz, CA-90021', 'F', 'Penny', 'Hofstader', 'password');
insert into people(pid, dob, address, gender, first_name, last_name, password)
values('P4', '15-Jun-1992', '2500 Sacramento, Apt 905, Santa Cruz, CA-90021', 'F', 'Amy', 'Farrahfowler', 'password');

insert into PEOPLE_HEALTH_SUPPORTER(pid, hid, is_primary, authorization_date)
values('P1', 'P2', 'Y', '21-oct-2016');
insert into PEOPLE_HEALTH_SUPPORTER(pid, hid, is_primary, authorization_date)
values('P1', 'P4', 'N', '21-oct-2016');
insert into PEOPLE_HEALTH_SUPPORTER(pid, hid, is_primary, authorization_date)
values('P2', 'P3', 'Y', '09-oct-2016');
insert into PEOPLE_HEALTH_SUPPORTER(pid, hid, is_primary, authorization_date)
values('P3', 'P4', 'Y', '21-oct-2016');

insert into DISEASE(D_NAME, description)
values('Heart Disease', 'Ailment of heart');
insert into DISEASE(D_NAME, description)
values('HIV', 'Human immunodeficiency virus');
insert into DISEASE(D_NAME, description)
values('COPD', 'Chronic obstructive pulmonary disease ');

insert into measure(measure_name, unit, upper_limit, lower_limit, frequency, data_type, number_of_observations, Threshold)
values('Weight', 'lbs', 200, 120, 7, 'number', 1,1);
insert into measure(measure_name, unit, upper_limit, lower_limit, frequency, data_type, number_of_observations, Threshold)
values('Systollic Blood Pressure', 'mmHg', null, null, null, 'number', 1,1);
insert into measure(measure_name, unit, upper_limit, lower_limit, frequency, data_type, number_of_observations, Threshold)
values('Dystollic Blood Pressure', 'mmHg', null, null, null, 'number', 1,1);
insert into measure(measure_name, unit, upper_limit, lower_limit, frequency, data_type, number_of_observations, Threshold)
values('Oxygen Saturation', 'percentage', null, null, null, 'number', 1,1);
insert into measure(measure_name, unit, upper_limit, lower_limit, frequency, data_type, number_of_observations, Threshold)
values('Pain', null, null, null, null, 'LOV', 1,1);
insert into measure(measure_name, unit, upper_limit, lower_limit, frequency, data_type, number_of_observations, Threshold)
values('Mood', null, null, null, null, 'LOV', 1,1);
insert into measure(measure_name, unit, upper_limit, lower_limit, frequency, data_type, number_of_observations, Threshold)
values('Temperature', 'F', null, null, null, 'number', 1,1);

insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('Happy', 'Mood', 0, 'Patient is in happy mood');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('Neutral', 'Mood', 1, 'Patient is in neutral mood');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('Sad', 'Mood', 2, 'Patient is in sad mood');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('0', 'Pain', 0, 'Patient is in Pain level 0');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('1', 'Pain', 1, 'Patient is in Pain level 1');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('2', 'Pain', 2, 'Patient is in Pain level 2');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('3', 'Pain', 3, 'Patient is in Pain level 3');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('4', 'Pain', 4, 'Patient is in Pain level 4');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('5', 'Pain', 5, 'Patient is in Pain level 5');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('6', 'Pain', 6, 'Patient is in Pain level 6');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('7', 'Pain', 7, 'Patient is in Pain level 7');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('8', 'Pain', 8, 'Patient is in Pain level 8');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('9', 'Pain', 9, 'Patient is in Pain level 9');
insert into LIST_OF_VALUE(LOV_NAME, MEASURE_NAME, LOV_value, description)
values('10', 'Pain', 10, 'Patient is in Pain level 10');

insert into RECOMMENDATION(Recommendation_Name,Description,Is_General)
values('Check Weight', 'Check Weight', 'N');
insert into RECOMMENDATION(Recommendation_Name,Description,Is_General)
values('Check Blood Pressure', 'Check Blood Pressure', 'N');
insert into RECOMMENDATION(Recommendation_Name,Description,Is_General)
values('Check O2 Saturation', 'Check O2 Saturation', 'N');
insert into RECOMMENDATION(Recommendation_Name,Description,Is_General)
values('Check Pain', 'Check Pain', 'N');
insert into RECOMMENDATION(Recommendation_Name,Description,Is_General)
values('Check Mood', 'Check Mood', 'N');
insert into RECOMMENDATION(Recommendation_Name,Description,Is_General)
values('Check Temperature', 'Check Temperature', 'N');

insert into RECOMMENDATION_MEASURE(RECOMMENDATION_NAME, MEASURE_NAME)
values('Check Weight', 'Weight');
insert into RECOMMENDATION_MEASURE(RECOMMENDATION_NAME, MEASURE_NAME)
values('Check Blood Pressure', 'Systollic Blood Pressure');
insert into RECOMMENDATION_MEASURE(RECOMMENDATION_NAME, MEASURE_NAME)
values('Check Blood Pressure', 'Dystollic Blood Pressure');
insert into RECOMMENDATION_MEASURE(RECOMMENDATION_NAME, MEASURE_NAME)
values('Check O2 Saturation', 'Oxygen Saturation');
insert into RECOMMENDATION_MEASURE(RECOMMENDATION_NAME, MEASURE_NAME)
values('Check Pain', 'Pain');
insert into RECOMMENDATION_MEASURE(RECOMMENDATION_NAME, MEASURE_NAME)
values('Check Mood', 'Mood');
insert into RECOMMENDATION_MEASURE(RECOMMENDATION_NAME, MEASURE_NAME)
values('Check Temperature', 'Temperature');

insert into PEOPLE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, PID, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Weight', 'Weight', 'P2', 190, 120, 7, 1, 1);
insert into PEOPLE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, PID, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Pain', 'Pain', 'P2', null, null, 1, 1, 1);
insert into PEOPLE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, PID, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Blood Pressure', 'Systollic Blood Pressure', 'P2', null, null, 1, 1, 1);
insert into PEOPLE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, PID, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Blood Pressure', 'Dystollic Blood Pressure', 'P2', null, null, 1, 1, 1);

insert into RECORD(PID, RECOMMENDATION_NAME, MEASURE_NAME, VALUE, RECORDED_DATE, CREATED_DATE, CREATED_BY)
VALUES('P2', 'Check Weight', 'Weight', 180, '10-oct-2016', '11-oct-2016', 'P2');
insert into RECORD(PID, RECOMMENDATION_NAME, MEASURE_NAME, VALUE, RECORDED_DATE, CREATED_DATE, CREATED_BY)
VALUES('P2', 'Check Weight', 'Weight', 195, '17-oct-2016', '17-oct-2016', 'P2');

insert into DISEASE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, D_NAME, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Weight', 'Weight', 'Heart Disease', 200, 120, 7, 1, 1);
insert into DISEASE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, D_NAME, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Blood Pressure', 'Systollic Blood Pressure', 'Heart Disease', 159, 140, 1, 1, 1);
insert into DISEASE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, D_NAME, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Blood Pressure', 'Dystollic Blood Pressure', 'Heart Disease', 99, 90, 1, 1, 1);
insert into DISEASE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, D_NAME, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Mood', 'Mood', 'Heart Disease', null, null, 7, 1, 1);

insert into DISEASE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, D_NAME, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Weight', 'Weight', 'HIV', 200, 120, 7, 1, 1);
insert into DISEASE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, D_NAME, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Blood Pressure', 'Systollic Blood Pressure', 'HIV', null, null, 1, 1, 1);
insert into DISEASE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, D_NAME, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Blood Pressure', 'Dystollic Blood Pressure', 'HIV', null, null, 1, 1, 1);
insert into DISEASE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, D_NAME, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Pain', 'Pain', 'HIV', null, null, 1, 1, 1);

insert into DISEASE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, D_NAME, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check O2 Saturation', 'Oxygen Saturation', 'COPD', 99, 90, 1, 1, 1);
insert into DISEASE_SPECIFIC_RECO(RECOMMENDATION_NAME, MEASURE_NAME, D_NAME, UPPER_LIMIT, LOWER_LIMIT,FREQUENCY,NUMBER_OF_OBSERVATIONS,THRESHOLD)
values('Check Temperature', 'Temperature', 'COPD', 100, 95, 1, 1, 1);

insert into Diagnosed_With(PID,D_Name,DIAGNOSED_DATE,IS_ACTIVE)
values('P1','Heart Disease','22-oct-2016','Y');
insert into Diagnosed_With(PID,D_Name,DIAGNOSED_DATE,IS_ACTIVE)
values('P2','HIV','10-oct-2016','Y');

commit;