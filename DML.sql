-- Active: 1694996562687@@127.0.0.1@3306@columbus
-- 회원가입
INSERT INTO user VALUES ('Meow', 'Password', 'catslove',  'cats@email.com', '01012345678', null, null)

-- 로그인
SELECT * FROM user WHERE user_id = 'Meow';

-- 여행일정 게시물 작성
INSERT INTO itinerary (itinearay_number, writer_id, title, notepad, favorite_count, comment_count, view_count, write_datetime)
VALUES (1, 'Meow', '여행일정 제목입니다.', null, 0, 0, 0, '2023-11-15');

-- 여행일정 날짜 및 장소 작성
INSERT INTO itinerary_day_location (itinearay_number, day, location, location_address)
VALUES (1, 1, '부산대학교', '부산 금정구 부산대학로');

-- 여행일정 가계부 작성
INSERT INTO itinerary_account_book (itinearay_number, money_type, money, item)
VALUES (1, '달러', 10, '담요');

-- 여행일정 댓글 작성
INSERT INTO itinerary_comment (itinearay_number, writer_id, content, write_datetime)
VALUES (1, 'Meow', '댓글이지롱', '2023-11-15-11:45');

-- 여행일정 댓글 수 + 1 코드
UPDATE itinerary SET comment_count = comment_count + 1 WHERE itinearay_number = 1;

-- 여행일정 좋아요
INSERT INTO
itinerary_favorite VALUES ('Meow', 1);

-- 여행일정 좋아요 수 + 1 코드
UPDATE itinerary SET favorite_count = favorite_count + 1 WHERE itinearay_number = 1;

-- 여행일정 좋아요 취소
DELETE FROM itinerary_favorite WHERE user_id = 'Meow' AND itinearay_number = 1;

-- 여행일정 좋아요 수 - 1 코드
UPDATE itinerary SET favorite_count = favorite_count - 1 WHERE itinearay_number = 1;

-- 여행일정 게시물 수정
UPDATE itinerary SET title = '여행일정 수정 제목', notepad = '메모했다링' WHERE itinearay_number = 1;

-- 여행일정 날짜 및 장소 수정
UPDATE itinerary_day_location SET location = '서면', location_address = '부전동' WHERE itinearay_number;

-- 여행일정 가계부 수정
UPDATE itinerary_account_book SET money_type = '원', money = 2000, item = '손수건' WHERE itinearay_number;

-- 여행일정 게시물 삭제
DELETE FROM itinerary_comment WHERE itinearay_number = 1;
DELETE FROM itinerary_favorite WHERE itinearay_number = 1;
DELETE FROM itinerary_account_book WHERE itinearay_number = 1;
DELETE FROM itinerary_day_location WHERE itinearay_number = 1;
DELETE FROM itinerary WHERE itinearay_number = 1;