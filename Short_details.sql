
SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- Checking the available bikes or the sold bikes. 

ACCEPT SI PROMPT 'Sold or In shop?: ';

-- Creating a view after joining.

CREATE OR REPLACE VIEW SHORT_DETAILS(Bike_no, Company, Model, Engine, Price, STAT) AS
SELECT B.BIKE_NO, B.COMPANY, B.Model, B.Engine_cc, B.Price_Lakh, S.SELL_STATUS 
FROM Bike_Details B JOIN STATUS S
ON B.Bike_No = S.Bike_No;

Select * from SHORT_DETAILS; 

DECLARE
	B SHORT_DETAILS.Bike_No%TYPE;
	C SHORT_DETAILS.Company%TYPE;
	M SHORT_DETAILS.Model%TYPE;
	E SHORT_DETAILS.Engine%TYPE;
	P SHORT_DETAILS.Price%TYPE;
	SO SHORT_DETAILS.STAT%TYPE;
	Ex EXCEPTION;
BEGIN
	SO := '&SI';
	IF SO = 'Sold' or SO = 'In shop' THEN
		DBMS_OUTPUT.PUT_LINE('No'||' '||'Company'||'         '||'Model'||'      '||'Engine'||' '||'Price');
		FOR R IN (SELECT * FROM SHORT_DETAILS WHERE STAT = SO) LOOP
			B := R.Bike_No;
			C := R.Company;
			M := R.Model;
			E := R.Engine;
			P := R.Price;
			DBMS_OUTPUT.PUT_LINE(' '||B||'  '||C||' '||M||'  '||E||'    '||P||' ');
		END LOOP;
	ELSE
		RAISE EX;
	END IF;
	
	EXCEPTION
		WHEN Ex THEN
			DBMS_OUTPUT.PUT_LINE('Invalid Input');
END;
/