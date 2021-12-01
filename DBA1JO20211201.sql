SELECT*FROM EM;

SELECT *
FROM PRODUCT
WHERE PR_CODE IN('20001','50001','30001');

SELECT *
FROM PRODUCT
WHERE PR_CODE NOT IN('20001','50001','30001');

SELECT*FROM PRODUCT WHERE PR_CODE NOT LIKE '8____';

--1. 상품이름이 '쿠키'인 상품을 검색
SELECT * FROM PRODUCT WHERE PR_NAME LIKE'%쿠키';

--2. 상품이름이 '만두'를 포함한 상품검색
SELECT * FROM PRODUCT WHERE PR_NAME LIKE'%만두%';

--3. 상품이름이 '냉'로 시작하는 모든 상품 검색
SELECT * FROM PRODUCT WHERE PR_NAME LIKE'냉%';

--4. 상품가격이 4000~7000 에 포함되는 상품검색
SELECT * FROM PRODUCT WHERE PR_PRICE BETWEEN 4000 AND 7000;
SELECT * FROM PRODUCT WHERE PR_PRICE>=4000 AND PR_PRICE<=7000;

--5. 상품구매자산이 500000을 초과하는 상품 검색
SELECT * FROM PRODUCT WHERE PR_COST*PR_STOCKS>=500000;

--6. 할인율이 있는 상품 검색
SELECT * FROM PRODUCT WHERE PR_DISCOUNT>0;

--7. 하나의 상품을 판매한다 가정했을때 상품코드, 상품명, 상품별 수익을 출력
SELECT PR_CODE,PR_NAME,(PR_PRICE-PR_COST) FROM PRODUCT WHERE PR_CODE='1004' ;

--8. 상품별 수익이 판매가격의 20%이상인 상품의 상품코드, 상품명, 구매단가, 판매가, 수익을 출력
SELECT PR_CODE,PR_NAME,PR_COST,PR_PRICE,(PR_PRICE-PR_COST) FROM PRODUCT WHERE (PR_PRICE - PR_COST) >= (PR_PRICE*20)/100 ;


---------------------------상품검색 :: SINGLE TABLE----------------------------
-- 1. 상품이름이 '계란'인 상품을 검색
SELECT * FROM PR WHERE PR_NAME = '계란';

-- 2. 상품이름이 ''를 포함한 상품 검색
SELECT * FROM PR WHERE PR_NAME LIKE '%냉%';

-- 3. 상품이름이 '매'로 시작하는 모든 상품 검색
SELECT * FROM PR WHERE PR_NAME LIKE '매%';

-- 4. 상품가격이 1500~2500에 포함되는 상품 검색
SELECT * FROM PR WHERE PR_PRICE BETWEEN 1500 AND 2500;

-- 5. 상품구매자산이 500000을 초과하는 상품 검색
SELECT * FROM PR WHERE PR_COST*PR_STOCKS > 500000;

-- 6. 할인율이 있는 상품 검색
SELECT * FROM PR WHERE PR_DISCOUNT != 0;

-- 7. 하나의 상품(버터링)을 판매한다고 가정했을 때 상품코드, 상품명, 상품별 수익을 출력
SELECT PR_CODE, PR_NAME, PR_PRICE-PR_COST FROM PR WHERE PR_CODE='1003';

-- 8. 상품별 수익이 판매가격의 20%이상인 상품의 상품코드, 상품명, 구매단가, 판매가, 수익을 출력
SELECT PR_CODE, PR_NAME, PR_COST, PR_PRICE, PR_PRICE-PR_COST FROM PR WHERE PR_PRICE-PR_COST >= PR_PRICE*20/100;


---------------------------회원검색 :: SINGLE TABLE----------------------------

SELECT *FROM CU;

--1. 회원코드가 '00038'인 회원 검색
SELECT *FROM CU WHERE CU_CODE='00038';

--2. 회원번호가 '3'를 포함한 회원검색
SELECT *FROM CU WHERE CU_CODE LIKE '%3%';

