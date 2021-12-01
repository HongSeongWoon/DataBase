SELECT*FROM EM;

SELECT *
FROM PRODUCT
WHERE PR_CODE IN('20001','50001','30001');

SELECT *
FROM PRODUCT
WHERE PR_CODE NOT IN('20001','50001','30001');

SELECT*FROM PRODUCT WHERE PR_CODE NOT LIKE '8____';

--1. ��ǰ�̸��� '��Ű'�� ��ǰ�� �˻�
SELECT * FROM PRODUCT WHERE PR_NAME LIKE'%��Ű';

--2. ��ǰ�̸��� '����'�� ������ ��ǰ�˻�
SELECT * FROM PRODUCT WHERE PR_NAME LIKE'%����%';

--3. ��ǰ�̸��� '��'�� �����ϴ� ��� ��ǰ �˻�
SELECT * FROM PRODUCT WHERE PR_NAME LIKE'��%';

--4. ��ǰ������ 4000~7000 �� ���ԵǴ� ��ǰ�˻�
SELECT * FROM PRODUCT WHERE PR_PRICE BETWEEN 4000 AND 7000;
SELECT * FROM PRODUCT WHERE PR_PRICE>=4000 AND PR_PRICE<=7000;

--5. ��ǰ�����ڻ��� 500000�� �ʰ��ϴ� ��ǰ �˻�
SELECT * FROM PRODUCT WHERE PR_COST*PR_STOCKS>=500000;

--6. �������� �ִ� ��ǰ �˻�
SELECT * FROM PRODUCT WHERE PR_DISCOUNT>0;

--7. �ϳ��� ��ǰ�� �Ǹ��Ѵ� ���������� ��ǰ�ڵ�, ��ǰ��, ��ǰ�� ������ ���
SELECT PR_CODE,PR_NAME,(PR_PRICE-PR_COST) FROM PRODUCT WHERE PR_CODE='1004' ;

--8. ��ǰ�� ������ �ǸŰ����� 20%�̻��� ��ǰ�� ��ǰ�ڵ�, ��ǰ��, ���Ŵܰ�, �ǸŰ�, ������ ���
SELECT PR_CODE,PR_NAME,PR_COST,PR_PRICE,(PR_PRICE-PR_COST) FROM PRODUCT WHERE (PR_PRICE - PR_COST) >= (PR_PRICE*20)/100 ;


---------------------------��ǰ�˻� :: SINGLE TABLE----------------------------
-- 1. ��ǰ�̸��� '���'�� ��ǰ�� �˻�
SELECT * FROM PR WHERE PR_NAME = '���';

-- 2. ��ǰ�̸��� ''�� ������ ��ǰ �˻�
SELECT * FROM PR WHERE PR_NAME LIKE '%��%';

-- 3. ��ǰ�̸��� '��'�� �����ϴ� ��� ��ǰ �˻�
SELECT * FROM PR WHERE PR_NAME LIKE '��%';

-- 4. ��ǰ������ 1500~2500�� ���ԵǴ� ��ǰ �˻�
SELECT * FROM PR WHERE PR_PRICE BETWEEN 1500 AND 2500;

-- 5. ��ǰ�����ڻ��� 500000�� �ʰ��ϴ� ��ǰ �˻�
SELECT * FROM PR WHERE PR_COST*PR_STOCKS > 500000;

-- 6. �������� �ִ� ��ǰ �˻�
SELECT * FROM PR WHERE PR_DISCOUNT != 0;

-- 7. �ϳ��� ��ǰ(���͸�)�� �Ǹ��Ѵٰ� �������� �� ��ǰ�ڵ�, ��ǰ��, ��ǰ�� ������ ���
SELECT PR_CODE, PR_NAME, PR_PRICE-PR_COST FROM PR WHERE PR_CODE='1003';

-- 8. ��ǰ�� ������ �ǸŰ����� 20%�̻��� ��ǰ�� ��ǰ�ڵ�, ��ǰ��, ���Ŵܰ�, �ǸŰ�, ������ ���
SELECT PR_CODE, PR_NAME, PR_COST, PR_PRICE, PR_PRICE-PR_COST FROM PR WHERE PR_PRICE-PR_COST >= PR_PRICE*20/100;


---------------------------ȸ���˻� :: SINGLE TABLE----------------------------

SELECT *FROM CU;

