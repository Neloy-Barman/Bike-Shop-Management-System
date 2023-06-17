SET SERVEROUTPUT ON;


CREATE OR REPLACE PACKAGE ProfitPack AS
	FUNCTION CALCULATE
		RETURN NUMBER;
END ProfitPack;
/

CREATE OR REPLACE PACKAGE BODY ProfitPack AS
	FUNCTION CALCULATE
		RETURN NUMBER
	IS
	
	TotalProfit SELL.SOLD_PRICE_LAKH%TYPE;	
	BEGIN 
		
		TotalProfit := 0;
		FOR R IN (SELECT * FROM SELL) LOOP
		
		FOR S IN (SELECT * FROM Bike_Details) LOOP
			IF R.BIKE_NO = S.Bike_no THEN
				TotalProfit := (TotalProfit + ABS(R.SOLD_PRICE_LAKH - S.Price_Lakh));
			END IF;
			
		END LOOP;	
	END LOOP;

	RETURN TotalProfit;
	END CALCULATE;
END ProfitPack;
/


SELECT Bike_Details.Bike_no, Bike_Details.Company from Bike_Details JOIN STATUS ON Bike_Details.Bike_no = STATUS.Bike_no where STATUS.Sell_status = 'In shop';


--ACCEPT A PROMPT 'Input Search Type(Avail or Sold): ';

DECLARE
	inputType varchar2(20);
	BasePrice Bike_Details.Price_Lakh%TYPE;
	SoldPrice SELL.SOLD_PRICE_LAKH%TYPE;
	Profit SELL.SOLD_PRICE_LAKH%TYPE;
	

BEGIN
	
	Profit := ProfitPack.CALCULATE;
	
	DBMS_OUTPUT.PUT_LINE('Total Profit: ' || Profit || ' Lakh');

END;
/