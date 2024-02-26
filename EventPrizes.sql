-- 상품ID/상품명/당첨확률/남은수량/초기수량
CREATE SEQUENCE event_prize_id_seq NOCACHE NOCYCLE;

CREATE TABLE EventPrizes(
    prize_id NUMBER(3)
        CONSTRAINT prize_id_pk PRIMARY KEY,
    prize_name VARCHAR2(20),
    prize_rate NUMBER(3, 3),
    remain_qty NUMBER(5),
    init_qty NUMBER(3)
);

ALTER TABLE eventprizes RENAME CONSTRAINT prize_id_pk TO envent_prize_id_pk;
SELECT * FROM eventprizes;

UPDATE eventprizes SET remain_qty = 10;
COMMIT;

SELECT SUM(remian_qty) FROM eventprizes;

DESC eventprizes;

ALTER TABLE eventprizes MODIFY(
    remain_qty NUMBER(3)
        CONSTRAINT event_remain_qty_pos CHECK (remain_qty >=0)
        );