--1. ȸ���ڵ尡 '00038'�� ȸ�� �˻�
SELECT *FROM CU WHERE CU_CODE='00038';

--2. ȸ����ȣ�� '3'�� ������ ȸ���˻�
SELECT *FROM CU WHERE CU_CODE LIKE '%3%';

--3. ȸ������� '2'�� ��� ȸ�� �˻�
SELECT *FROM CU WHERE CU_RACODE = '2';

--4. ȸ���̸��� ���� '��'�� �˻�
SELECT *FROM CU WHERE CU_NAME LIKE '��%';


---------------------------����˻� :: SINGLE TABLE----------------------------
SELECT *FROM SE;

--1. �����ڵ尡 '10004'�� ���� �˻�
SELECT *FROM SE WHERE SE_CODE='10004';

--2. �����̸��� '��'�� ������ ����˻�
SELECT *FROM SE WHERE SE_NAME LIKE '%��%';

--3. ���� ���۽ð��� '9'�� �����ϴ� ��� ���� �˻�
SELECT *FROM SE WHERE SE_OPEN LIKE '9%';


---------------------------�����˻� :: SINGLE TABLE----------------------------
SELECT *FROM EM;

--1. �����ڵ尡 '  '�� ���� �˻�
SELECT *FROM EM WHERE EM_SECODE = '10004';

--2. �����̸��� '  '�� ������ �����˻�
SELECT *FROM EM WHERE EM_NAME LIKE '%2%';

--3. �����ڵ忡 '  '�� �����ϴ� ��� ���� �˻�
SELECT *FROM EM WHERE EM_CODE LIKE '%3%';

--4. ������ ����� �ƴ� ���� �˻�
SELECT *FROM EM WHERE EM_NAME NOT LIKE '%���%';
--------------------------------------------------------------------------------------

--HR���� ������ ���̺� ���� ���� -->
SELECT*FROM DBA_USERS;

--HR���� Ȱ��ȭ
ALTER USER HR
IDENTIFIED BY "1234"
ACCOUNT UNLOCK;
--HR ���� ���̺� ��ȸ
SELECT* FROM DBA_TABLES WHERE OWNER = 'HR';

--GRANT
GRANT SELECT ON HR.REGIONS TO GJ21,DH21,DM21,SW22;
GRANT SELECT ON HR.LOCATIONS TO GJ21,DH21,DM21,SW22;
GRANT SELECT ON HR.DEPARTMENTS TO GJ21,DH21,DM21,SW22;
GRANT SELECT ON HR.JOBS TO GJ21,DH21,DM21,SW22;
GRANT SELECT ON HR.EMPLOYEES TO GJ21,DH21,DM21,SW22;
GRANT SELECT ON HR.COUNTRIES TO GJ21,DH21,DM21,SW22;

--DEV
SELECT * FROM HR.EMPLOYEES;

�Լ�-----------------------------------------------------------------------------
/*ORACLE FUNCTION
  NUMERIC FUNCTION
  -- ABS([VALUE|COL])
  -- CEIL([VALUE|COL])
  -- FLOOR([VALUE|COL])
  -- MOD(M,N) = JAVA : % M�� N���� ������ �� �� ���� �� ���� ������ ���(������)
  -- *ROUND(N [, M]) : �ݿø�
  -- *TRUNC() : ���� �ڸ��� ��������
  -- �ø� ROUND ���� �ش��ڸ��� +4
  */
-- ABS([VALUE|COL]) ::  ���밪���� ǥ��
 SELECT ABS(1.2345), ABS(-1.2345) FROM DUAL;
 
--CEIL FOLOOR
SELECT CEIL(1.5345), CEIL(-1.5345), FLOOR(1.5345), FLOOR(-1.5345) FROM DUAL;

--ROUND
SELECT ROUND(190.234),  ROUND(190.234) FROM DUAL;

--TRUNC
SELECT TRUNC(789.5597,2), TRUNC(789.5597,-2) FROM DUAL;

--�ø�
SELECT ROUND(191.234+4,-1),  ROUND(191.234+4) FROM DUAL;

/*
-CHARACTER
-LOWER, UPPER
-SUBSTR(CHAR, M [, N])
-LENGTH(CHAR)
-REPLACE(CHAR, SEARCHSTR, REPLACESTR)
-INSTR(CHAR, SEARCHSTR, START, RANK)
*/



