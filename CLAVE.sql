SELECT * FROM AC_MOTIVO

SELECT FLOOR(RAND()*(999999-1)+1) AS CLAVE


DECLARE @CLAVE VARCHAR(10) = (SELECT FLOOR(RAND()*(999999-1)+1))
--SET @HashThis = CONVERT(NVARCHAR(32), (SELECT FLOOR(RAND()*(999999-1)+1)));  
--SELECT HASHBYTES('SHA2_256', @CLAVE);  
UPDATE AC_MOTIVO SET CLAVE = (SELECT HASHBYTES('SHA1',@CLAVE)) WHERE CODIGO='A'
SELECT * FROM AC_MOTIVO

SELECT HASHBYTES('SHA2_256',(SELECT FLOOR(RAND()*(999999-1)+1) AS CLAVE))



SELECT HASHBYTES('SHA2_256',(SELECT FLOOR(RAND()*(999999-1)+1)))



SELECT HashBytes('MD5','qbit.com.mx')
SELECT HashBytes('SHA','qbit.com.mx')
SELECT HashBytes('SHA1','qbit.com.mx')


SELECT SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('MD5', 'qbit.com.mx'), 3, 32) AS MD5
SELECT SUBSTRING((HashBytes('SHA', (SELECT TOP 1 CLAVE FROM AC_MOTIVO)), 3, 40) AS SHA
SELECT SUBSTRING((SELECT TOP 1 CLAVE FROM AC_MOTIVO),1,500) AS SHA1