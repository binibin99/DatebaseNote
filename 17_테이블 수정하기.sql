-- 17_테이블 수정하기.sql
/*
    # 테이블 새 컬럼 추가하기
    
    - ALTER TABLE 테이블명 ADD (컬럼명 컬럼타입 제약조건,....);
    - 새 컬럼이 추가되면 기존에 존재하던 행들은 해당 컬럼값이 null이 된다
    - 새 컬럼 NOT NULL 컬럼을 추가할 때는 기본값을 반드시 설정해야 한다
*/

ALTER TABLE coffee ADD ( 
    coffee_taste VARCHAR2(20) DEFAULT 'Bitter'
        CONSTRAINT coffee_taste_nn NOT NULL,
    coffee_satis NUMBER(2, 1)
);

-- countries를 countries2로 복사할 때 기본키 제약조건은 함꼐 복사되지 않는다
CREATE TABLE countries2 AS (SELECT * FROM countries);

-- countries2.country_id를 외래킬로 가져다 쓰기 위해서 기본키 제약 조건을 추가
ALTER TABLE countries2 MODIFY(
    country_id CHAR(2)
        CONSTRAINT countries2_c_id_pk PRIMARY KEY
);

ALTER TABLE coffee ADD ( 
 country_id CHAR(2)
    CONSTRAINT coffee_c_id_fk REFERENCES countries2(country_id)
);

-- 테이블 컬럼 삭제하기 : ALTER TABLE 테이블명 DROP TABLE 컬럼명
ALTER TABLE coffee DROP COLUMN coffee_taste;
ALTER TABLE coffee DROP COLUMN coffee_satis;

SELECT * FROM coffee;
UPDATE coffee SET country_id = 'AR';

-- 테이블 컬럼 이름 변경하기 : ALTER TABLE 테이블명 RENAME COLUMN 원래이름 TO 바꿀이름
ALTER TABLE coffe RENAME COLUMN coffee_satis TO coffee_satisfaction;

-- 테이블 제약조건 이름 변경하기 : ALTER TABLE 테이블명 RENAME CONSTRAINT 원래이름 TO 바꿀이름;
SELECT * FROM user_constraints WHERE table_name = 'COFFE';
ALTER TABLE coffe RENAME CONSTRAINT coffee_price_positive TO coffee_price_pos;

-- 테이블 이름 변경 하기 : RENAME 테이블명 TO 바꿀이름;
RENAME countries2 TO countries3;
-- 제약조건명은 동기화 해주지 않으므로 직접 수정해야한다
ALTER TABLE countries3 RENAME CONSTRAINT 
countries2_c_id_pk To countries3_c_id_pk;