/*CONVERSION FUNCTION
 TO_CHAR([����|��¥],'����')
 TO_NUMBER(���������� ����)
 TO_DATE(��¥������ ����, '����')
*/

SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))-1970+1 FROM DUAL;
SELECT TO_DATE('20211231', 'YYYYMMDD') FROM DUAL;

/*DATE FUNCTION
  
*/
/* CHARACTER FUNCTION 
   - CONCAT(CHAR1, CHAR2)  >> ���ڿ� ����
   - LOWER, UPPER
   - SUBSTR(CHAR, M [, N])
   - LENGTH(CHAR)
   - REPLACE(CHAR, SEARCHSTR, REPLACESTR)
   - INSTR(CHAR, SEARCHSTR, START, RANK)
*/
SELECT CONCAT(CONCAT('��õ�Ϻ�', '��ī����'), 'BHA'), '��õ�Ϻ�' || '��ī����' || 'BHA' FROM DUAL;
SELECT SUBSTR('��õ�Ϻ���ī������õ�Ϻ���ī����', -4)FROM DUAL;
SELECT REPLACE('��õ�Ϻ���ī������õ�Ϻ���ī����', '��ī����', 'ACADEMY')FROM DUAL;
SELECT INSTR('��õ�Ϻ���ī������õ�Ϻ���ī����', '��ī����')FROM DUAL;
SELECT INSTR('��õ�Ϻ���ī������õ�Ϻ���ī����', '��')FROM DUAL;
SELECT INSTR('��õ�Ϻ���ī������õ�Ϻ���ī����', '��ī����', 6)FROM DUAL;
SELECT INSTR('��õ�Ϻ���ī������õ�Ϻ���ī����', '��ī����', 1, 2)FROM DUAL;

/* CONVERSION FUNCTION 
   TO_CHAR([����|��¥], '����')
   TO_NUMBER(���������� ����)
   TO_DATE(��¥������ ����, '����')
*/
SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - 1970 + 1 FROM DUAL;
SELECT TO_DATE('20211231', 'YYYYMMDD') FROM DUAL;

/* DATE FUNCTION 
   ��¥�� +(-) ����  >> ���ڸ� �������� ����
   - SYSDATE
   - ADD_MONTHS(��¥������, ���� ������ ����)
   - MONTHS_BETWEEN(��¥������, ��¥������)   
   - LAST_DAY(��¥������)  �ش����� ���� �ִ� ���� ������ ����
   - NEXT_DAY(��¥������, ���ϼ���)  : ��¥�����͸� �������� �������� ���ƿ��� ������ ��¥�� ����
*/
SELECT SYSDATE-2, ADD_MONTHS(SYSDATE, -2) FROM DUAL;
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('19701106', 'YYYYMMDD')), SYSDATE - TO_DATE('19701106', 'YYYYMMDD')  FROM DUAL;
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 3) FROM DUAL;


/* PRACTICE */
SELECT * FROM HR.EMPLOYEES;

/* 1. 'CLERK'������ �������� ������ ������ ��� 
   �������_____
   -------------------------------------------------------
     �����ȣ     ����̸�      �Ի���      �޿�     �μ��ڵ�
   -------------------------------------------------------
   ��, ����̸��� FIRST_NAME�� LAST NAME�� �������� ǥ��
       �Ի����� XXXX��  XX��  XX�� �� ǥ��
*/
SELECT EMPLOYEE_ID AS �����ȣ ,(FIRST_NAME||LAST_NAME) AS ����̸�,TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY'))||'��'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM'))||'��'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'DD'))||'��' AS �Ի���,SALARY AS �޿�, DEPARTMENT_ID AS �μ��ڵ� FROM HR.EMPLOYEES ;


/* 2. �μ� �ڵ尡 50 �̸��� �μ��� ���������� ��� 
   �������_____
   -------------------------------------------------------------
     �μ��ڵ�    �����ȣ     ����̸�      �Ի���      �޿�  ����
   -------------------------------------------------------------
   ��, ����̸��� FIRST_NAME�� LAST NAME�� �������� ǥ��
       �Ի����� XXXX��  XX��  XX�� �� ǥ��
       ������ (�޿�*12) + Ŀ�̼�:: �������� �� ���� ǥ��
       COALESCE((�޿�*12)+(�޿�*12*0.4), �޿�*12, 0)
*/

