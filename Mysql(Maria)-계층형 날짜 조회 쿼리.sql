/** 기본 날짜 함수 **/
/** 더하기: DATE_ADD(날짜, INTERVAL)**/
/** 빼기: DATE_SUB(날짜, INTERVAL)**/
/**
초: SECOND
분: MINUTE
시: HOUR
일: DAY
월: MONTH
년: YEAR
**/
/** 해당 달 첫 달과 끝 달 **/
WITH RECURSIVE T AS (
    SELECT LAST_DAY(NOW() - INTERVAL 1 MONTH) + INTERVAL 1 DAY AS STARTDATE
    UNION ALL
    SELECT STARTDATE + INTERVAL 1 DAY FROM T WHERE STARTDATE < LAST_DAY(NOW())
)
SELECT * FROM T;

/** 시작일 부터 종료일까지 **/
WITH RECURSIVE TEST_DATE AS(
	SELECT DATE_ADD(DATE_SUB(STR_TO_DATE('2022-09-14', '%Y-%m-%d'), INTERVAL 1 DAY), INTERVAL 1 day) AS START_DATE
	UNION ALL
	SELECT START_DATE + INTERVAL 1 DAY FROM TEST_DATE WHERE START_DATE < '2022-09-29'
)
SELECT * FROM TEST_DATE;