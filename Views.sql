-- Joining to show the bike _status.

SELECT * FROM Bike_Details b 
	JOIN STATUS S ON
	b.Bike_no = S.Bike_no;

-- Creation of a view to see which customer has bought which bike.

CREATE OR REPLACE VIEW B_and_CU(Bikeno, Company, Model, Cno, CName, CID, Bought_price) AS
SELECT B.BIKE_NO, B.Company, B.Model, C.C_NO, C.C_NAME, C.C_NID, S.SOLD_PRICE_LAKH FROM
Bike_Details B join SELL S 
ON B.BIKE_NO = S.BIKE_NO 
JOIN CUSTOMER_DETAILS C
ON S.C_NO = C.C_NO;   

-- Viewing the view.  
SELECT * FROM B_and_CU;

-- Viewing the sold bikes detailed informations.
/*
SELECT * FROM Bike_Details b 
	JOIN STATUS S ON
	b.Bike_no = S.Bike_no
	WHERE S.Sell_status = 'Sold';
*/
	
-- Viewing the in shop bikes detailed informations.

SELECT * FROM Bike_Details b 
	JOIN STATUS S ON
	b.Bike_no = S.Bike_no
	WHERE S.Sell_status = 'In shop';
	



