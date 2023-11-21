-- Active: 1694996562687@@127.0.0.1@3306@columbus
-- 자유거래 게시물 작성
INSERT INTO travel_trade (title, writer_id, item_type, item_quantity, content, view_count, write_datetime)
VALUES ('훔친 담요 팝니다.', 'Meow', '담요', 1, '담요 훔쳤는데 싸게 넘길게요', 0, '2023-11-20 11:00:00');

-- 자유거래 상품 이미지 삽입
INSERT INTO travel_trade_image (item_image, travel_trade_number)
VALUES ('url', 2);

-- 자유거래 가격 삽입
INSERT INTO travel_trade_money (money_type, money, travel_trade_number)
VALUES ('KRW', 2000, 2);

-- 자유거래 거래장소리스트 삽입
INSERT INTO travel_trade_location (location, travel_trade_number)
VALUES ('어디여', 2);

-- 자유거래 해시태그 삽입
INSERT INTO travel_trade_hashtag (hashtag, travel_trade_number)
VALUES ('훔친사람이임자', 2);

-- 자유거래 북마크
INSERT INTO travel_trade_bookmark VALUES ('Meow', 2);

-- 자유거래 북마크 취소
DELETE FROM travel_trade_bookmark WHERE user_id = 'Meow' AND travel_trade_number = 2;

-- 자유거래 게시물 수정
UPDATE travel_trade SET title = '아 담요가 아니라 돗자리네', content = '돗자리 팔아요' WHERE travel_trade_number = 2;
DELETE FROM travel_trade_image WHERE travel_trade_number = 2;
INSERT INTO travel_trade_image (item_image, travel_trade_number) VALUES ('url2', 2);

-- 자유거래 가격 수정
UPDATE travel_trade_money SET money_type = 'EUR', money = 1.4 WHERE travel_trade_number = 2;

-- 자유거래 거래 장소 수정
UPDATE travel_trade_location SET location = '나여기야' WHERE location_number = 1 AND travel_trade_number = 2;

-- 자유거래 해시태그 수정
UPDATE travel_trade_hashtag SET hashtag = '내가임자' WHERE hashtag_number = 3 AND travel_trade_number = 2;

-- 자유거래 게시물 삭제
DELETE FROM travel_trade_bookmark WHERE travel_trade_number = 2;
DELETE FROM travel_trade_hashtag WHERE travel_trade_number = 2;
DELETE FROM travel_trade_image WHERE travel_trade_number = 2;
DELETE FROM travel_trade_money WHERE travel_trade_number = 2;
DELETE FROM travel_trade_location WHERE travel_trade_number = 2;
DELETE FROM travel_trade WHERE travel_trade_number = 2;

-- <상세 자유 거래 게시물 불러오기> --
SELECT
  TB.travel_trade_number AS travel_trade_number,
  TB.writer_id AS writer_id,
  TB.title AS title,
  TB.content AS content,
  TB.item_type AS item_type,
  TB.item_quantity AS item_quantity,
  TB.write_datetime AS write_datetime,
  TB.view_count AS view_count,
  U.nickname AS writer_nickname,
  U.profile_image AS writer_profile_image
FROM travel_trade AS TB
INNER JOIN user AS U
ON TB.writer_id = U.user_id
WHERE travel_trade_number = 2;

SELECT money_type, money
FROM travel_trade_money
WHERE travel_trade_number = 2;

SELECT item_image
FROM travel_trade_image
WHERE travel_trade_number = 2;

SELECT hashtag
FROM travel_trade_hashtag
WHERE travel_trade_number = 2;

SELECT location
FROM travel_trade_location
WHERE travel_trade_number = 2;

-- 최신 자유 거래 게시물 리스트 불러오기
SELECT *
FROM travle_trade_board_list_view
ORDER BY write_datetime DESC
LIMIT 0, 9;

-- 검색한 자유 거래 게시물 리스트 불러오기
SELECT *
FROM travle_trade_board_list_view
WHERE title LIKE '%담요%' OR location LIKE '%피란체%' OR content LIKE '%돗자리%'
ORDER BY write_datetime DESC
LIMIT 0, 9;

-- 특정 유저 자유 거래 게시물 리스트 불러오기
SELECT *
FROM travle_trade_board_list_view
WHERE writer_id = 'Meow' OR writer_nickname = '고양아 멍멍해봐'
ORDER BY write_datetime DESC
LIMIT 0, 9;
