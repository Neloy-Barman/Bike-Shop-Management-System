SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT P PROMPT 'Estimated Price: ';

CREATE OR REPLACE VIEW SHORT_DETAILS(Bike_no, Company, Model, Engine, Price, STAT) AS
SELECT B.BIKE_NO, B.COMPANY, B.Model, B.Engine_cc, B.Price_Lakh, S.SELL_STATUS 
FROM Bike_Details B JOIN STATUS S
ON B.Bike_No = S.Bike_No;

Select * from SHORT_DETAILS; 

CREATE TABLE TEMP
(
	Diff NUMBER,
	Pe NUMBER
);

CREATE TABLE TEMP_L
(
	Pe NUMBER
);

CREATE OR REPLACE PACKAGE B_S AS
	PROCEDURE B_RANGE(P IN NUMBER); 
END B_S;
/

CREATE OR REPLACE PACKAGE BODY B_S AS
	
	PROCEDURE B_RANGE(P IN NUMBER)
	IS
	BEGIN
		FOR R IN (SELECT Price FROM SHORT_DETAILS WHERE STAT = 'In shop') LOOP
			--DBMS_OUTPUT.PUT_LINE(ABS(P - R.Price));
			INSERT INTO TEMP(Diff,Pe) VALUES(ABS(P - R.Price), R.Price);
		END LOOP;
		
		FOR R IN (SELECT * FROM TEMP ORDER BY Diff) LOOP
			--DBMS_OUTPUT.PUT_LINE(R.Diff||' '||R.Pe);
			INSERT INTO TEMP_L(Pe) VALUES(R.Pe);
			-- I := I + 1; 
			-- INSERT INTO TEMP(Diff,Pe) VALUES(ABS(P - R.Price), R.Price);
		END LOOP;
	END B_RANGE;
	
END B_S;
/

DECLARE
	Pc NUMBER;
	C NUMBER;
	Flag NUMBER;
	T NUMBER;
BEGIN
	Pc := &P;
	B_S.B_RANGE(Pc);
	
	Flag := 1;
	FOR R IN (SELECT * FROM TEMP_L) LOOP
		--DBMS_OUTPUT.PUT_LINE(R.Pe);
		FOR S IN (SELECT * FROM Bike_Details) LOOP
			IF R.Pe = S.Price_Lakh and Flag < 4 THEN
				DBMS_OUTPUT.PUT_LINE('	Choice: '||Flag);
				DBMS_OUTPUT.PUT_LINE('Company: '||S.Company);
				DBMS_OUTPUT.PUT_LINE('Model: '||S.Model);
				DBMS_OUTPUT.PUT_LINE('Engine: '||S.Engine_cc||' (cc)');
				DBMS_OUTPUT.PUT_LINE('Power: '||S.B_Power_ps||' (ps)');
				DBMS_OUTPUT.PUT_LINE('Mileage: '||S.Mileage_kmpl||' (kmpl)');
				DBMS_OUTPUT.PUT_LINE('Brakes: '||S.Brakes);
				DBMS_OUTPUT.PUT_LINE('Price: '||S.Price_Lakh||' lakhs');
				DBMS_OUTPUT.PUT_LINE('Brakes: '||S.Brakes);
				DBMS_OUTPUT.PUT_LINE('--------------------------');
				Flag := Flag + 1;
			END IF;
		END LOOP;
	END LOOP;	
END;
/

--SELECT * FROM TEMP;

--SELECT * FROM TEMP_L;

DROP TABLE TEMP; 

DROP TABLE TEMP_L;

 