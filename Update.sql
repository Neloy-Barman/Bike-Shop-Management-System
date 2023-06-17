--UPDATE QUERY in package

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER HELLO 
AFTER UPDATE 
ON Bike_Details
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Bike_Details TABLE HAS BEEN UPDATED!!!');
END;
/

CREATE OR REPLACE PACKAGE updatepack AS
	PROCEDURE UpPro(A IN Bike_Details.Price_Lakh%TYPE, B IN Bike_Details.Model%TYPE);
END updatepack;
/

CREATE OR REPLACE PACKAGE BODY updatepack AS
	PROCEDURE UpPro(A IN Bike_Details.Price_Lakh%TYPE, B IN Bike_Details.Model%TYPE)
	
	IS
		
	BEGIN 
		UPDATE Bike_Details SET Price_Lakh = A where Model = B;
			
	END UpPro;
END updatepack;
/


ACCEPT IPrice PROMPT 'Input price ';
ACCEPT IModel PROMPT 'Input Model ';

		
DECLARE

	InputPrice Bike_Details.Price_Lakh%TYPE;
	InputModel Bike_Details.Model%TYPE;
	


BEGIN
	InputPrice := &IPrice;
	InputModel := '&IModel';
	updatepack.UpPro(InputPrice, InputModel);
	
	EXCEPTION 
		WHEN NO_DATA_FOUND THEN
			DBMS.PUT_LINE('No Data Entry.')
	
END;
/