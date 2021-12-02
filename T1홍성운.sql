

/* -- 13. ���� ��� (20211111 ~ 20211116) Ư�� ���忡 Ư�� �Ⱓ ���� �Ǹ� ���� ���
 CLIENT DATA --> ����, ���۳�¥~����¥
----------------------------------------------------------------------
 ����                  �Ⱓ                �Ѹ���        �Ǹż���    
 ODD_SECODE   '20211111 ~ 20211116'      F:ODD,PR     F:ODD,PR
----------------------------------------------------------------------
*/
 SELECT ODD.ODD_SECODE AS "����",
       '20211111'||'~'||'20211116' AS "�Ⱓ", 
        TO_CHAR(SUM(((PR.PR_PRICE - ((PR.PR_PRICE * PR.PR_DISCOUNT)/100)) * ODD.ODD_QUANTITY)), '999,999,990') AS "�Ѹ���",
        TO_CHAR(SUM((((PR.PR_PRICE - ((PR.PR_PRICE * PR.PR_DISCOUNT)/100)) - PR.PR_COST) * ODD.ODD_QUANTITY)), '999,999,990') AS "�Ǹż���"
 FROM ODD INNER JOIN PR ON ODD.ODD_PRCODE = PR.PR_CODE
 WHERE ODD_SECODE = '10001' AND (SUBSTR(ODD_ODCODE, 1, 8) >= '20211111' AND SUBSTR(ODD_ODCODE, 1, 8) <= '20211116')
 GROUP BY ODD.ODD_SECODE;
 SELECT * FROM ODD;
 
/*-- 15. ȸ�� �˻� (Ư�� �� '10019' �˻�)
CLIENT DATA --> ���ڵ�
----------------------------------------------------------------------
 ���ڵ�    ����    ��ȭ��ȣ    ȸ�����     ��������Ʈ
 CU_CODE   CU_NAME  CU_PHONE  F:CU,RA    F:CU,PI
----------------------------------------------------------------------
*/
 SELECT CU.CU_CODE AS "���ڵ�", CU.CU_NAME AS "����", CU.CU_PHONE AS "��ȭ��ȣ",
        RA.RA_RANKS AS "ȸ�����", COALESCE(SUM(PI.PI_POINTS * PI.PI_STATES), 0) AS "��������Ʈ"
 FROM CU INNER JOIN RA ON CU.CU_RACODE = RA.RA_CODE
         INNER JOIN PI ON CU.CU_CODE = PI.PI_CUCODE
 WHERE CU_CODE = '10019'
 GROUP BY CU.CU_CODE, CU.CU_NAME, CU.CU_PHONE, RA.RA_RANKS;
SELECT * FROM CU;

/*-- 16. ���� �˻� ( Ư�� ���� �˻�)
CLIENT DATA --> �����ڵ�
----------------------------------------------------------------------
 �����ڵ�    �����    ���½ð�    Ŭ����ð�    ������    ������
 SE_CODE   SE_NAME  SE_OPEN   SE_CLOSE    "EM",SE    PS,SE
----------------------------------------------------------------------
*/
 SELECT SE.SE_CODE AS "�����ڵ�", SE.SE_NAME AS "�����", SE.SE_OPEN AS "���½ð�",
        SE.SE_CLOSE AS "Ŭ����ð�", (SELECT COUNT (*) FROM "EM" WHERE EM_SECODE = '10001')AS "������",
        (SELECT COUNT (*) FROM PS WHERE POS_SECODE = '10001')AS "������"
 FROM SE INNER JOIN "EM" ON SE.SE_CODE = "EM".EM_SECODE
         INNER JOIN PS ON SE.SE_CODE = PS.POS_SECODE
 WHERE SE_CODE = '10001'
 GROUP BY SE.SE_CODE, SE.SE_NAME, SE.SE_OPEN, SE.SE_CLOSE;

SELECT * FROM EM;

/*-- 17. ���� �˻� (Ư�� ���� '10001' �˻�)
CLIENT DATA --> �����ڵ�
----------------------------------------
 �����ڵ�    ������      ����� 
 EM_CODE   EM_NAME    SE_NAME  
-----------------------------------------
*/
 SELECT "EM".EM_CODE AS "�����ڵ�", "EM".EM_NAME AS "������", SE.SE_NAME AS "�����"
 FROM "EM" INNER JOIN SE ON "EM".EM_SECODE = SE.SE_CODE
 WHERE EM_CODE = '10001';
 