--3. 회원등급이 '2'인 모든 회원 검색
SELECT *FROM CU WHERE CU_RACODE = '2';

--4. 회원이름중 성이 '김'씨 검색
SELECT *FROM CU WHERE CU_NAME LIKE '김%';


---------------------------매장검색 :: SINGLE TABLE----------------------------
SELECT *FROM SE;

--1. 매장코드가 '10004'인 매장 검색
SELECT *FROM SE WHERE SE_CODE='10004';

--2. 매장이름이 '학'를 포함한 매장검색
SELECT *FROM SE WHERE SE_NAME LIKE '%학%';

--3. 매장 시작시간이 '9'로 시작하는 모든 매장 검색
SELECT *FROM SE WHERE SE_OPEN LIKE '9%';


---------------------------직원검색 :: SINGLE TABLE----------------------------
SELECT *FROM EM;

--1. 매장코드가 '  '인 직원 검색
SELECT *FROM EM WHERE EM_SECODE = '10004';

--2. 직원이름이 '  '를 포함한 직원검색
SELECT *FROM EM WHERE EM_NAME LIKE '%2%';

--3. 직원코드에 '  '를 포함하는 모든 매장 검색
SELECT *FROM EM WHERE EM_CODE LIKE '%3%';

--4. 직원중 사람이 아닌 직원 검색
SELECT *FROM EM WHERE EM_NAME NOT LIKE '%사람%';
--------------------------------------------------------------------------------------

--HR계정 소유의 테이블 접근 권한 -->
SELECT*FROM DBA_USERS;

--HR계정 활성화
ALTER USER HR
IDENTIFIED BY "1234"
ACCOUNT UNLOCK;
--HR 소유 테이블 조회
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

함수-----------------------------------------------------------------------------
/*ORACLE FUNCTION
  NUMERIC FUNCTION
  -- ABS([VALUE|COL])
  -- CEIL([VALUE|COL])
  -- FLOOR([VALUE|COL])
  -- MOD(M,N) = JAVA : % M을 N으로 나누기 할 때 나눌 수 없는 정수값 출력(나머지)
  -- *ROUND(N [, M]) : 반올림
  -- *TRUNC() : 절삭 자리수 지정가능
  -- 올림 ROUND 쓰고 해당자리에 +4
  */
-- ABS([VALUE|COL]) ::  절대값으로 표시
 SELECT ABS(1.2345), ABS(-1.2345) FROM DUAL;
 
--CEIL FOLOOR
SELECT CEIL(1.5345), CEIL(-1.5345), FLOOR(1.5345), FLOOR(-1.5345) FROM DUAL;

--ROUND
SELECT ROUND(190.234),  ROUND(190.234) FROM DUAL;

--TRUNC
SELECT TRUNC(789.5597,2), TRUNC(789.5597,-2) FROM DUAL;

--올림
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
 TO_CHAR([숫자|날짜],'형식')
 TO_NUMBER(숫자형식의 문자)
 TO_DATE(날짜형식의 문자, '형식')
*/

SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))-1970+1 FROM DUAL;
SELECT TO_DATE('20211231', 'YYYYMMDD') FROM DUAL;

/*DATE FUNCTION
  
*/
/* CHARACTER FUNCTION 
   - CONCAT(CHAR1, CHAR2)  >> 문자열 연결
   - LOWER, UPPER
   - SUBSTR(CHAR, M [, N])
   - LENGTH(CHAR)
   - REPLACE(CHAR, SEARCHSTR, REPLACESTR)
   - INSTR(CHAR, SEARCHSTR, START, RANK)
*/
SELECT CONCAT(CONCAT('인천일보', '아카데미'), 'BHA'), '인천일보' || '아카데미' || 'BHA' FROM DUAL;
SELECT SUBSTR('인천일보아카데미인천일보아카데미', -4)FROM DUAL;
SELECT REPLACE('인천일보아카데미인천일보아카데미', '아카데미', 'ACADEMY')FROM DUAL;
SELECT INSTR('인천일보아카데미인천일보아카데미', '아카데미')FROM DUAL;
SELECT INSTR('인천일보아카데미인천일보아카데미', '아')FROM DUAL;
SELECT INSTR('인천일보아카데미인천일보아카데미', '아카데미', 6)FROM DUAL;
SELECT INSTR('인천일보아카데미인천일보아카데미', '아카데미', 1, 2)FROM DUAL;

