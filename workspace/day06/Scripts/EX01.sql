/*
 * EMPLOYEES 테이블에서 JOB_ID별 평균 SALARY가 10000미만인 JOB_ID 조회
 * JOB_ID를 알파벳 순으로 정렬 
 */

SELECT  JOB_ID ,AVG(SALARY) 
FROM EMPLOYEES e
GROUP BY JOB_ID 
HAVING AVG(SALARY) < 10000
ORDER BY JOB_ID ;

-- [실습]
-- PLAYER 테이블

-- PLAYER_ID가 2007로 시작하는 선수들 중 POSITION 별 평균 키를 조회
SELECT "POSITION" , AVG(HEIGHT) 
FROM PLAYER p 
WHERE PLAYER_ID LIKE '2007%'
GROUP BY "POSITION" ;

-- 선수들 중 포지션이 DF인 선수들의 평균 키를 TEAM_ID 별로 조회하고 평균 키 오름차순으로 정렬
SELECT TEAM_ID , AVG(HEIGHT) 
FROM PLAYER p
WHERE "POSITION" = 'DF'
GROUP BY TEAM_ID
ORDER BY AVG(HEIGHT) ;

-- 포지션이 MF인 선수들의 입단 별 평균 몸무게, 평균 키를 구한다.
-- 칼럼명은 입단연도, 평균 몸무게, 평균 키로 표시한다.
-- 입단연도 오름차순으로 정렬한다.
SELECT 
	JOIN_YYYY 입단연도, 
	AVG(WEIGHT) "평균 몸무게", 
	AVG(HEIGHT)  "평균 키"
FROM PLAYER p 
WHERE JOIN_YYYY IS NOT NULL 
GROUP BY JOIN_YYYY 
ORDER BY JOIN_YYYY ;

-- EMPLOYEES 테이블
/*
 * 핸드폰 번호가 515로 시작하는 사원들의
 * JOB_ID별 SALARY 평균을 구한다.
 * 조회 칼럼은 담당 업무, 평균 급여로 표시한다.
 * 평균 급여가 높은 순으로 정렬한다.
 */
SELECT JOB_ID "담당 업무", 
	AVG(SALARY) "평균 급여" 
FROM EMPLOYEES e 
WHERE PHONE_NUMBER LIKE '515%'
GROUP BY JOB_ID 
ORDER BY AVG(SALARY) DESC ; 

/*
 * COMMISSION_PCT별 평균 급여를 조회한다.
 * COMMISSION_PCT 를 오름차순으로 정렬하며
 * NULL은 제외한다.
 */
SELECT COMMISSION_PCT , ROUND(AVG(SALARY),2) 
FROM EMPLOYEES e 
WHERE COMMISSION_PCT IS NOT NULL 
GROUP BY COMMISSION_PCT 
ORDER BY COMMISSION_PCT ;

