/*-- 18. �ֹ� �˻� ( Ư�� �� �ֹ� �˻� )
CLIENT DATA --> ���ڵ�
-------------------------------------------------------------------
 ȸ���ڵ�    ȸ����    �ֹ��ڵ�    �ֹ���ǰ��     ��ǰ����         �ѱݾ�
 CU_CODE   CU_NAME   OD_CODE   PR_NAME   ODD_QUANTITY   F:PR * ODD
-------------------------------------------------------------------
*/
 SELECT CU.CU_CODE AS "ȸ���ڵ�", CU.CU_NAME AS "ȸ����", OD.OD_CODE AS "�ֹ��ڵ�",
        PR.PR_NAME AS "�ֹ���ǰ��", SUM(ODD.ODD_QUANTITY) AS "��ǰ����",
        TO_CHAR(SUM(((PR.PR_PRICE - ((PR.PR_PRICE * PR.PR_DISCOUNT)/100)) * ODD.ODD_QUANTITY)), '999,999,990') AS "�ѱݾ�"
 FROM ODD INNER JOIN OD ON ODD.ODD_ODCODE = OD.OD_CODE AND
                           ODD.ODD_SECODE = OD.OD_SECODE AND
                           ODD.ODD_PSCODE = OD.OD_PSCODE
          INNER JOIN CU ON OD.OD_CUCODE = CU.CU_CODE
          INNER JOIN PR ON ODD.ODD_PRCODE = PR.PR_CODE 
 WHERE OD_CUCODE = '20001'
 GROUP BY CU.CU_CODE, CU.CU_NAME, OD.OD_CODE, PR.PR_NAME;
 
SELECT * FROM OD;

/*-- 19. ����Ʈ ��� 
CLIENT DATA -->  ���ڵ�
-------------------------------------------------------------------
  ����     ����Ʈ������   ����Ʈ����   ����Ʈ�ܾ�
  CU_NAME   PI_POINTS    PI_POINTS   PI_POINTS - PI_POINTS
-------------------------------------------------------------------
*/
 SELECT CU.CU_NAME AS "����", COALESCE(SUM(CIP.INPOINTS), 0) AS "����Ʈ������", COALESCE(SUM(COP.OUTPOINTS), 0) AS "����Ʈ����",
        (COALESCE(SUM(CIP.INPOINTS), 0) - COALESCE(SUM(COP.OUTPOINTS), 0)) AS "����Ʈ�ܾ�"
 FROM PI INNER JOIN CUSTOMERINPOINTS CIP ON PI.PI_CUCODE = CIP.CUCODE AND SUBSTR(PI.PI_ODCODE,1, 8) = CIP.PDAY
         FULL OUTER JOIN CUSTOMEROUTPOINTS COP ON PI.PI_CUCODE = COP.CUCODE AND SUBSTR(PI.PI_ODCODE,1, 8) = COP.PDAY
         INNER JOIN CU ON PI.PI_CUCODE = CU.CU_CODE
 WHERE CU.CU_CODE = '20001'
 GROUP BY CU.CU_NAME;
 
 

--���� ���ں� ����Ʈ ������
CREATE OR REPLACE VIEW CUSTOMERINPOINTS
AS
SELECT   PI_CUCODE AS CUCODE,
         SUBSTR(PI_ODCODE, 1, 8) AS PDAY,
         SUM(PI_POINTS) AS INPOINTS
FROM     PI
WHERE    PI_STATES = 1
GROUP BY PI_CUCODE, SUBSTR(PI_ODCODE, 1, 8);

-- ���� ���ں� ����Ʈ ����
CREATE OR REPLACE VIEW CUSTOMEROUTPOINTS
AS
SELECT   PI_CUCODE AS CUCODE,
         SUBSTR(PI_ODCODE, 1, 8) AS PDAY,
         SUM(PI_POINTS) AS OUTPOINTS
FROM     PI
WHERE    PI_STATES = -1
GROUP BY PI_CUCODE, SUBSTR(PI_ODCODE, 1, 8);