/* CONVERSION FUNCTION 
   TO_CHAR([숫자|날짜], '형식')
   TO_NUMBER(숫자형식의 문자)
   TO_DATE(날짜형식의 문자, '형식')
*/
SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - 1970 + 1 FROM DUAL;
SELECT TO_DATE('20211231', 'YYYYMMDD') FROM DUAL;

/* DATE FUNCTION 
   날짜값 +(-) 정수  >> 일자를 기준으로 연산
   - SYSDATE
   - ADD_MONTHS(날짜데이터, 월에 연산할 정수)
   - MONTHS_BETWEEN(날짜데이터, 날짜데이터)   
   - LAST_DAY(날짜데이터)  해당일이 속해 있는 달의 마지막 일자
   - NEXT_DAY(날짜데이터, 요일순번)  : 날짜데이터를 기준으로 다음으로 돌아오는 요일의 날짜를 리턴
*/
SELECT SYSDATE-2, ADD_MONTHS(SYSDATE, -2) FROM DUAL;
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('19701106', 'YYYYMMDD')), SYSDATE - TO_DATE('19701106', 'YYYYMMDD')  FROM DUAL;
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 3) FROM DUAL;


/* PRACTICE */
SELECT * FROM HR.EMPLOYEES;

/* 1. 'CLERK'업무를 수행중인 직원의 정보를 출력 
   출력형식_____
   -------------------------------------------------------
     사원번호     사원이름      입사일      급여     부서코드
   -------------------------------------------------------
   단, 사원이름은 FIRST_NAME과 LAST NAME의 결합으로 표시
       입사일은 XXXX년  XX월  XX일 로 표시
*/
SELECT EMPLOYEE_ID AS 사원번호 ,(FIRST_NAME||LAST_NAME) AS 사원이름,TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY'))||'년'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM'))||'월'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'DD'))||'일' AS 입사일,SALARY AS 급여, DEPARTMENT_ID AS 부서코드 FROM HR.EMPLOYEES ;


/* 2. 부서 코드가 50 미만인 부서의 직원정보를 출력 
   출력형식_____
   -------------------------------------------------------------
     부서코드    사원번호     사원이름      입사일      급여  연봉
   -------------------------------------------------------------
   단, 사원이름은 FIRST_NAME과 LAST NAME의 결합으로 표시
       입사일은 XXXX년  XX월  XX일 로 표시
       연봉은 (급여*12) + 커미션:: 연봉기준 의 합을 표시
       COALESCE((급여*12)+(급여*12*0.4), 급여*12, 0)
*/

SELECT  DEPARTMENT_ID AS 부서코드, EMPLOYEE_ID AS 사원번호 ,(FIRST_NAME||LAST_NAME) AS 사원이름,TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY'))||'년'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM'))||'월'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'DD'))||'일' AS 입사일,
SALARY AS 급여,COALESCE(SALARY*12+(SALARY*12*COMMISSION_PCT),SALARY*12,0) AS 연봉 FROM HR.EMPLOYEES ;

/* 2. 부서 코드가 50 미만이면서 'CLERK'업무를 수행중인 직원정보를 출력 
   출력형식_____
   ------------------------------------------------------------------------
     부서코드    사원번호     사원이름      입사일   년차    근무일수      연봉
   ------------------------------------------------------------------------
   단, 사원이름은 FIRST_NAME과 LAST NAME의 결합으로 표시
       입사일은 XXXX년  XX월  XX일 로 표시
       연봉은 (급여*12) + 커미션 의 합을 표시
*/
SELECT  DEPARTMENT_ID AS 부서코드, EMPLOYEE_ID AS 사원번호 ,(FIRST_NAME||LAST_NAME) AS 사원이름,
(FIRST_NAME||LAST_NAME) AS 사원이름,TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY'))||'년'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM'))||'월'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'DD'))||'일' AS 입사일,
TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) AS 년차
,  TRUNC( SYSDATE - TO_DATE(TO_CHAR(HIRE_DATE, 'YYYYMMDD')))   AS 근무일수
,SALARY AS 급여,COALESCE(SALARY*12+(SALARY*12*COMMISSION_PCT),SALARY*12,0) AS 연봉 FROM HR.EMPLOYEES ;

