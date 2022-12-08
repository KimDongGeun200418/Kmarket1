INSERT INTO `km_member`
SET	`uid`			='test1',
		`pass`		='test1',
		`name`		='테스트',
		`gender`		='1',
		`hp`			='010-1234-1234',
		`email`		='test1@gmail.com',
		`type`		='1',
		`point`		='0',
		`level`		='1',
		`zip`			='zip',
		`addr1`		='addr1',
		`addr2`		='addr2',
		`company`	='GreenAcademy',
		`ceo`			='KDG',
		`bizRegNum`	='123456123456',
		`comRegNum`	='46363463',
		`tel`			='010-1234-4567',
		`manager`	='KDGJr',
		`managerHp`	='010-1234-5678',
		`fax`			='333-2222',
		`regip`		='11111',
		`wdate`		= NULL,
		`rdate`		= NOW(),
		`provLocation`	='0';

INSERT INTO `km_member_terms`
SET 	`terms`	='약관',
		`privacy`='개인정보보호',
		`location`='location',
		`finance`='finance',
		`tax`		='tax';

#category
INSERT INTO `km_product_cate1` VALUE( 10, '브랜드패션');
INSERT INTO `km_product_cate1` VALUE( 11, '패션의류/잡화/뷰티');
INSERT INTO `km_product_cate1` VALUE( 12, '유아동');
INSERT INTO `km_product_cate1` VALUE( 13, '식품/생필품');
INSERT INTO `km_product_cate1` VALUE( 14, '홈데코/취미/반려');
INSERT INTO `km_product_cate1` VALUE( 15, '컴퓨터/디지털/가전');
INSERT INTO `km_product_cate1` VALUE( 16, '스포츠/건강/렌탈');
INSERT INTO `km_product_cate1` VALUE( 17, '자동차/공구');
INSERT INTO `km_product_cate1` VALUE( 18, '여행/도서/티켓/쿠폰');

INSERT INTO `km_product_cate2` VALUE( 10, 10, '브랜드 여성의류');
INSERT INTO `km_product_cate2` VALUE( 10, 11, '브랜드 남성의류');
INSERT INTO `km_product_cate2` VALUE( 10, 12, '브랜드 진/캐쥬얼');
INSERT INTO `km_product_cate2` VALUE( 10, 13, '브랜드 신발/가방');
INSERT INTO `km_product_cate2` VALUE( 10, 14, '브랜드 쥬얼리/시계');
INSERT INTO `km_product_cate2` VALUE( 10, 15, '브랜드 아웃도어');

INSERT INTO `km_product_cate2` VALUE( 11, 10, '여성의류');
INSERT INTO `km_product_cate2` VALUE( 11, 11, '남성의류');
INSERT INTO `km_product_cate2` VALUE( 11, 12, '언더웨어');
INSERT INTO `km_product_cate2` VALUE( 11, 13, '신발');
INSERT INTO `km_product_cate2` VALUE( 11, 14, '가방/잡화');
INSERT INTO `km_product_cate2` VALUE( 11, 15, '쥬얼리/시계');
INSERT INTO `km_product_cate2` VALUE( 11, 16, '화장품/향수');
INSERT INTO `km_product_cate2` VALUE( 11, 17, '바디/헤어');


INSERT INTO `km_product_cate2` VALUE( 12, 10, '출산/육아');
INSERT INTO `km_product_cate2` VALUE( 12, 11, '장난감/완구');
INSERT INTO `km_product_cate2` VALUE( 12, 12, '유아동 의류');
INSERT INTO `km_product_cate2` VALUE( 12, 13, '유아동 신발/잡화');


INSERT INTO `km_product_cate2` VALUE( 13, 10, '신선식품');
INSERT INTO `km_product_cate2` VALUE( 13, 11, '가공식품');
INSERT INTO `km_product_cate2` VALUE( 13, 12, '건강식품');
INSERT INTO `km_product_cate2` VALUE( 13, 13, '커피/음료');
INSERT INTO `km_product_cate2` VALUE( 13, 14, '생필품');
INSERT INTO `km_product_cate2` VALUE( 13, 15, '바디/헤어');


INSERT INTO `km_product_cate2` VALUE( 14, 10, '가구/DIY');
INSERT INTO `km_product_cate2` VALUE( 14, 11, '침구/커튼');
INSERT INTO `km_product_cate2` VALUE( 14, 12, '조명/인테리어');
INSERT INTO `km_product_cate2` VALUE( 14, 13, '생활용품');
INSERT INTO `km_product_cate2` VALUE( 14, 14, '주방용품');
INSERT INTO `km_product_cate2` VALUE( 14, 15, '문구/사무용품');
INSERT INTO `km_product_cate2` VALUE( 14, 16, '사무기기');
INSERT INTO `km_product_cate2` VALUE( 14, 17, '악기/취미');
INSERT INTO `km_product_cate2` VALUE( 14, 18, '반려동물용품');


INSERT INTO `km_product_cate2` VALUE( 15, 10, '노트북/PC');
INSERT INTO `km_product_cate2` VALUE( 15, 11, '모니터/프린터');
INSERT INTO `km_product_cate2` VALUE( 15, 12, 'PC주변기기');
INSERT INTO `km_product_cate2` VALUE( 15, 13, '모바일/태블릿');
INSERT INTO `km_product_cate2` VALUE( 15, 14, '카메라');
INSERT INTO `km_product_cate2` VALUE( 15, 15, '게임');
INSERT INTO `km_product_cate2` VALUE( 15, 16, '영상가전');
INSERT INTO `km_product_cate2` VALUE( 15, 17, '주방가전');
INSERT INTO `km_product_cate2` VALUE( 15, 18, '계절가전');
INSERT INTO `km_product_cate2` VALUE( 15, 19, '생활/미용가전');
INSERT INTO `km_product_cate2` VALUE( 15, 20, '음향가전');
INSERT INTO `km_product_cate2` VALUE( 15, 21, '건강가전');


INSERT INTO `km_product_cate2` VALUE( 16, 10, '스포츠의류/운동화');
INSERT INTO `km_product_cate2` VALUE( 16, 11, '휘트니스/수영');
INSERT INTO `km_product_cate2` VALUE( 16, 12, '구기/라켓');
INSERT INTO `km_product_cate2` VALUE( 16, 13, '골프');
INSERT INTO `km_product_cate2` VALUE( 16, 14, '자전거/보드/기타레저');
INSERT INTO `km_product_cate2` VALUE( 16, 15, '캠핑/낚시');
INSERT INTO `km_product_cate2` VALUE( 16, 16, '등산/아웃도어');
INSERT INTO `km_product_cate2` VALUE( 16, 17, '건강/의료용품');
INSERT INTO `km_product_cate2` VALUE( 16, 18, '건강식품');
INSERT INTO `km_product_cate2` VALUE( 16, 19, '렌탈서비스');


INSERT INTO `km_product_cate2` VALUE( 17, 10, '자동차용품');
INSERT INTO `km_product_cate2` VALUE( 17, 11, '공구/안전/산업용품');


INSERT INTO `km_product_cate2` VALUE( 18, 10, '여행/항공권');
INSERT INTO `km_product_cate2` VALUE( 18, 11, '도서/음반/e교육');
INSERT INTO `km_product_cate2` VALUE( 18, 12, '공연티켓');
INSERT INTO `km_product_cate2` VALUE( 18, 13, 'e쿠폰');
INSERT INTO `km_product_cate2` VALUE( 18, 14, '상품권');

