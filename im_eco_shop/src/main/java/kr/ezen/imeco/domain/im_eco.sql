-- admin 테이블 (관리자 등록)
drop table im_eco_admin;
create table im_eco_admin(
    id varchar(20) not null,
    password varchar(20) not null,
    name varchar(20) not null,
    email varchar(30) not null
);

insert into im_eco_admin values('test', '123', '관리자', 'test@gmail.com');
select * from im_eco_admin;

-- 카테고리 테이블
drop table im_eco_category;
create table im_eco_category(
    cate_num int(5) primary key auto_increment,
    code varchar(10) not null,
    cate_name varchar(20) not null
);

select * from im_eco_category;

-- 상품 테이블
drop table im_eco_product;
create table im_eco_product(
    pnum int(10) primary key auto_increment, 	-- 상품번호
    pname varchar(50) not null,    -- 상품명
    pcategory_fk varchar(20) not null, -- 카테고리
    pcompany varchar(50),  	-- 제조회사
    pimage varchar(200),       -- 상품이미지
    pqty int(5) default 0, 	-- 수량
    price int(10) default 0, -- 가격
    pspec varchar(20),         -- 상품사양(인기, 추천, 신규, 일반)
    pcontent varchar(300),     -- 상품상세  
    point int(8) default 0,  -- 상품별 포인트
    pinput_date date            -- 등록 날짜
);
select * from im_eco_product;

commit;

-- 멤버 테이블
drop table im_eco_Member;
create table im_eco_Member(
	no int primary key auto_increment,
    id varchar(20) unique not null, -- 외래키로 사용되기 때문에 제약조건 추가
    pw varchar(200) not null,
    name varchar(50) not null,
    dob varchar(8) not null,
    tel varchar(20) not null,
    email varchar(50) not null,
    addr varchar(100),
    rdate date
);

insert into im_eco_Member values('user1', '123', '유저', '1102210', '1020545', 'user@naver.com', '서울', now());
select * from im_eco_Member;

alter table im_eco_Member add column dob varchar(8) not null;
commit;

-- 장바구니 테이블
drop table im_eco_cart;

-- 외래키는 식별키(primary key, unique 제약조건)이어야 한다
create table im_eco_cart(
    cart_num int primary key auto_increment,
    id varchar(20),
    pnum int,
    pqty int default 1,
    indate date,
    
    foreign key (id) references im_eco_Member(id),
    foreign key (pnum) references im_eco_product(pnum)
);
select*from im_eco_cart;