/* 3. 연봉이 150000달러 이상인 직원정보를 출력 
   출력형식_____
   ------------------------------------------------------------------------
     사원번호    사원이름   부서코드    업무  입사일   년차    근무일수      연봉   
   ------------------------------------------------------------------------
   단, 사원이름은 FIRST_NAME과 LAST NAME의 결합으로 표시
       입사일은 XXXX년  XX월  XX일 로 표시
       연봉은 (급여*12) + 커미션 의 합을 표시
*/

SELECT  DEPARTMENT_ID AS 부서코드, EMPLOYEE_ID AS 사원번호 ,(FIRST_NAME||LAST_NAME) AS 사원이름,
(FIRST_NAME||LAST_NAME) AS 사원이름,
TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY'))||'년'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM'))||'월'||TO_NUMBER(TO_CHAR(HIRE_DATE, 'DD'))||'일' AS 입사일,
TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) AS 년차
,  TRUNC( SYSDATE - TO_DATE(TO_CHAR(HIRE_DATE, 'YYYYMMDD')))   AS 근무일수
,SALARY AS 급여,COALESCE(SALARY*12+(SALARY*12*COMMISSION_PCT),SALARY*12,0) AS 연봉 
FROM HR.EMPLOYEES 
WHERE COALESCE(SALARY*12+(SALARY*12*COMMISSION_PCT),SALARY*12,0)>=150000;

--JOIN-------------------------------------------------------------
--0인이유는 숫자가 없으면 0으로 표시햐고 9는 숫자가 없으면 표시하시마라
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
/*부서명이 Administration, Marketing, Purchasing, Human Resources인
  부서의 직원정보를 출력(단 부서명 순으로 출력)
  출력형식
  ------------------------------------------------------------------------
     부서코드  부서명   사원번호     사원이름    입사일   년차   근무일수    연봉    최대연봉
      E = D     D        E          E          E     F:E    F:E       F:E      F:J
   ------------------------------------------------------------------------
*/
SELECT*FROM HR.employees;
SELECT*FROM HR.departments;

SELECT E.DEPARTMENT_ID AS 부서코드,
       D.DEPARTMENT_NAME AS 부서명,
       E.EMPLOYEE_ID AS 사원번호,
       E.FIRST_NAME||' '||E.LAST_NAME AS 사원이름,
       TO_NUMBER(TO_CHAR(E.HIRE_DATE, 'YYYY'))||'년'||TO_NUMBER(TO_CHAR(E.HIRE_DATE, 'MM'))||'월'||TO_NUMBER(TO_CHAR(E.HIRE_DATE, 'DD'))||'일' AS 입사일,
       TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - TO_NUMBER(TO_CHAR(E.HIRE_DATE, 'YYYY'))+1 AS 년차,
       FLOOR(SYSDATE-E.HIRE_DATE) AS 근무일수,
       COALESCE(E.SALARY*12+(E.SALARY*12*(E.COMMISSION_PCT*100))/100,E.SALARY*12) AS 연봉,
       J.MAX_SALARY * 12 AS MAXYEARPAY
FROM HR.EMPLOYEES E INNER JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                    INNER JOIN HR.JOBS J ON E.JOB_ID=J.JOB_ID
WHERE D.DEPARTMENT_NAME='Administration' OR D.DEPARTMENT_NAME='Marketing' OR D.DEPARTMENT_NAME='Purchasing' OR D.DEPARTMENT_NAME='Human Resources';


/**/
SELECT * FROM DBA_TABLES WHERE OWNER = 'HR';
SELECT * FROM HR.REGIONS;

