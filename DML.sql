-- Active: 1694996562687@@127.0.0.1@3306@columbus
-- 회원가입
INSERT INTO user VALUES ('Meow', 'Password', 'catslove',  'cats@email.com', '01012345678', null, null)

-- 로그인
SELECT * FROM user WHERE user_id = 'Meow';

-- 유저 정보 불러오기 / 로그인 유저 정보 불러오기
SELECT *
FROM user AS U
INNER JOIN user_hashtag AS H
ON U.user_id = H.user_id;

-- 유저 관심사 해시태그 선택
INSERT INTO user_hashtag VALUES ('4', 'Meow', '뭐더라');

-- 유저 관심사 해시태그 수정
UPDATE user_hashtag SET hashtag = '가성비' WHERE user_id = 'Meow' AND hashtag_number = 4;

-- 유저 관심사 해시태그 삭제
DELETE hashtag FROM user_hashtag WHERE user_id = 'Meow' AND hashtag_number = 4;

-- 닉네임 수정
UPDATE user SET nickname = '고양아 멍멍해봐' WHERE user_id = 'Meow';

-- 프로필 이미지 수정
UPDATE user SET profile_image = 'url' WHERE user_id = 'Meow';

-- 소개글 수정
UPDATE user SET profile_text = '나를 소개한다냥' WHERE user_id = 'Meow';

-- 여행일정 게시물 작성
INSERT INTO itinerary (writer_id, title, notepad, favorite_count, comment_count, view_count, write_datetime)
VALUES ('Meow', '여행일정 제목입니다.', null, 0, 0, 0, '2023-11-16 12:00:56');

-- 여행일정 날짜 및 장소 작성
INSERT INTO itinerary_day_location (itinearay_number, day, location, location_address)
VALUES (7, 3, '광안리', '광안리 뭐시기');

-- 여행일정 가계부 작성
INSERT INTO itinerary_account_book (itinearay_number, money_type, money, item)
VALUES (7, '원', 30000, '점심');

-- 여행일정 댓글 작성
INSERT INTO itinerary_comment (itinearay_number, writer_id, content, write_datetime)
VALUES (7, 'Meow', '댓글이지롱', '2023-11-17-11:25');

-- 여행일정 댓글 수 + 1 코드
UPDATE itinerary SET comment_count = comment_count + 1 WHERE itinearay_number = 1;

-- 여행일정 좋아요
INSERT INTO itinerary_favorite VALUES ('Meow', 1);

-- 여행일정 좋아요 수 + 1 코드
UPDATE itinerary SET favorite_count = favorite_count + 1 WHERE itinearay_number = 1;

-- 여행일정 좋아요 취소
DELETE FROM itinerary_favorite WHERE user_id = 'Meow' AND itinearay_number = 1;

-- 여행일정 좋아요 수 - 1 코드
UPDATE itinerary SET favorite_count = favorite_count - 1 WHERE itinearay_number = 1;

-- 여행일정 게시물 수정
UPDATE itinerary SET title = '여행일정 수정 제목', notepad = '메모했다링' WHERE itinearay_number = 1;

-- 여행일정 날짜 및 장소 수정
UPDATE itinerary_day_location SET location = '서면', location_address = '부전2동' WHERE itinearay_number;

-- 여행일정 가계부 수정
UPDATE itinerary_account_book SET money_type = '원', money = 2000, item = '손수건' WHERE itinearay_number;

-- 여행일정 게시물 삭제
DELETE FROM itinerary_comment WHERE itinearay_number = 1;
DELETE FROM itinerary_favorite WHERE itinearay_number = 1;
DELETE FROM itinerary_account_book WHERE itinearay_number = 1;
DELETE FROM itinerary_day_location WHERE itinearay_number = 1;
DELETE FROM itinerary WHERE itinearay_number = 1;

-- <상세 여행 일정 게시물 불러오기> --
SELECT 
  IB.itinearay_number AS itinearay_number,
  IB.writer_id AS writer_id,
  IB.title AS title,
  IB.view_count AS view_count,
  IB.notepad AS notepad,
  IB.write_datetime AS write_datetime,
  U.nickname AS nickname,
  U.profile_image AS profile_image
FROM itinerary AS IB
INNER JOIN user AS U
ON IB.writer_id = U.user_id
WHERE itinearay_number = 7;

SELECT money_type, money, item
FROM itinerary_account_book
WHERE itinearay_number = 7;

SELECT day, location
FROM itinerary_day_location
WHERE itinearay_number = 7;

SELECT
  U.nickname AS nickname,
  U.profile_image AS profile_image
FROM itinerary_favorite AS F
INNER JOIN user AS U
ON F.user_id = U.user_id
WHERE F.itinearay_number = 7;

SELECT
  U.nickname AS nickname,
  U.profile_image AS profile_image,
  C.content AS content,
  C.write_datetime AS write_datetime
FROM itinerary_comment AS C
INNER JOIN user AS U
ON C.writer_id = U.user_id
WHERE C.itinearay_number = 7
ORDER BY write_datetime DESC;

-- 최신 여행 일정 게시물 리스트 불러오기
SELECT *
FROM itinerary_board_list_view
ORDER BY write_datetime DESC
LIMIT 0, 5;

-- 검색한 여행일정 게시물 리스트 불러오기
SELECT *
FROM itinerary_board_list_view
WHERE title LIKE '%수정%' OR location LIKE '%부산대%'
ORDER BY write_datetime;

-- 특정 유저 여행일정 게시물 리스트 불러오기
SELECT *
FROM itinerary_board_list_view
WHERE writer_id = 'Meow'
ORDER BY write_datetime DESC;