SELECT  DEPARTMENT_ID AS �μ��ڵ�, EMPLOYEE_ID AS �����ȣ ,(FIRST_NAME||LAST_NAME) AS ����̸�,TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY'))||'��'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM'))||'��'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'DD'))||'��' AS �Ի���,
SALARY AS �޿�,COALESCE(SALARY*12+(SALARY*12*COMMISSION_PCT),SALARY*12,0) AS ���� FROM HR.EMPLOYEES ;

/* 2. �μ� �ڵ尡 50 �̸��̸鼭 'CLERK'������ �������� ���������� ��� 
   �������_____
   ------------------------------------------------------------------------
     �μ��ڵ�    �����ȣ     ����̸�      �Ի���   ����    �ٹ��ϼ�      ����
   ------------------------------------------------------------------------
   ��, ����̸��� FIRST_NAME�� LAST NAME�� �������� ǥ��
       �Ի����� XXXX��  XX��  XX�� �� ǥ��
       ������ (�޿�*12) + Ŀ�̼� �� ���� ǥ��
*/
SELECT  DEPARTMENT_ID AS �μ��ڵ�, EMPLOYEE_ID AS �����ȣ ,(FIRST_NAME||LAST_NAME) AS ����̸�,
(FIRST_NAME||LAST_NAME) AS ����̸�,TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY'))||'��'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM'))||'��'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'DD'))||'��' AS �Ի���,
TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) AS ����
,  TRUNC( SYSDATE - TO_DATE(TO_CHAR(HIRE_DATE, 'YYYYMMDD')))   AS �ٹ��ϼ�
,SALARY AS �޿�,COALESCE(SALARY*12+(SALARY*12*COMMISSION_PCT),SALARY*12,0) AS ���� FROM HR.EMPLOYEES ;

/* 3. ������ 150000�޷� �̻��� ���������� ��� 
   �������_____
   ------------------------------------------------------------------------
     �����ȣ    ����̸�   �μ��ڵ�    ����  �Ի���   ����    �ٹ��ϼ�      ����   
   ------------------------------------------------------------------------
   ��, ����̸��� FIRST_NAME�� LAST NAME�� �������� ǥ��
       �Ի����� XXXX��  XX��  XX�� �� ǥ��
       ������ (�޿�*12) + Ŀ�̼� �� ���� ǥ��
*/

SELECT  DEPARTMENT_ID AS �μ��ڵ�, EMPLOYEE_ID AS �����ȣ ,(FIRST_NAME||LAST_NAME) AS ����̸�,
(FIRST_NAME||LAST_NAME) AS ����̸�,
TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY'))||'��'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM'))||'��'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'DD'))||'��' AS �Ի���,
TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) AS ����
,  TRUNC( SYSDATE - TO_DATE(TO_CHAR(HIRE_DATE, 'YYYYMMDD')))   AS �ٹ��ϼ�
,SALARY AS �޿�,COALESCE(SALARY*12+(SALARY*12*COMMISSION_PCT),SALARY*12,0) AS ���� 
FROM HR.EMPLOYEES 
WHERE COALESCE(SALARY*12+(SALARY*12*COMMISSION_PCT),SALARY*12,0)>=150000;

--JOIN-------------------------------------------------------------
--0�������� ���ڰ� ������ 0���� ǥ����� 9�� ���ڰ� ������ ǥ���Ͻø���
SELECT E.EMPLOYEE_ID AS EMPCODE,
       E.FIRST_NAME||' '||E.LAST_NAME AS EMPNAME,
       TO_CHAR(E.HIRE_DATE,'YYYY-MM-DD')AS HIREDATE,
       FLOOR(SYSDATE-E.HIRE_DATE) AS WORKDAYS,
       TO_CHAR(E.SALARY,'9,999,990') AS MONTHSAL,
       TO_CHAR(J.MIN_SALARY,'9,999,990') AS MINSAL,
       TO_CHAR(J.MAX_SALARY,'9,999,990') AS MAXSAL
FROM HR.EMPLOYEES E INNER JOIN HR.JOBS J ON E.JOB_ID = J.JOB_ID       
ORDER BY MONTHSAL DESC;