/* 직원정보 추출 
--------------------------------------------------------
  사원번호   사원명         업무명     부서명      부서정보          
                                         (지역명-나라명-도시명)
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
--실행안됌 SELECT  * FROM EMPINFO WHERE UPPER(DINFO) LIKE 'AMERICA%';
--WHERE UPPER(R.REGION_NAME || ' ' || C.COUNTRY_NAME || ' ' || L.CITY) LIKE 'AMERICA%'이렇게 해야 실행됨;
--view 할때는 where쓰지마라.


--kimberly department_id 없다



/* 아메리카에 근무하는 직원들의 정보를 출력
--------------------------------------------------------
  사원번호   사원명         업무명     부서명      부서정보 
--------------------------------------------------------
*/ 
--VIEW를 만들로 WHERE절 적용
SELECT  * FROM EMPINFO WHERE UPPER(DINFO) LIKE 'AMERICA%';
/* 업무명이 Administration Assistant인 직원들의 정보를 출력
--------------------------------------------------------
  사원번호   사원명         업무명     부서명      부서정보 
--------------------------------------------------------
*/
SELECT  * FROM EMPINFO WHERE JNAME = 'Administration Assistant';


--문제풀이---------------------------------------------------------------

SELECT*FROM HR.EMPLOYEES;
 CREATE OR REPLACE VIEW EMPINFO4
AS
SELECT  E.EMPLOYEE_ID AS 사원번호,
        E.FIRST_NAME || ' ' || E.LAST_NAME AS 사원명,
        TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - TO_NUMBER(TO_CHAR(E.HIRE_DATE, 'YYYY'))+1 AS 년차,
        J.JOB_TITLE AS 업무명,
        L.CITY  AS 도시명,
        D.DEPARTMENT_NAME AS 부서명,
        E.SALARY AS 급여,
        COALESCE(E.COMMISSION_PCT,0) AS 커미션,
        COALESCE(E.SALARY*12+(E.SALARY*12*(E.COMMISSION_PCT*100))/100,E.SALARY*12) AS 연봉,
        C.COUNTRY_NAME  AS 나라,
        R.REGION_NAME   AS 지역
FROM HR.EMPLOYEES E INNER JOIN HR.JOBS J ON E.JOB_ID = J.JOB_ID
                    INNER JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                    INNER JOIN HR.LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
                    INNER JOIN HR.COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
                    INNER JOIN HR.REGIONS R ON C.REGION_ID = R.REGION_ID;


 /* 1. 연봉이 15만달러 이상인 직원들 중 AMERICA 지역에 근무하는 직원의 정보를 출력 
    ---------------------------------------------------------------------
      사원번호   사원명      업무명     부서명      도시명  급여   커미션   연봉
    ---------------------------------------------------------------------
    단 커미션이 없는 경우 0으로 대체
  */
  SELECT*FROM EMPINFO2;
  SELECT  "사원번호","사원명","업무명","부서명","도시명","급여","커미션","연봉"
  FROM EMPINFO4 WHERE 연봉 >=150000 AND 지역 LIKE '%America%';
------------------------------------------------------------------------------------  
  
  /* 2. 15년차 이상 근무하고 있는 직원 들 중 연봉이 10만달러 이상인 직원이 정보를 출력 
    ---------------------------------------------------------------------
      사원번호   사원명   년차   업무명     부서명      급여   커미션    연봉
    ---------------------------------------------------------------------
    단 커미션이 없는 경우 0으로 대체
  */
  SELECT "사원번호","사원명","년차","업무명","부서명","급여","커미션","연봉" FROM EMPINFO4 WHERE 연봉 >='100000' AND 년차 >= '15';
  
