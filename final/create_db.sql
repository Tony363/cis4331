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
    CountyName VARCHAR(20) NOT NULL,
    PRIMARY KEY (CountyID)
);

insert into county (CountyID, CountyName)    
values (1, 'Los Angeles');
insert into county (CountyID, CountyName)    
values (2, 'wtf');
insert into county (CountyID, CountyName)    
values (3, 'wtf1');

CREATE TABLE CITY(
    CityID INT NOT NULL,
    CityName VARCHAR(20) NOT NULL,
    Population INT NOT NULL,
    CountyID INT NOT NULL,
    PRIMARY KEY (CityID),
    FOREIGN KEY (CountyID) REFERENCES COUNTY(CountyID)
);

CREATE TABLE ZIPCODE (
    ZipID INT NOT NULL,
    ZipCode VARCHAR(10) NOT NULL,
    CityID INT NOT NULL,
    PRIMARY KEY (ZipID),
    FOREIGN KEY (CityID) REFERENCES CITY(CityID)
);

CREATE TABLE RESIDENTS (
    ResID INT NOT NULL,
    SSN VARCHAR(20) NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    StreetAddress VARCHAR(50) NOT NULL,
    Birthdate DATE NOT NULL,
    ZipID INT NOT NULL,
    PRIMARY KEY (ResID),
    FOREIGN KEY (ZipID) REFERENCES ZIPCODE(ZipID)
);

CREATE TABLE TESTINGCENTRE(
    TestID INT NOT NULL,
    PhoneNum INT NOT NULL,
    Name VARCHAR(30),
    Address VARCHAR(50),
    ZipID INT NOT NULL,
    PRIMARY KEY (TestID),
    FOREIGN KEY (ZipID) REFERENCES ZIPCODE(ZipID)
);


CREATE TABLE RESIDENTSPHONENUM(
    PhoneNum INT NOT NULL,
    ResID INT NOT NULL,
    PRIMARY KEY (PhoneNum,ResID),
    FOREIGN KEY (ResID) REFERENCES RESIDENTS(ResID)
);


CREATE TABLE TESTED(
    DateTested DATE NOT NULL,
    ResID INT NOT NULL,
    TestID INT NOT NULL,
    Result VARCHAR(10) NOT NULL,
    PRIMARY KEY (DateTested,ResID,TestID),
    FOREIGN KEY (ResID) REFERENCES RESIDENTS(ResID),
    FOREIGN KEY (TestID) REFERENCES TESTINGCENTRE(TestID)
);