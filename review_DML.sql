-- Active: 1694996562687@@127.0.0.1@3306@columbus
-- 여행후기 게시물 작성
INSERT INTO travel_review (writer_id, title, content, favorite_count, comment_count, view_count, write_datetime)
VALUES ('Meow', '여행후기 제목이에용', '저는 유럽여행을 다녀왔어요~~', 0, 0, 0, '2023-11-20 10:00:00');

-- 여행후기 게시물 이미지 삽입
INSERT INTO travel_review_image (image, review_number)
VALUES ('url', 1);

-- 여행후기 장소 삽입
INSERT INTO travel_review_location (location, review_number)
VALUES ('유럽어딘가', 1);

-- 여행후기 댓글 작성
INSERT INTO travel_review_comment (review_number, writer_id, content, write_datetime)
VALUES (1, 'Meow', '우와 유럽여행 저도 가고싶어요', '2023-11-20 10:09:00');

-- 여행후기 댓글 수 + 1 코드
UPDATE travel_review SET comment_count = comment_count + 1 WHERE review_number = 1;

-- 여행후기 좋아요
INSERT INTO travel_review_favorite VALUES (1, 'Meow');

-- 여행후기 좋아요 수 + 1 코드
UPDATE travel_review SET favorite_count = favorite_count + 1 WHERE review_number = 1;

-- 여행후기 좋아요 취소
DELETE FROM travel_review_favorite WHERE user_id = 'Meow' AND review_number = 1;

-- 여행후기 좋아요 수 - 1 코드
UPDATE travel_review SET favorite_count = favorite_count - 1 WHERE review_number = 1;

-- 여행후기 게시물 수정
UPDATE travel_review SET title = '유럽여행 다녀왔어요', content = '너무 행복한 여행이었습니당' WHERE review_number = 1;
DELETE FROM travel_review_image WHERE review_number = 1;
INSERT INTO travel_review_image (image, review_number) VALUES ('url2', 1);

-- 여행후기 장소 수정
UPDATE travel_review_location SET location = '피란체' WHERE review_number = 1;

-- 여행후기 게시물 삭제
DELETE FROM travel_review_comment WHERE review_number = 1;
DELETE FROM travel_review_favorite WHERE review_number = 1;
DELETE FROM travel_review_location WHERE review_number = 1;
DELETE FROM travel_review_image WHERE review_number = 1;
DELETE FROM travel_review WHERE review_number = 1;

-- <상세 여행 후기 게시물 불러오기> --
SELECT
  RB.review_number AS review_number,
  RB.writer_id AS writer_id,
  RB.title AS title,
  RB.content AS content,
  RB.write_datetime AS write_datetime,
  U.nickname AS nickname,
  U.profile_image AS profile_image
FROM travel_review AS RB
INNER JOIN user AS U
ON RB.writer_id = U.user_id
WHERE review_number = 1;

SELECT image
FROM travel_review_image
WHERE review_number = 1;

SELECT location
FROM travel_review_location
WHERE review_number = 1;

SELECT
  U.nickname AS nickname,
  U.profile_image AS profile_image
FROM travel_review_favorite AS F
INNER JOIN user AS U
ON F.user_id = U.user_id
WHERE F.review_number = 1;

SELECT
  U.nickname AS nickname,
  U.profile_image AS profile_image,
  C.content AS content,
  C.write_datetime AS write_datetime
FROM travel_review_comment AS C
INNER JOIN user AS U
ON C.writer_id = U.user_id
WHERE C.review_number = 1
ORDER BY write_datetime DESC;

-- 최신 여행 후기 게시물 리스트 불러오기
SELECT *
FROM travle_review_board_list_view
ORDER BY write_datetime DESC
LIMIT 0, 5;

-- 검색한 여행 후기 게시물 리스트 불러오기
SELECT *
FROM travle_review_board_list_view
WHERE title LIKE '%유럽%' OR content LIKE '%유럽%' OR location LIKE '%피란체%'
ORDER BY write_datetime DESC
LIMIT 0, 5;

-- 특정 유저 여행 후기 게시물 리스트 불러오기
SELECT *
FROM travle_review_board_list_view
WHERE writer_id = 'Meow' OR writer_nickname = '고양아 멍멍해봐'
ORDER BY write_datetime DESC
LIMIT 0, 5;