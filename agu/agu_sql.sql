-- agu 스키마 생성
create database agu;

-- agu 스키마 사용
use agu;

-- 테이블 컬럼 정보 확인 예시
SHOW FULL COLUMNS FROM agu.product;

-- 테이블 샘플 데이터 조회
SELECT * FROM agu.admin;
SELECT * FROM agu.user;
SELECT * FROM agu.files;
SELECT * FROM agu.review;
SELECT * FROM agu.cate;
SELECT * FROM agu.product;
SELECT * FROM agu.notice;
SELECT * FROM agu.faq;
SELECT * FROM agu.cart;
SELECT * FROM agu.buy_order;
SELECT * FROM agu.buy_orderitem;


-- admin 테이블 생성
create table admin(
	adminemail varchar(300) primary key,
    adminpw varchar(300) not null,
    adminname varchar(300),
	adminphone varchar(300),
    postnum varchar(300),
    addr varchar(1000),
    detailaddress varchar(3000),
    seealso varchar(1000)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- admin 테이블 샘플 데이터 입력
INSERT INTO admin VALUES ('admin1234@naver.com', 'admin1234!!', '관리자', '010-1234-5678', '02830', '서울 성북구 아리랑로', '상세주소', '1');

-- user 테이블 생성
create table user(
	useremail varchar(300) primary key,
    userpw varchar(300) not null,
    username varchar(300),
    postnum varchar(300),
    addr varchar(1000),
    detailaddress varchar(3000),
    seealso varchar(1000)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- user 테이블 샘플 데이터 입력
INSERT INTO user VALUES ('test1234@naver.com', 'test1234!!', 'test00', '02830', '서울 성북구 아리랑로', '상세주소', '1');

-- cate 테이블 생성
CREATE TABLE agu.cate (
catenum int not null,
catename varchar(30) not null primary key
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- cate 테이블 샘플 데이터 입력
INSERT INTO agu.cate (catenum, catename) VALUES (1, 'Best');
INSERT INTO agu.cate (catenum, catename) VALUES (2, 'New');
INSERT INTO agu.cate (catenum, catename) VALUES (3, 'Dress');
INSERT INTO agu.cate (catenum, catename) VALUES (4, 'Outer');
INSERT INTO agu.cate (catenum, catename) VALUES (5, 'Blouse');
INSERT INTO agu.cate (catenum, catename) VALUES (6, 'Tee');
INSERT INTO agu.cate (catenum, catename) VALUES (7, 'Knit');
INSERT INTO agu.cate (catenum, catename) VALUES (8, 'Bottom');

-- product 테이블 생성
create table product(
	productnum int primary key auto_increment,
    catename VARCHAR(30),
    productname varchar(300),
    productprice varchar(300),
    productcontents varchar(6000),
    productDiscount decimal(2,2),
	adminemail varchar(300)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
    
-- product 테이블 샘플 데이터 입력
INSERT INTO agu.product (productname, productprice, productcontents, adminemail) VALUES ('test111', 3000, 'test1', 'admin1234@naver.com');

-- files 테이블 생성
create table files(
	productnum int,
	filerealname varchar(3000),
    filename varchar(3000),
    fileurl varchar(3000),
    safefile varchar(6000),
    constraint product_files foreign key(productnum) references product(productnum) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- files 테이블 샘플 데이터 입력
INSERT INTO agu.files (productnum, filerealname, filename, fileurl, safefile) VALUES (1, 'test입니다1', 'tee_01.png', 'ㅇㅇㅇ','ㅇㅇㅇ');

-- buyproduct 테이블 생성
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
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- review 테이블 생성
create table review(
	reviewnum int primary key auto_increment,
	useremail varchar(300),
    username varchar(300),
    productnum int,
    reviewcontents varchar(6000),
    regdate datetime default now(),
    constraint product_review foreign key(productnum) references product(productnum) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- cart 테이블 생성
create table cart(
    cartId  int not null auto_increment primary key,
    useremail varchar(300),
    productnum int,
    productCount int default null,
    unique key useremail (useremail, productnum),
    constraint cart_ibfk_1 foreign key (useremail) references user(useremail),
    constraint cart_ibfk_2 foreign key (productnum) references product(productnum)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- notice 테이블 생성
create table notice(
    bno int auto_increment,
    title varchar(150),
    content varchar(2000),
    writer varchar(50),
    regdate timestamp default now(),
    updatedate timestamp default now(),
    constraint product_notice PRIMARY key(bno)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- notice 테이블 샘플 데이터 입력
INSERT INTO agu.notice (title, content, writer, regdate, updatedate) VALUES ('test1제목', 'test1내용', 'test1작성자', now(), now());

-- faq 테이블 생성
create table faq(
    bno int auto_increment,
    title varchar(150),
    content varchar(2000),
    writer varchar(50),
    regdate timestamp default now(),
    updatedate timestamp default now(),
    constraint product_faq PRIMARY key(bno)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- faq 테이블 샘플 데이터 입력
INSERT INTO agu.faq (title, content, writer, regdate, updatedate) VALUES ('test1제목', 'test1내용', 'test1작성자', now(), now());

create table buy_order(
    orderId varchar(50) primary key,
    addressee varchar(50) not null,
    useremail varchar(300),
    postnum varchar(100) not null,
    addr varchar(100) not null,
    detailaddress varchar(100) not null,
    orderState varchar(30) not null,
    deliveryCost int not null,
    orderDate timestamp default now(),
    constraint order_user FOREIGN KEY (useremail)REFERENCES user(useremail)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table agu.buy_orderItem(
    orderItemId int auto_increment primary key,
    orderId varchar(50),
    productnum int,
    productCount int not null,
    productprice int not null,
    FOREIGN KEY (orderId) REFERENCES buy_order(orderId),
    FOREIGN KEY (productnum) REFERENCES product(productnum)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 테이블 삭제
DROP TABLE agu.admin;
DROP TABLE agu.user;
DROP TABLE agu.files;
DROP TABLE agu.review;
DROP TABLE agu.cate;
DROP TABLE agu.product;
DROP TABLE agu.notice;
DROP TABLE agu.faq;
DROP TABLE agu.cart;

