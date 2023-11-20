-- Active: 1694996562687@@127.0.0.1@3306@columbus
CREATE TABLE ITINERARY
(
  itinearay_number INT          NOT NULL AUTO_INCREMENT COMMENT '게시물 번호', 
  writer_id        VARCHAR(50)  NOT NULL COMMENT '작성자 아이디',
  title            VARCHAR(100) NOT NULL COMMENT '제목',
  notepad          TEXT         NULL     COMMENT '메모장',
  favorite_count   INT          NOT NULL DEFAULT 0 COMMENT '좋아요 수',
  comment_count    INT          NOT NULL DEFAULT 0 COMMENT '댓글 수',
  view_count       INT          NOT NULL DEFAULT 0 COMMENT '조회 수',
  write_datetime   DATETIME     NOT NULL COMMENT '작성날짜',
  PRIMARY KEY (itinearay_number)
) COMMENT '여행일정';

CREATE TABLE ITINERARY_ACCOUNT_BOOK
(
  sequence         INT         NOT NULL COMMENT '시퀀스',
  itinearay_number INT         NOT NULL COMMENT '게시물 번호',
  money_type       VARCHAR(20) NOT NULL COMMENT '화폐 종류',
  money            INT         NOT NULL COMMENT '비용',
  item             TEXT        NOT NULL COMMENT '경비 목록',
  PRIMARY KEY (sequence)
) COMMENT '가계부';

CREATE TABLE ITINERARY_COMMENT
(
  comment_number   INT         NOT NULL COMMENT '댓글 번호',
  itinearay_number INT         NOT NULL COMMENT '게시물 번호',
  writer_id        VARCHAR(50) NOT NULL COMMENT '작성자 아이디',
  content          TEXT        NOT NULL COMMENT '댓글 내용',
  write_datetime   DATETIME    NOT NULL COMMENT '댓글 작성 날짜',
  PRIMARY KEY (comment_number)
) COMMENT '여행일정 댓글';

CREATE TABLE ITINERARY_DAY_LOCATION
(
  sequence         INT  NOT NULL COMMENT '시퀀스',
  itinearay_number INT  NOT NULL COMMENT '게시물 번호',
  day              INT  NOT NULL COMMENT '일정 날짜',
  location         TEXT NOT NULL COMMENT '장소 이름',
  location_address TEXT NOT NULL COMMENT '장소 주소',
  PRIMARY KEY (sequence)
) COMMENT '날짜, 장소';

CREATE TABLE ITINERARY_FAVORITE
(
  user_id          VARCHAR(50) NOT NULL COMMENT '유저 아이디',
  itinearay_number INT         NOT NULL COMMENT '게시물 번호',
  PRIMARY KEY (user_id, itinearay_number)
) COMMENT '여행일정 좋아요';

CREATE TABLE TRAVEL_REVIEW
(
  review_number  INT         NOT NULL COMMENT '게시물 번호',
  writer_id      VARCHAR(50) NOT NULL COMMENT '작성자 아이디',
  title          VARCHAR(50) NOT NULL COMMENT '게시물 제목',
  content        TEXT        NOT NULL COMMENT '게시물 내용',
  favorite_count INT         NOT NULL DEFAULT 0 COMMENT '좋아요 수',
  comment_count  INT         NOT NULL DEFAULT 0 COMMENT '댓글 수',
  view_count     INT         NOT NULL DEFAULT 0 COMMENT '조회 수',
  write_datetime DATETIME    NOT NULL COMMENT '작성날짜',
  PRIMARY KEY (review_number)
) COMMENT '여행후기';

CREATE TABLE TRAVEL_REVIEW_COMMENT
(
  comment_number INT         NOT NULL COMMENT '댓글 번호',
  review_number  INT         NOT NULL COMMENT '게시물 번호',
  writer_id      VARCHAR(50) NOT NULL COMMENT '작성자 아이디',
  content        TEXT        NOT NULL COMMENT '댓글 내용',
  write_datetime DATETIME    NOT NULL COMMENT '댓글 작성 날짜',
  PRIMARY KEY (comment_number)
) COMMENT '여행후기 댓글';