----------------------------------------------------------------
/*�μ����� Administration, Marketing, Purchasing, Human Resources��
  �μ��� ���������� ���(�� �μ��� ������ ���)
  �������
  ------------------------------------------------------------------------
     �μ��ڵ�  �μ���   �����ȣ     ����̸�    �Ի���   ����   �ٹ��ϼ�    ����    �ִ뿬��
      E = D     D        E          E          E     F:E    F:E       F:E      F:J
   ------------------------------------------------------------------------
*/
SELECT*FROM HR.employees;
SELECT*FROM HR.departments;

SELECT E.DEPARTMENT_ID AS �μ��ڵ�,
       D.DEPARTMENT_NAME AS �μ���,
       E.EMPLOYEE_ID AS �����ȣ,
       E.FIRST_NAME||' '||E.LAST_NAME AS ����̸�,
       TO_NUMBER(TO_CHAR(E.HIRE_DATE, 'YYYY'))||'��'||TO_NUMBER(TO_CHAR(E.HIRE_DATE, 'MM'))||'��'||TO_NUMBER(TO_CHAR(E.HIRE_DATE, 'DD'))||'��' AS �Ի���,
       TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - TO_NUMBER(TO_CHAR(E.HIRE_DATE, 'YYYY'))+1 AS ����,
       FLOOR(SYSDATE-E.HIRE_DATE) AS �ٹ��ϼ�,
       COALESCE(E.SALARY*12+(E.SALARY*12*(E.COMMISSION_PCT*100))/100,E.SALARY*12) AS ����,
       J.MAX_SALARY * 12 AS MAXYEARPAY
FROM HR.EMPLOYEES E INNER JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                    INNER JOIN HR.JOBS J ON E.JOB_ID=J.JOB_ID
WHERE D.DEPARTMENT_NAME='Administration' OR D.DEPARTMENT_NAME='Marketing' OR D.DEPARTMENT_NAME='Purchasing' OR D.DEPARTMENT_NAME='Human Resources';


/**/
SELECT * FROM DBA_TABLES WHERE OWNER = 'HR';
SELECT * FROM HR.REGIONS;

/* �������� ���� 
--------------------------------------------------------
  �����ȣ   �����         ������     �μ���      �μ�����          
                                         (������-�����-���ø�)
     E       E              J        D     R     C     L
E----   JOB_ID      ----J
E---- DEPARTMENT_ID ----D     
D---- LOCATION_ID   ----L
L---- COUNTRY_ID    ----C
C---- REGION_ID     ----R
--------------------------------------------------------
*/
SELECT*FROM EMPINFO;
SELECT*FROM HR.EMPLOYEES;
CREATE OR REPLACE VIEW EMPINFO
AS
SELECT  E.EMPLOYEE_ID AS ECODE,
        E.FIRST_NAME || ' ' || E.LAST_NAME AS ENAME,
        J.JOB_TITLE AS JNAME,
        D.DEPARTMENT_NAME AS DNAME,
        R.REGION_NAME || ' ' || C.COUNTRY_NAME || ' ' || L.CITY  AS DINFO
FROM HR.EMPLOYEES E INNER JOIN HR.JOBS J ON E.JOB_ID = J.JOB_ID
                    INNER JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                    INNER JOIN HR.LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
                    INNER JOIN HR.COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
                    INNER JOIN HR.REGIONS R ON C.REGION_ID = R.REGION_ID
--����ȉ� SELECT  * FROM EMPINFO WHERE UPPER(DINFO) LIKE 'AMERICA%';
--WHERE UPPER(R.REGION_NAME || ' ' || C.COUNTRY_NAME || ' ' || L.CITY) LIKE 'AMERICA%'�̷��� �ؾ� �����;
--view �Ҷ��� where��������.


--kimberly department_id ����



/* �Ƹ޸�ī�� �ٹ��ϴ� �������� ������ ���
--------------------------------------------------------
  �����ȣ   �����         ������     �μ���      �μ����� 
--------------------------------------------------------
*/ 
--VIEW�� ����� WHERE�� ����
SELECT  * FROM EMPINFO WHERE UPPER(DINFO) LIKE 'AMERICA%';
/* �������� Administration Assistant�� �������� ������ ���
--------------------------------------------------------
  �����ȣ   �����         ������     �μ���      �μ����� 
--------------------------------------------------------
*/
SELECT  * FROM EMPINFO WHERE JNAME = 'Administration Assistant';


--����Ǯ��---------------------------------------------------------------

