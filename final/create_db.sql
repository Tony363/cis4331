-- TONY SIU 916209430

drop table TESTED;
drop table RESIDENTSPHONENUM;
drop table TESTINGCENTRE;
drop table RESIDENTS;
drop table ZIPCODE;
drop table CITY;
drop table COUNTY;


CREATE TABLE COUNTY(
    CountyID INT NOT NULL,
    CountyName VARCHAR(50) NOT NULL UNIQUE,
    CountyPopulation INT NOT NULL,
    PRIMARY KEY (CountyID)
);

insert into county (CountyID, CountyName, CountyPopulation)    
values (1, 'Orange',3000);
insert into county (CountyID, CountyName, CountyPopulation)    
values (2, 'Philadelphia',2000);
insert into county (CountyID, CountyName, CountyPopulation)    
values (3, 'wtf1',3000);

CREATE TABLE CITY(
    CityID INT NOT NULL,
    CityName VARCHAR(50) NOT NULL,
    CityPopulation INT NOT NULL,
    CountyID INT NOT NULL,
    PRIMARY KEY (CityID),
    FOREIGN KEY (CountyID) REFERENCES COUNTY(CountyID)
);

insert into city (CityID, CityName, CityPopulation, CountyID)
values (1, 'Philadelphia', 1000, 1);
insert into city (CityID, CityName, CityPopulation, CountyID)
values (2, 'Los Angeles', 200000, 2);
insert into city (CityID, CityName, CityPopulation, CountyID)
values (3, 'San Francisco', 1000, 1);
insert into city (CityID, CityName, CityPopulation, CountyID)
values (4, 'San Diego', 1000, 1);

CREATE TABLE ZIPCODE (
    ZipID INT NOT NULL,
    ZipCode VARCHAR(10) NOT NULL UNIQUE,
    CityID INT NOT NULL,
    PRIMARY KEY (ZipID),
    FOREIGN KEY (CityID) REFERENCES CITY(CityID)
);

insert into zipcode (ZipID, ZipCode, CityID)
values (1, '19104', 1);
insert into zipcode (ZipID, ZipCode, CityID)
values (2, '19105', 1);
insert into zipcode (ZipID, ZipCode, CityID)
values (3, '19106', 1);
insert into zipcode (ZipID, ZipCode, CityID)
values (4, '19107', 1);



CREATE TABLE RESIDENTS (
    ResID INT NOT NULL,
    SSN VARCHAR(20) NOT NULL UNIQUE,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    StreetAddress VARCHAR(50) NOT NULL,
    Birthdate DATE NOT NULL,
    ZipID INT NOT NULL,
    PRIMARY KEY (ResID),
    FOREIGN KEY (ZipID) REFERENCES ZIPCODE(ZipID)
);

insert into residents (ResID, SSN, FirstName, LastName, StreetAddress, Birthdate, ZipID)
values (1, '123-45-6789', 'Tony', 'Siu', '1234 Main St', to_date('1999-01-01','YYYY-MM-DD'), 1);
insert into residents (ResID, SSN, FirstName, LastName, StreetAddress, Birthdate, ZipID)
values (2, '987-65-4321', 'John', 'Doe', '4321 Main St', to_date('1999-01-01','YYYY-MM-DD'), 2);
insert into residents (ResID, SSN, FirstName, LastName, StreetAddress, Birthdate, ZipID)
values (3, '123-45-6710', 'Jane', 'Doe', '1234 Main St', to_date('1999-01-01','YYYY-MM-DD'), 3);
insert into residents (ResID, SSN, FirstName, LastName, StreetAddress, Birthdate, ZipID)
values (4, '987-65-4322', 'John', 'Doe', '4321 Main St', to_date('1999-01-01','YYYY-MM-DD'), 4);


CREATE TABLE TESTINGCENTRE(
    TestID INT NOT NULL,
    PhoneNum INT NOT NULL,
    Name VARCHAR(50),
    Address VARCHAR(50),
    ZipID INT NOT NULL,
    PRIMARY KEY (TestID),
    FOREIGN KEY (ZipID) REFERENCES ZIPCODE(ZipID)
);

insert into testingcentre (TestID, PhoneNum, Name, Address, ZipID)
values (1, 1234567890, 'Test Centre 1', '1234 Main St', 1);
insert into testingcentre (TestID, PhoneNum, Name, Address, ZipID)
values (2, 1234567890, 'Test Centre 2', '4321 Main St', 2);
insert into testingcentre (TestID, PhoneNum, Name, Address, ZipID)
values (3, 1234567890, 'Test Centre 3', '1234 Main St', 3);
insert into testingcentre (TestID, PhoneNum, Name, Address, ZipID)
values (4, 1234567890, 'Test Centre 4', '4321 Main St', 4);


CREATE TABLE RESIDENTSPHONENUM(
    PhoneNum INT NOT NULL,
    ResID INT NOT NULL,
    PRIMARY KEY (PhoneNum,ResID),
    FOREIGN KEY (ResID) REFERENCES RESIDENTS(ResID)
);

insert into residentsphonenum (PhoneNum, ResID)
values (1234567890, 1);
insert into residentsphonenum (PhoneNum, ResID)
values (1234567890, 2);
insert into residentsphonenum (PhoneNum, ResID)
values (1234567890, 3);
insert into residentsphonenum (PhoneNum, ResID)
values (1234567890, 4);

CREATE TABLE TESTED(
    DateTested DATE NOT NULL,
    ResID INT NOT NULL,
    TestID INT NOT NULL,
    Result VARCHAR(10) NOT NULL,
    PRIMARY KEY (DateTested,ResID,TestID),
    FOREIGN KEY (ResID) REFERENCES RESIDENTS(ResID),
    FOREIGN KEY (TestID) REFERENCES TESTINGCENTRE(TestID)
);

insert into tested (DateTested, ResID, TestID, Result)
values (to_date('2020-01-01','YYYY-MM-DD'), 1, 1, 'Positive');
insert into tested (DateTested, ResID, TestID, Result)
values (to_date('2020-01-01','YYYY-MM-DD'), 2, 2, 'Negative');
insert into tested (DateTested, ResID, TestID, Result)
values (to_date('2020-01-01','YYYY-MM-DD'), 3, 3, 'Positive');
insert into tested (DateTested, ResID, TestID, Result)
values (to_date('2020-01-01','YYYY-MM-DD'), 4, 4, 'Negative');