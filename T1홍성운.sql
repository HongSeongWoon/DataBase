

/* -- 13. 매출 통계 (20211111 ~ 20211116) 특정 매장에 특정 기간 동안 판매 정보 출력
 CLIENT DATA --> 매장, 시작날짜~끝날짜
----------------------------------------------------------------------
 매장                  기간                총매출        판매수익    
 ODD_SECODE   '20211111 ~ 20211116'      F:ODD,PR     F:ODD,PR
----------------------------------------------------------------------
*/
 SELECT ODD.ODD_SECODE AS "매장",
       '20211111'||'~'||'20211116' AS "기간", 
        TO_CHAR(SUM(((PR.PR_PRICE - ((PR.PR_PRICE * PR.PR_DISCOUNT)/100)) * ODD.ODD_QUANTITY)), '999,999,990') AS "총매출",
        TO_CHAR(SUM((((PR.PR_PRICE - ((PR.PR_PRICE * PR.PR_DISCOUNT)/100)) - PR.PR_COST) * ODD.ODD_QUANTITY)), '999,999,990') AS "판매수익"
 FROM ODD INNER JOIN PR ON ODD.ODD_PRCODE = PR.PR_CODE
 WHERE ODD_SECODE = '10001' AND (SUBSTR(ODD_ODCODE, 1, 8) >= '20211111' AND SUBSTR(ODD_ODCODE, 1, 8) <= '20211116')
 GROUP BY ODD.ODD_SECODE;
 SELECT * FROM ODD;
 
/*-- 15. 회원 검색 (특정 고객 '10019' 검색)
CLIENT DATA --> 고객코드
----------------------------------------------------------------------
 고객코드    고객명    전화번호    회원등급     보유포인트
 CU_CODE   CU_NAME  CU_PHONE  F:CU,RA    F:CU,PI
----------------------------------------------------------------------
*/
 SELECT CU.CU_CODE AS "고객코드", CU.CU_NAME AS "고객명", CU.CU_PHONE AS "전화번호",
        RA.RA_RANKS AS "회원등급", COALESCE(SUM(PI.PI_POINTS * PI.PI_STATES), 0) AS "보유포인트"
 FROM CU INNER JOIN RA ON CU.CU_RACODE = RA.RA_CODE
         INNER JOIN PI ON CU.CU_CODE = PI.PI_CUCODE
 WHERE CU_CODE = '10019'
 GROUP BY CU.CU_CODE, CU.CU_NAME, CU.CU_PHONE, RA.RA_RANKS;
SELECT * FROM CU;

/*-- 16. 매장 검색 ( 특정 매장 검색)
CLIENT DATA --> 매장코드
----------------------------------------------------------------------
 매장코드    매장명    오픈시간    클로즈시간    직원수    포스수
 SE_CODE   SE_NAME  SE_OPEN   SE_CLOSE    "EM",SE    PS,SE
----------------------------------------------------------------------
*/
 SELECT SE.SE_CODE AS "매장코드", SE.SE_NAME AS "매장명", SE.SE_OPEN AS "오픈시간",
        SE.SE_CLOSE AS "클로즈시간", (SELECT COUNT (*) FROM "EM" WHERE EM_SECODE = '10001')AS "직원수",
        (SELECT COUNT (*) FROM PS WHERE POS_SECODE = '10001')AS "포스수"
 FROM SE INNER JOIN "EM" ON SE.SE_CODE = "EM".EM_SECODE
         INNER JOIN PS ON SE.SE_CODE = PS.POS_SECODE
 WHERE SE_CODE = '10001'
 GROUP BY SE.SE_CODE, SE.SE_NAME, SE.SE_OPEN, SE.SE_CLOSE;

SELECT * FROM EM;

/*-- 17. 직원 검색 (특정 직원 '10001' 검색)
CLIENT DATA --> 직원코드
----------------------------------------
 직원코드    직원명      매장명 
 EM_CODE   EM_NAME    SE_NAME  
-----------------------------------------
*/
 SELECT "EM".EM_CODE AS "직원코드", "EM".EM_NAME AS "직원명", SE.SE_NAME AS "매장명"
 FROM "EM" INNER JOIN SE ON "EM".EM_SECODE = SE.SE_CODE
 WHERE EM_CODE = '10001';
 
