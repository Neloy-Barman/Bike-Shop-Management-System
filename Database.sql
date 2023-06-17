
DROP TABLE Bike_Details;

DROP TABLE STATUS;

DROP TABLE CUSTOMER_DETAILS;

DROP TABLE SELL;

set linesize 300;

-- @Database of details of all the bikes from the shop. 

CREATE TABLE Bike_Details(
	Bike_no INT,
	Company VARCHAR(15),
	Model VARCHAR(15),
	Engine_cc NUMBER,
	B_Power_ps NUMBER,
	Mileage_kmpl NUMBER,
	Brakes VARCHAR(15),
	Price_Lakh NUMBER
);

INSERT INTO Bike_Details(Bike_no, Company, Model, Engine_CC, B_Power_PS, Mileage_kmpl, Brakes, Price_Lakh) 
VALUES(1,'Royal Enfield', 'Hunter 350', 80, 27, 36.2, 'Double Disc', 1.66); 

INSERT INTO Bike_Details(Bike_no, Company, Model, Engine_CC, B_Power_PS, Mileage_kmpl, Brakes, Price_Lakh) 
VALUES(2,'Harley Davidson','Nightster', 100, 90.2, 19.6, 'Double Disc', 14.99); 

INSERT INTO Bike_Details(Bike_no, Company, Model, Engine_CC, B_Power_PS, Mileage_kmpl, Brakes, Price_Lakh) 
VALUES(3,'Royal Enfield', 'Bullet 350', 95, 19.36, 38, 'Disc', 1.63); 

INSERT INTO Bike_Details(Bike_no, Company, Model, Engine_CC, B_Power_PS, Mileage_kmpl, Brakes, Price_Lakh) 
VALUES(4,'Harley Davidson','Fat Bob 114', 105, 94.6, 18.1, 'Double Disc', 17.99); 

INSERT INTO Bike_Details(Bike_no, Company, Model, Engine_CC, B_Power_PS, Mileage_kmpl, Brakes, Price_Lakh) 
VALUES(5,'Royal Enfield', 'Classic 350', 125, 20.21, 41.55, 'Double Disc', 2.21);

INSERT INTO Bike_Details(Bike_no, Company, Model, Engine_CC, B_Power_PS, Mileage_kmpl, Brakes, Price_Lakh) 
VALUES(6,'Royal Enfield','Interceptor 650', 100, 88.5, 20.8, 'Double Disc', 3.15); 

INSERT INTO Bike_Details(Bike_no, Company, Model, Engine_CC, B_Power_PS, Mileage_kmpl, Brakes, Price_Lakh) 
VALUES(7,'Harley Davidson','Road Glide', 155, 88.6, 20.8, 'Disc', 30.35); 

INSERT INTO Bike_Details(Bike_no, Company, Model, Engine_CC, B_Power_PS, Mileage_kmpl, Brakes, Price_Lakh) 
VALUES(8,'Royal Enfield','Meteor 350', 110,70, 20.8, 'Disc', 2.19); 

INSERT INTO Bike_Details(Bike_no, Company, Model, Engine_CC, B_Power_PS, Mileage_kmpl, Brakes, Price_Lakh) 
VALUES(9,'Harley Davidson','Heritage', 160, 88.6, 20.8, 'Double Disc', 25.52); 

INSERT INTO Bike_Details(Bike_no, Company, Model, Engine_CC, B_Power_PS, Mileage_kmpl, Brakes, Price_Lakh) 
VALUES(10,'Royal Enfield','Continental650', 130, 80, 20.8, 'Double Disc', 3.32); 

INSERT INTO Bike_Details(Bike_no, Company, Model, Engine_CC, B_Power_PS, Mileage_kmpl, Brakes, Price_Lakh) 
VALUES(11,'Harley Davidson','Pan Ameri', 180, 88.6, 20.8, 'Double Disc', 20.99); 

-- Database of whether the bike is in shop or sold.

CREATE TABLE STATUS(
	Bike_no INT,
	Sell_status VARCHAR2(15)
);

INSERT INTO STATUS VALUES(1, 'In shop');

INSERT INTO STATUS VALUES(2, 'Sold');

INSERT INTO STATUS VALUES(3, 'In shop');

INSERT INTO STATUS VALUES(4, 'In shop');

INSERT INTO STATUS VALUES(5, 'Sold');

INSERT INTO STATUS VALUES(6, 'In shop');

INSERT INTO STATUS VALUES(7, 'Sold');

INSERT INTO STATUS VALUES(8, 'In shop');

INSERT INTO STATUS VALUES(9, 'In shop');

INSERT INTO STATUS VALUES(10, 'Sold');

INSERT INTO STATUS VALUES(11, 'In shop');
	
CREATE TABLE CUSTOMER_DETAILS(
	C_NO INT PRIMARY KEY, 
	C_NAME VARCHAR2(20),
	C_CONTACT_NO NUMBER,
	C_NID NUMBER,
	C_EMAIL VARCHAR2(20),
	C_ADDRESS VARCHAR2(20),
	C_OCCU VARCHAR2(20)
);

INSERT INTO CUSTOMER_DETAILS(C_NO, C_NAME, C_CONTACT_NO, C_NID, C_EMAIL, C_ADDRESS, C_OCCU) 
VALUES(100000, 'Neloy Barman', 01830301894, 5662449800, 'neloy@gmail.com', '305 B. Road, Dhaka.', 'Unemployed');

INSERT INTO CUSTOMER_DETAILS(C_NO, C_NAME, C_CONTACT_NO, C_NID, C_EMAIL, C_ADDRESS, C_OCCU) 
VALUES(100001, 'Saleh Sakib', 01641302894, 2456601245, 'saleh@gmail.com', '200 A. Road, Dhaka', 'Student');

INSERT INTO CUSTOMER_DETAILS(C_NO, C_NAME, C_CONTACT_NO, C_NID, C_EMAIL, C_ADDRESS, C_OCCU) 
VALUES(100002, 'Sanjay Mandal', 015433301894, 5662448810, 'sanjay@gmail.com', '305 B. Road, Uttara.', 'Student');

INSERT INTO CUSTOMER_DETAILS(C_NO, C_NAME, C_CONTACT_NO, C_NID, C_EMAIL, C_ADDRESS, C_OCCU) 
VALUES(100003, 'Minhajul Islam', 01767808894, 2456002245, 'jim@gmail.com', '200 A. Jatrabari', 'Student');

CREATE TABLE SELL(
	SELL_NO INT,
	BIKE_NO NUMBER,
	C_NO NUMBER,
	SOLD_PRICE_LAKH NUMBER
);

INSERT INTO SELL(SELL_NO, BIKE_NO, C_NO, SOLD_PRICE_LAKH) 
VALUES(200000, 1, 100000, 1.60);

INSERT INTO SELL(SELL_NO, BIKE_NO, C_NO, SOLD_PRICE_LAKH) 
VALUES(200001, 5, 100001, 2.18);

INSERT INTO SELL(SELL_NO, BIKE_NO, C_NO, SOLD_PRICE_LAKH) 
VALUES(200002, 7, 100002, 32.35);

INSERT INTO SELL(SELL_NO, BIKE_NO, C_NO, SOLD_PRICE_LAKH) 
VALUES(200003, 10, 100003, 3.5);

SELECT * FROM Bike_Details;

SELECT * FROM STATUS;

SELECT * FROM CUSTOMER_DETAILS;

SELECT * FROM SELL;

commit;