SELECT*FROM HR.EMPLOYEES;
 CREATE OR REPLACE VIEW EMPINFO4
AS
SELECT  E.EMPLOYEE_ID AS �����ȣ,
        E.FIRST_NAME || ' ' || E.LAST_NAME AS �����,
        TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - TO_NUMBER(TO_CHAR(E.HIRE_DATE, 'YYYY'))+1 AS ����,
        J.JOB_TITLE AS ������,
        L.CITY  AS ���ø�,
        D.DEPARTMENT_NAME AS �μ���,
        E.SALARY AS �޿�,
        COALESCE(E.COMMISSION_PCT,0) AS Ŀ�̼�,
        COALESCE(E.SALARY*12+(E.SALARY*12*(E.COMMISSION_PCT*100))/100,E.SALARY*12) AS ����,
        C.COUNTRY_NAME  AS ����,
        R.REGION_NAME   AS ����
FROM HR.EMPLOYEES E INNER JOIN HR.JOBS J ON E.JOB_ID = J.JOB_ID
                    INNER JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                    INNER JOIN HR.LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
                    INNER JOIN HR.COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
                    INNER JOIN HR.REGIONS R ON C.REGION_ID = R.REGION_ID;


 /* 1. ������ 15���޷� �̻��� ������ �� AMERICA ������ �ٹ��ϴ� ������ ������ ��� 
    ---------------------------------------------------------------------
      �����ȣ   �����      ������     �μ���      ���ø�  �޿�   Ŀ�̼�   ����
    ---------------------------------------------------------------------
    �� Ŀ�̼��� ���� ��� 0���� ��ü
  */
  SELECT*FROM EMPINFO2;
  SELECT  "�����ȣ","�����","������","�μ���","���ø�","�޿�","Ŀ�̼�","����"
  FROM EMPINFO4 WHERE ���� >=150000 AND ���� LIKE '%America%';
------------------------------------------------------------------------------------  
  
  /* 2. 15���� �̻� �ٹ��ϰ� �ִ� ���� �� �� ������ 10���޷� �̻��� ������ ������ ��� 
    ---------------------------------------------------------------------
      �����ȣ   �����   ����   ������     �μ���      �޿�   Ŀ�̼�    ����
    ---------------------------------------------------------------------
    �� Ŀ�̼��� ���� ��� 0���� ��ü
  */
  SELECT "�����ȣ","�����","����","������","�μ���","�޿�","Ŀ�̼�","����" FROM EMPINFO4 WHERE ���� >='100000' AND ���� >= '15';
  
--------------------------------------------------------------------------------
 
  /* 3. Australia, Belgium, Brazil, Canada���� �ٹ��ϴ� ���� �� �� 10���� �̻� �̸鼭 ������ 10���̻���
       ������ �������� ��� 
---------------------------------------------------------------------
 �����ȣ   �����   ����   ������     �μ���      �޿�   Ŀ�̼�    ���� 
---------------------------------------------------------------------
    �� Ŀ�̼��� ���� ��� 0���� ��ü
 *//*���� >='100000' AND ���� >= '10' AND'%Australia%' OR  '%Belgium%'  OR '%Brazil%'  OR*/
 SELECT *
 FROM EMPINFO4;
 SELECT "�����ȣ","�����","����","������","�μ���","�޿�","Ŀ�̼�","����"
 FROM EMPINFO4 
 WHERE  (���� LIKE  '%Canada%' OR ���� LIKE  '%Belgium%' OR ���� LIKE  '%Australia%'OR ���� LIKE  '%Brazil%') AND ���� >='100000' AND ���� >= '10';
 SELECT*FROM PR;
 
 /* Ư����(WHERE) ��ü��ǰ�Ǹ� ���� Ȯ��
   ------------------------------------------------------------
       �����     ��ǰ��      ����       ����        �հ�
         SR        GO        OS        GO        F: GO  OS
   ------------------------------------------------------------
*/
CREATE OR REPLACE VIEW SALESINFODAY
AS
SELECT  NVL(SE.SE_NAME, 'NONE') AS SENAME, 
        PR.PR_NAME AS PRNAME ,
        PR.PR_PRICE AS PRPRICE, 
        COALESCE(PR.PR_PRICE * ODD.ODD_QUANTITY, 0) AS AMOUNT,
        NVL(ODD.ODD_ODCODE, 'NONE') AS ODCODE, 
        NVL(ODD.ODD_SECODE, 'NONE') AS SECODE, 
        NVL(ODD.ODD_PSCODE, 'NONE') AS POCODE, 
        PR.PR_CODE AS PRCODE