CREATE TABLE TRAVEL_REVIEW_FAVORITE
(
  review_number INT         NOT NULL COMMENT '게시물 번호',
  user_id       VARCHAR(50) NOT NULL COMMENT '유저 아이디',
  PRIMARY KEY (review_number, user_id)
) COMMENT '여행후기 좋아요';

CREATE TABLE TRAVEL_REVIEW_IMAGE
(
  sequence      INT  NOT NULL COMMENT '시퀀스',
  image         TEXT NOT NULL COMMENT '이미지',
  review_number INT  NOT NULL COMMENT '게시물 번호',
  PRIMARY KEY (sequence)
) COMMENT '후기 이미지';

CREATE TABLE TRAVEL_REVIEW_LOCATION
(
  sequence      INT  NOT NULL COMMENT '시퀀스',
  location      TEXT NOT NULL COMMENT '장소',
  review_number INT  NOT NULL COMMENT '게시물 번호',
  PRIMARY KEY (sequence)
) COMMENT '후기 장소';

CREATE TABLE TRAVEL_TRADE
(
  travel_trade_number INT          NOT NULL COMMENT '게시물 번호',
  writer_id           VARCHAR(50)  NOT NULL COMMENT '유저 아이디',
  title               VARCHAR(100) NOT NULL COMMENT '제목',
  item_type           VARCHAR(20)  NOT NULL COMMENT '물건 종류',
  item_quantity       INT          NOT NULL COMMENT '수량',
  content             TEXT         NOT NULL COMMENT '설명',
  view_count          INT          NOT NULL DEFAULT 0 COMMENT '조회 수',
  write_datetime      DATETIME     NOT NULL COMMENT '작성일',
  PRIMARY KEY (travel_trade_number)
) COMMENT '자유거래';

CREATE TABLE TRAVEL_TRADE_BOOKMARK
(
  user_id             VARCHAR(50) NOT NULL COMMENT '유저 아이디',
  travel_trade_number INT         NOT NULL COMMENT '게시물 번호',
  PRIMARY KEY (user_id, travel_trade_number)
) COMMENT '북마크';

CREATE TABLE TRAVEL_TRADE_HASHTAG
(
  sequence            INT         NOT NULL COMMENT '시퀀스',
  travel_trade_number INT         NOT NULL COMMENT '게시물 번호',
  hashtag             VARCHAR(20) NOT NULL COMMENT '해시태그',
  PRIMARY KEY (sequence)
) COMMENT '거래 해시태그';

CREATE TABLE TRAVEL_TRADE_IMAGE
(
  sequence            INT          NOT NULL COMMENT '시퀀스',
  travel_trade_number INT          NOT NULL COMMENT '게시물 번호',
  item_image          VARCHAR(255) NOT NULL COMMENT '상품 사진',
  PRIMARY KEY (sequence)
) COMMENT '상품 이미지';

CREATE TABLE TRAVEL_TRADE_LOCATION
(
  sequence            INT  NOT NULL COMMENT '시퀀스',
  travel_trade_number INT  NOT NULL COMMENT '게시물 번호',
  location            TEXT NOT NULL COMMENT '장소 이름',
  PRIMARY KEY (sequence)
) COMMENT '거래 장소';

CREATE TABLE TRAVEL_TRADE_MONEY
(
  sequence            INT         NOT NULL COMMENT '시퀀스',
  travel_trade_number INT         NOT NULL COMMENT '게시물 번호',
  money_type          VARCHAR(20) NOT NULL COMMENT '화폐 종류',
  money               INT         NOT NULL COMMENT '가격',
  PRIMARY KEY (sequence)
) COMMENT '거래 화폐';

CREATE TABLE USER
(
  user_id       VARCHAR(50)  NOT NULL COMMENT '유저 아이디',
  password      VARCHAR(100) NOT NULL COMMENT '유저 비밀번호',
  email         VARCHAR(50)  NOT NULL COMMENT '유저 이메일',
  nickname      VARCHAR(20)  NOT NULL COMMENT '유저 닉네임',
  profile_text  TEXT         NULL     COMMENT '유저 소개글',
  tel_number    VARCHAR(15)  NOT NULL COMMENT '유저 전화번호',
  profile_image VARCHAR(255) NULL     COMMENT '유저 프로필사진',
  PRIMARY KEY (user_id)
) COMMENT '유저';