/*-- 18. 주문 검색 ( 특정 고객 주문 검색 )
CLIENT DATA --> 고객코드
-------------------------------------------------------------------
 회원코드    회원명    주문코드    주문상품명     상품갯수         총금액
 CU_CODE   CU_NAME   OD_CODE   PR_NAME   ODD_QUANTITY   F:PR * ODD
-------------------------------------------------------------------
*/
 SELECT CU.CU_CODE AS "회원코드", CU.CU_NAME AS "회원명", OD.OD_CODE AS "주문코드",
        PR.PR_NAME AS "주문상품명", SUM(ODD.ODD_QUANTITY) AS "상품갯수",
        TO_CHAR(SUM(((PR.PR_PRICE - ((PR.PR_PRICE * PR.PR_DISCOUNT)/100)) * ODD.ODD_QUANTITY)), '999,999,990') AS "총금액"
 FROM ODD INNER JOIN OD ON ODD.ODD_ODCODE = OD.OD_CODE AND
                           ODD.ODD_SECODE = OD.OD_SECODE AND
                           ODD.ODD_PSCODE = OD.OD_PSCODE
          INNER JOIN CU ON OD.OD_CUCODE = CU.CU_CODE
          INNER JOIN PR ON ODD.ODD_PRCODE = PR.PR_CODE 
 WHERE OD_CUCODE = '20001'
 GROUP BY CU.CU_CODE, CU.CU_NAME, OD.OD_CODE, PR.PR_NAME;
 
SELECT * FROM OD;

/*-- 19. 포인트 통계 
CLIENT DATA -->  고객코드
-------------------------------------------------------------------
  고객명     포인트적립액   포인트사용액   포인트잔액
  CU_NAME   PI_POINTS    PI_POINTS   PI_POINTS - PI_POINTS
-------------------------------------------------------------------
*/
 SELECT CU.CU_NAME AS "고객명", COALESCE(SUM(CIP.INPOINTS), 0) AS "포인트적립액", COALESCE(SUM(COP.OUTPOINTS), 0) AS "포인트사용액",
        (COALESCE(SUM(CIP.INPOINTS), 0) - COALESCE(SUM(COP.OUTPOINTS), 0)) AS "포인트잔액"
 FROM PI INNER JOIN CUSTOMERINPOINTS CIP ON PI.PI_CUCODE = CIP.CUCODE AND SUBSTR(PI.PI_ODCODE,1, 8) = CIP.PDAY
         FULL OUTER JOIN CUSTOMEROUTPOINTS COP ON PI.PI_CUCODE = COP.CUCODE AND SUBSTR(PI.PI_ODCODE,1, 8) = COP.PDAY
         INNER JOIN CU ON PI.PI_CUCODE = CU.CU_CODE
 WHERE CU.CU_CODE = '20001'
 GROUP BY CU.CU_NAME;
 
 

--고객별 일자별 포인트 적립액
CREATE OR REPLACE VIEW CUSTOMERINPOINTS
AS
SELECT   PI_CUCODE AS CUCODE,
         SUBSTR(PI_ODCODE, 1, 8) AS PDAY,
         SUM(PI_POINTS) AS INPOINTS
FROM     PI
WHERE    PI_STATES = 1
GROUP BY PI_CUCODE, SUBSTR(PI_ODCODE, 1, 8);

-- 고객별 일자별 포인트 사용액
CREATE OR REPLACE VIEW CUSTOMEROUTPOINTS
AS
SELECT   PI_CUCODE AS CUCODE,
         SUBSTR(PI_ODCODE, 1, 8) AS PDAY,
         SUM(PI_POINTS) AS OUTPOINTS
FROM     PI
WHERE    PI_STATES = -1
GROUP BY PI_CUCODE, SUBSTR(PI_ODCODE, 1, 8);