FROM ODD INNER JOIN SE ON ODD.ODD_SECODE = SE.SE_CODE
         INNER JOIN PR ON ODD.ODD_PRCODE = PR.PR_CODE;
SELECT*FROM salesinfoday;

SELECT * FROM SALESINFODAY WHERE SUBSTR(ODCODE, 1, 8) = '20211109';
SELECT * FROM SALESINFODAY WHERE ODCODE LIKE '20211107______';


SELECT*
FROM PR LEFT OUTER JOIN(SELECT * 
                        FROM SALESINFODAY 
                        WHERE SUBSTR(ODCODE, 1, 8) = '20211109') SI
ON PR.PR_CODE=SI.PRCODE;


SELECT*
FROM PR LEFT OUTER JOIN(SELECT  NVL(SE.SE_NAME, 'NONE') AS SENAME, 
                        PR.PR_NAME AS PRNAME ,
                        PR.PR_PRICE AS PRPRICE, 
                        COALESCE(PR.PR_PRICE * ODD.ODD_QUANTITY, 0) AS AMOUNT,
                        NVL(ODD.ODD_ODCODE, 'NONE') AS ODCODE, 
                        NVL(ODD.ODD_SECODE, 'NONE') AS SECODE, 
                        NVL(ODD.ODD_PSCODE, 'NONE') AS POCODE, 
                        PR.PR_CODE AS PRCODE
                        FROM ODD INNER JOIN SE ON ODD.ODD_SECODE = SE.SE_CODE
                                 INNER JOIN PR ON ODD.ODD_PRCODE = PR.PR_CODE
                                 WHERE SUBSTR(ODD.ODD_ODCODE, 1, 8) = '20211109') SI
ON PR.PR_CODE=SI.PRCODE;
---------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW SALESINFO
AS
SELECT NVL(SE.SE_NAME,'NONE')AS SENAME,
       PR.PR_NAME AS PRNAME,
       NVL(ODD.ODD_QUANTITY,0)AS QUANTITY,
       PR.PR_COST AS PRCOST,
       PR.PR_PRICE AS PRPRICE,
       ODD.ODD_ODCODE AS ODCODE,
       ODD.ODD_SECODE AS SECODE,
       ODD.ODD_PSCODE AS PSCODE,
       PR.PR_CODE AS PRCODE
FROM ODD INNER JOIN SE ON ODD.ODD_SECODE=SE.SE_CODE
         INNER JOIN PR ON ODD.ODD_PRCODE=PR.PR_CODE;
         
--VIEW�� Ȱ��
SELECT*FROM SALESINFO;

SELECT NVL(SS.PRNAME,PR.PR_NAME)AS PRNAME,
       COALESCE(SUM(SS.QUANTITY),0)AS TOTQTY,
       COALESCE(SUM(SS.QUANTITY*SS.PRPRICE),0)AS TOTAMOUNT,
       COALESCE(SUM((SS.PRPRICE-SS.PRCOST)*SS.QUANTITY),0)AS TOTMARGIN
      
FROM SALESINFO SS RIGHT OUTER JOIN PR ON SS.PRCODE = PR.PR_CODE
GROUP BY PRCODE, NVL(SS.PRNAME,PR.PR_NAME);

-------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW SALESINFO2
AS
SELECT NVL(SE.SE_NAME,'NONE')AS SENAME,
       PR.PR_NAME AS PRNAME,
       NVL(ODD.ODD_QUANTITY,0)AS QUANTITY,
       PR.PR_COST AS PRCOST,
       PR.PR_PRICE AS PRPRICE,
       ODD.ODD_ODCODE AS ODCODE,
       ODD.ODD_SECODE AS SECODE,
       ODD.ODD_PSCODE AS PSCODE,
       PR.PR_CODE AS PRCODE,
       OD.OD_CUCODE AS CUCODE,
       (ODD.ODD_QUANTITY*PR.PR_PRICE)AS TOTAMOUNT,
       (PR.PR_PRICE-PR.PR_COST) *ODD.ODD_QUANTITY AS MARGIN,
       CA.CAT_CODE AS CATCODE
