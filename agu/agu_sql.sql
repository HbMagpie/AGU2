-- agu 스키마 생성
create database agu;

-- agu 스키마 사용
use agu;

-- 테이블 삭제 예시
DROP TABLE agu.files;
DROP TABLE agu.product;

-- shopping_user 테이블 생성
create table shopping_user(
	useremail varchar(300) primary key,
    userpw varchar(300) not null,
    username varchar(300),
    userphone varchar(300),
    postnum varchar(300),
    addr varchar(1000),
    detailaddress varchar(3000),
    seealso varchar(1000)
);

-- shopping_user 테이블 샘플 데이터 입력
INSERT INTO agu.shopping_user VALUES ('test1234@naver.com', 'test1234!!', 'test00', '010-1234-5678', '02830', '서울 성북구 아리랑로 3', '상세주소', '1');

-- product 테이블 생성
create table product(
	productnum int primary key auto_increment,
    productname varchar(300),
    productprice varchar(300),
    productcontents varchar(6000),
	useremail varchar(300),
    constraint user_product foreign key(useremail) references shopping_user(useremail)
);

-- product 테이블 샘플 데이터 입력
INSERT INTO agu.product (productname, productprice, productcontents, useremail) VALUES ('test111', 3000, 'test입니다1', 'test1234@naver.com');
INSERT INTO agu.product (productname, productprice, productcontents, useremail) VALUES ('test222', 50000, 'test입니다2', 'test1234@naver.com');
INSERT INTO agu.product (productname, productprice, productcontents, useremail) VALUES ('test333', 25500, 'test입니다3', 'test1234@naver.com');
INSERT INTO agu.product (productname, productprice, productcontents, useremail) VALUES ('test444', 30000, 'test입니다4', 'test1234@naver.com');
INSERT INTO agu.product (productname, productprice, productcontents, useremail) VALUES ('test555', 35000, 'test입니다5', 'test1234@naver.com');

create table files(
	productnum int,
	filerealname varchar(3000),
    filename varchar(3000),
    fileurl varchar(3000),
    safefile varchar(6000),
    constraint product_files foreign key(productnum) references product(productnum)
);

-- files 테이블 샘플 데이터 입력
INSERT INTO agu.files (productnum, filerealname, filename, fileurl, safefile) VALUES (1, 'test입니다1', 'tee_01.png', 'ㅇㅇㅇ','ㅇㅇㅇ');
INSERT INTO agu.files (productnum, filerealname, filename, fileurl, safefile) VALUES (2, 'test입니다2', 'tee_02.png', 'ㅇㅇㅇ','ㅇㅇㅇ');
INSERT INTO agu.files (productnum, filerealname, filename, fileurl, safefile) VALUES (3, 'test입니다3', 'tee_03.png', 'ㅇㅇㅇ','ㅇㅇㅇ');
INSERT INTO agu.files (productnum, filerealname, filename, fileurl, safefile) VALUES (4, 'test입니다4', 'tee_04.png', 'ㅇㅇㅇ','ㅇㅇㅇ');
INSERT INTO agu.files (productnum, filerealname, filename, fileurl, safefile) VALUES (5, 'test입니다5', 'tee_05.png', 'ㅇㅇㅇ','ㅇㅇㅇ');

create table buyproduct(
	useremail varchar(300),
    username varchar(300),
    productnum int,
    productname varchar(300),
	postnum int,
	addr varchar(1000),
    detailaddress varchar(3000),
    seealso varchar(1000)
);

create table review(
	reviewnum int primary key auto_increment,
	useremail varchar(300),
    username varchar(300),
    productnum int,
    reviewcontents varchar(6000),
    regdate datetime default now()
);