CREATE TABLE USER_HASHTAG
(
  sequence INT         NOT NULL COMMENT '시퀀스',
  user_id  VARCHAR(50) NOT NULL COMMENT '유저 아이디',
  hashtag  VARCHAR(20) NOT NULL COMMENT '관심사 해시태그',
  PRIMARY KEY (sequence)
);

ALTER TABLE USER_HASHTAG
  ADD CONSTRAINT FK_USER_TO_USER_HASHTAG
    FOREIGN KEY (user_id)
    REFERENCES USER (user_id);

ALTER TABLE ITINERARY
  ADD CONSTRAINT FK_USER_TO_ITINERARY
    FOREIGN KEY (writer_id)
    REFERENCES USER (user_id);

ALTER TABLE ITINERARY_DAY_LOCATION
  ADD CONSTRAINT FK_ITINERARY_TO_ITINERARY_DAY_LOCATION
    FOREIGN KEY (itinearay_number)
    REFERENCES ITINERARY (itinearay_number);

ALTER TABLE ITINERARY_ACCOUNT_BOOK
  ADD CONSTRAINT FK_ITINERARY_TO_ITINERARY_ACCOUNT_BOOK
    FOREIGN KEY (itinearay_number)
    REFERENCES ITINERARY (itinearay_number);

ALTER TABLE ITINERARY_COMMENT
  ADD CONSTRAINT FK_ITINERARY_TO_ITINERARY_COMMENT
    FOREIGN KEY (itinearay_number)
    REFERENCES ITINERARY (itinearay_number);

ALTER TABLE ITINERARY_COMMENT
  ADD CONSTRAINT FK_USER_TO_ITINERARY_COMMENT
    FOREIGN KEY (writer_id)
    REFERENCES USER (user_id);

ALTER TABLE ITINERARY_FAVORITE
  ADD CONSTRAINT FK_USER_TO_ITINERARY_FAVORITE
    FOREIGN KEY (user_id)
    REFERENCES USER (user_id);

ALTER TABLE ITINERARY_FAVORITE
  ADD CONSTRAINT FK_ITINERARY_TO_ITINERARY_FAVORITE
    FOREIGN KEY (itinearay_number)
    REFERENCES ITINERARY (itinearay_number);

ALTER TABLE TRAVEL_TRADE_BOOKMARK
  ADD CONSTRAINT FK_TRAVEL_TRADE_TO_TRAVEL_TRADE_BOOKMARK
    FOREIGN KEY (travel_trade_number)
    REFERENCES TRAVEL_TRADE (travel_trade_number);

ALTER TABLE TRAVEL_TRADE_BOOKMARK
  ADD CONSTRAINT FK_USER_TO_TRAVEL_TRADE_BOOKMARK
    FOREIGN KEY (user_id)
    REFERENCES USER (user_id);

ALTER TABLE TRAVEL_TRADE
  ADD CONSTRAINT FK_USER_TO_TRAVEL_TRADE
    FOREIGN KEY (writer_id)
    REFERENCES USER (user_id);

ALTER TABLE TRAVEL_TRADE_HASHTAG
  ADD CONSTRAINT FK_TRAVEL_TRADE_TO_TRAVEL_TRADE_HASHTAG
    FOREIGN KEY (travel_trade_number)
    REFERENCES TRAVEL_TRADE (travel_trade_number);

ALTER TABLE TRAVEL_TRADE_IMAGE
  ADD CONSTRAINT FK_TRAVEL_TRADE_TO_TRAVEL_TRADE_IMAGE
    FOREIGN KEY (travel_trade_number)
    REFERENCES TRAVEL_TRADE (travel_trade_number);