--------------------------------------------------------------------------------
 
  /* 3. Australia, Belgium, Brazil, Canada에서 근무하는 직원 들 중 10년차 이상 이면서 연봉이 10만이상인
       직원의 직원정보 출력 
---------------------------------------------------------------------
 사원번호   사원명   년차   업무명     부서명      급여   커미션    연봉 
---------------------------------------------------------------------
    단 커미션이 없는 경우 0으로 대체
 *//*연봉 >='100000' AND 년차 >= '10' AND'%Australia%' OR  '%Belgium%'  OR '%Brazil%'  OR*/
 SELECT *
 FROM EMPINFO4;
 SELECT "사원번호","사원명","년차","업무명","부서명","급여","커미션","연봉"
 FROM EMPINFO4 
 WHERE  (나라 LIKE  '%Canada%' OR 나라 LIKE  '%Belgium%' OR 나라 LIKE  '%Australia%'OR 나라 LIKE  '%Brazil%') AND 연봉 >='100000' AND 년차 >= '10';
 SELECT*FROM PR;
 
 /* 특정일(WHERE) 전체상품판매 정보 확인
   ------------------------------------------------------------
       매장명     상품명      수량       가격        합계
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
         
--VIEW를 활용
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
/* 1. 고객별 상품 판매 정보를 출력 
    -------------------------------------------------------------------------
     고객코드     고객명         총판매액    
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
/* 2. 특정 고객의 상품 판매 정보를 출력 
    -------------------------------------------------------------------------
     판매일    상품명    판매수량     판매액 
    -------------------------------------------------------------------------
*/
SELECT SUBSTR(SS2.ODCODE, 1, 8)  AS SALEDAY,
       SS2.PRNAME AS PRNAME,
       SS2.QUANTITY AS SALEQUANTITY,
       SS2.TOTAMOUNT AS TOTAMOUNT
FROM SALESINFO2 SS2 RIGHT OUTER JOIN CU ON SS2.CUCODE = CU.CU_CODE
WHERE SS2.CUCODE = '20001';


/* 3. 특정일 ~ 특정일 기간동안의 전체 상품 판매 정보를 출력 
    -------------------------------------------------------------------------
       상품명    판매수량     판매액   수익액
    -------------------------------------------------------------------------
*/
SELECT SS2.PRNAME AS PRNAME,
        COALESCE(SUM(SS2.QUANTITY),0) AS SALEQUANTITY,
       COALESCE(SUM(SS2.TOTAMOUNT),0) AS TOTAMOUNT,
       COALESCE(SUM(SS2.MARGIN),0) AS MARGIN
       FROM SALESINFO2 SS2 RIGHT OUTER JOIN OD ON SS2.ODCODE = OD.OD_CODE
WHERE SUBSTR(SS2.ODCODE, 1, 8) >20211111 AND  SUBSTR(SS2.ODCODE, 1, 8)<20211115
GROUP BY SS2.PRNAME;


/* 4. 특정기간 동안 매출정보를 요일별로 출력 
    -------------------------------------------------------------------------
       요일     판매액       수익액
    -------------------------------------------------------------------------
*/

SELECT TO_CHAR( TO_DATE(SUBSTR(SS2.ODCODE, 1, 8), 'YYYYMMDD'), 'day' ) AS DAYofWEEK,
       COALESCE(SUM(SS2.TOTAMOUNT),0) AS TOTAMOUNT,
       COALESCE(SUM(SS2.MARGIN),0) AS MARGIN
       FROM SALESINFO2 SS2 
WHERE SUBSTR(SS2.ODCODE, 1, 8) >20211101 AND  SUBSTR(SS2.ODCODE, 1, 8)<20211115
GROUP BY TO_CHAR( TO_DATE(SUBSTR(SS2.ODCODE, 1, 8), 'YYYYMMDD'), 'day' );


/* 5. 카테고리 별 전체 상품에 판매정보 출력
    -------------------------------------------------------------------------
       카테고리명      판매액       수익액
    -------------------------------------------------------------------------
*/

SELECT CA.CAT_NAME AS CATEGORIES,
       COALESCE(SUM(SS2.TOTAMOUNT),0) AS TOTAMOUNT,
       COALESCE(SUM(SS2.MARGIN),0) AS MARGIN
       FROM SALESINFO2 SS2 RIGHT OUTER JOIN CA ON SS2.CATCODE = CA.CAT_CODE
GROUP BY CA.CAT_NAME;
     