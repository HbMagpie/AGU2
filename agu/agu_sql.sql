-- agu 스키마 생성
create database agu;

-- agu 스키마 사용
use agu;

-- 테이블 삭제
DROP TABLE agu.user;
DROP TABLE agu.product;
DROP TABLE agu.files;
DROP TABLE agu.buyproduct;
DROP TABLE agu.review;

-- 테이블 컬럼 정보 확인 예시
SHOW FULL COLUMNS FROM agu.product;

-- 테이블 샘플 데이터 조회
SELECT * FROM agu.user;
SELECT * FROM agu.product;
SELECT * FROM agu.files;
SELECT * FROM agu.buyproduct;
SELECT * FROM agu.review;

-- user 테이블 생성
create table user(
	useremail varchar(300) primary key,
    userpw varchar(300) not null,
    username varchar(300),
    userphone varchar(300),
    postnum varchar(300),
    addr varchar(1000),
    detailaddress varchar(3000),
    seealso varchar(1000)
);

-- user 테이블 샘플 데이터 입력
INSERT INTO user VALUES ('test1234@naver.com', 'test1234!!', 'test00', '010-1234-5678', '02830', '서울 성북구 아리랑로', '상세주소', '1');

-- product 테이블 생성
create table product(
	productnum int primary key auto_increment,
    productname varchar(300),
    productprice varchar(300),
    productcontents varchar(6000),
	useremail varchar(300)
);
    
-- product 테이블 샘플 데이터 입력
INSERT INTO agu.product (productname, productprice, productcontents, useremail) VALUES ('test111', 3000, 'test1', 'test1234@naver.com');

-- files 테이블 생성
create table files(
	productnum int,
	filerealname varchar(3000),
    filename varchar(3000),
    fileurl varchar(3000),
    safefile varchar(6000),
    constraint product_files foreign key(productnum) references product(productnum) on delete cascade
);

-- files 테이블 샘플 데이터 입력
INSERT INTO agu.files (productnum, filerealname, filename, fileurl, safefile) VALUES (1, 'test입니다1', 'tee_01.png', 'ㅇㅇㅇ','ㅇㅇㅇ');

create table buyproduct(
	useremail varchar(300),
    username varchar(300),
    productnum int,
    productname varchar(300),
	postnum int,
	addr varchar(1000),
    detailaddress varchar(3000),
    seealso varchar(1000),
    constraint product_buyproduct foreign key(productnum) references product(productnum) on delete cascade

);

create table review(
	reviewnum int primary key auto_increment,
	useremail varchar(300),
    username varchar(300),
    productnum int,
    reviewcontents varchar(6000),
    regdate datetime default now(),
    constraint product_review foreign key(productnum) references product(productnum) on delete cascade
);

-- -------------------------------------------------------------
-- 카테고리 부분 아직 미구현..
-- cate 테이블 삭제
DROP TABLE agu.cate;
 
-- cate 테이블 생성 및 코멘트 추가
CREATE TABLE agu.cate (
catenum INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '카테고리 번호',
catename VARCHAR(30) COMMENT '카테고리명',
PRIMARY KEY (catenum)
) COMMENT '카테고리', default charset utf8;
 
-- cate 테이블 컬럼 정보 확인
SHOW FULL COLUMNS FROM agu.cate;
 
-- cate 테이블 샘플 데이터 입력
INSERT INTO agu.cate (catename) VALUES ('Best');
INSERT INTO agu.cate (catename) VALUES ('New');
INSERT INTO agu.cate (catename) VALUES ('Dress');
INSERT INTO agu.cate (catename) VALUES ('Outer');
INSERT INTO agu.cate (catename) VALUES ('Blouse');
INSERT INTO agu.cate (catename) VALUES ('Tee');
INSERT INTO agu.cate (catename) VALUES ('Knit');
INSERT INTO agu.cate (catename) VALUES ('Bottom');

-- cate 테이블 샘플 데이터 조회
SELECT * FROM agu.cate;