FROM ODD INNER JOIN SE ON ODD.ODD_SECODE=SE.SE_CODE
         INNER JOIN PR ON ODD.ODD_PRCODE=PR.PR_CODE
         INNER JOIN OD ON ODD.ODD_ODCODE=OD.OD_CODE
         INNER JOIN CA ON CA.CAT_CODE=PR.PR_CATCODE;

/* GROUPING PRACTICE */
/* 1. ���� ��ǰ �Ǹ� ������ ��� 
    -------------------------------------------------------------------------
     ���ڵ�     ����         ���Ǹž�    
    -------------------------------------------------------------------------
*/



SELECT
    * FROM SALESINFO2;
    
SELECT NVL(SS2.CUCODE, 'NONE') AS CUCODE,
       CU.CU_NAME AS CUNAME,
       COALESCE(SUM(ss2.totamount),0) AS TOTAMOUNT
FROM SALESINFO2 SS2 RIGHT OUTER JOIN CU ON SS2.CUCODE = CU.CU_CODE
GROUP BY SS2.CUCODE,CU.CU_NAME
ORDER BY TOTAMOUNT DESC;
/* 2. Ư�� ���� ��ǰ �Ǹ� ������ ��� 
    -------------------------------------------------------------------------
     �Ǹ���    ��ǰ��    �Ǹż���     �Ǹž� 
    -------------------------------------------------------------------------
*/
SELECT SUBSTR(SS2.ODCODE, 1, 8)  AS SALEDAY,
       SS2.PRNAME AS PRNAME,
       SS2.QUANTITY AS SALEQUANTITY,
       SS2.TOTAMOUNT AS TOTAMOUNT
FROM SALESINFO2 SS2 RIGHT OUTER JOIN CU ON SS2.CUCODE = CU.CU_CODE
WHERE SS2.CUCODE = '20001';


/* 3. Ư���� ~ Ư���� �Ⱓ������ ��ü ��ǰ �Ǹ� ������ ��� 
    -------------------------------------------------------------------------
       ��ǰ��    �Ǹż���     �Ǹž�   ���;�
    -------------------------------------------------------------------------
*/
SELECT SS2.PRNAME AS PRNAME,
        COALESCE(SUM(SS2.QUANTITY),0) AS SALEQUANTITY,
       COALESCE(SUM(SS2.TOTAMOUNT),0) AS TOTAMOUNT,
       COALESCE(SUM(SS2.MARGIN),0) AS MARGIN
       FROM SALESINFO2 SS2 RIGHT OUTER JOIN OD ON SS2.ODCODE = OD.OD_CODE
WHERE SUBSTR(SS2.ODCODE, 1, 8) >20211111 AND  SUBSTR(SS2.ODCODE, 1, 8)<20211115
GROUP BY SS2.PRNAME;


/* 4. Ư���Ⱓ ���� ���������� ���Ϻ��� ��� 
    -------------------------------------------------------------------------
       ����     �Ǹž�       ���;�
    -------------------------------------------------------------------------
*/

SELECT TO_CHAR( TO_DATE(SUBSTR(SS2.ODCODE, 1, 8), 'YYYYMMDD'), 'day' ) AS DAYofWEEK,
       COALESCE(SUM(SS2.TOTAMOUNT),0) AS TOTAMOUNT,
       COALESCE(SUM(SS2.MARGIN),0) AS MARGIN
       FROM SALESINFO2 SS2 
WHERE SUBSTR(SS2.ODCODE, 1, 8) >20211101 AND  SUBSTR(SS2.ODCODE, 1, 8)<20211115
GROUP BY TO_CHAR( TO_DATE(SUBSTR(SS2.ODCODE, 1, 8), 'YYYYMMDD'), 'day' );


/* 5. ī�װ� �� ��ü ��ǰ�� �Ǹ����� ���
    -------------------------------------------------------------------------
       ī�װ���      �Ǹž�       ���;�
    -------------------------------------------------------------------------
*/

SELECT CA.CAT_NAME AS CATEGORIES,
       COALESCE(SUM(SS2.TOTAMOUNT),0) AS TOTAMOUNT,
       COALESCE(SUM(SS2.MARGIN),0) AS MARGIN
       FROM SALESINFO2 SS2 RIGHT OUTER JOIN CA ON SS2.CATCODE = CA.CAT_CODE
GROUP BY CA.CAT_NAME;
     