ALTER TABLE TRAVEL_TRADE_MONEY
  ADD CONSTRAINT FK_TRAVEL_TRADE_TO_TRAVEL_TRADE_MONEY
    FOREIGN KEY (travel_trade_number)
    REFERENCES TRAVEL_TRADE (travel_trade_number);

ALTER TABLE TRAVEL_TRADE_LOCATION
  ADD CONSTRAINT FK_TRAVEL_TRADE_TO_TRAVEL_TRADE_LOCATION
    FOREIGN KEY (travel_trade_number)
    REFERENCES TRAVEL_TRADE (travel_trade_number);

ALTER TABLE TRAVEL_REVIEW
  ADD CONSTRAINT FK_USER_TO_TRAVEL_REVIEW
    FOREIGN KEY (writer_id)
    REFERENCES USER (user_id);

ALTER TABLE TRAVEL_REVIEW_IMAGE
  ADD CONSTRAINT FK_TRAVEL_REVIEW_TO_TRAVEL_REVIEW_IMAGE
    FOREIGN KEY (review_number)
    REFERENCES TRAVEL_REVIEW (review_number);

ALTER TABLE TRAVEL_REVIEW_LOCATION
  ADD CONSTRAINT FK_TRAVEL_REVIEW_TO_TRAVEL_REVIEW_LOCATION
    FOREIGN KEY (review_number)
    REFERENCES TRAVEL_REVIEW (review_number);

ALTER TABLE TRAVEL_REVIEW_COMMENT
  ADD CONSTRAINT FK_USER_TO_TRAVEL_REVIEW_COMMENT
    FOREIGN KEY (writer_id)
    REFERENCES USER (user_id);

ALTER TABLE TRAVEL_REVIEW_COMMENT
  ADD CONSTRAINT FK_TRAVEL_REVIEW_TO_TRAVEL_REVIEW_COMMENT
    FOREIGN KEY (review_number)
    REFERENCES TRAVEL_REVIEW (review_number);

ALTER TABLE TRAVEL_REVIEW_FAVORITE
  ADD CONSTRAINT FK_TRAVEL_REVIEW_TO_TRAVEL_REVIEW_FAVORITE
    FOREIGN KEY (review_number)
    REFERENCES TRAVEL_REVIEW (review_number);

ALTER TABLE TRAVEL_REVIEW_FAVORITE
  ADD CONSTRAINT FK_USER_TO_TRAVEL_REVIEW_FAVORITE
    FOREIGN KEY (user_id)
    REFERENCES USER (user_id);

CREATE USER 'columbus'@'*' IDENTIFIED BY 'Password';

CREATE VIEW itinerary_board_list_view AS
SELECT 
  IB.itinearay_number AS itinearay_number,
  IB.title AS title,
  IB.favorite_count AS favorite_count,
  IB.comment_count AS comment_count,
  IB.view_count AS view_count,
  IB.write_datetime AS write_datetime,
  IB.writer_id AS writer_id,
  U.nickname AS writer_nickname,
  U.profile_image AS writer_profile_image,
  IDL.day AS day,
  IDL.location AS location
FROM itinerary AS IB
INNER JOIN user AS U
ON IB.writer_id = U.user_id
LEFT JOIN itinerary_day_location AS IDL
ON IB.itinearay_number = IDL.itinearay_number;

CREATE VIEW travle_review_board_list_view AS
SELECT
  RB.review_number AS review_number,
  RB.title AS title,
  RB.content AS content,
  RI.image AS image,
  RB.favorite_count AS favorite_count,
  RB.comment_count AS comment_count,
  RB.view_count AS view_count,
  RB.writer_id AS writer_id,
  RB.write_datetime AS write_datetime,
  RL.location AS location,
  U.nickname AS writer_nickname,
  U.profile_image AS writer_profile_image
FROM travel_review AS RB
INNER JOIN user AS U
ON RB.writer_id = U.user_id
LEFT JOIN travel_review_location AS RL
ON RB.review_number = RL.review_number
LEFT JOIN (SELECT review_number, ANY_VALUE(image) AS image FROM travel_review_image GROUP BY review_number) AS RI
ON RB.review_number = RI.review_number;
