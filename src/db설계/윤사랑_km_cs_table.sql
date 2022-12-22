CREATE TABLE `km_cs_notice` (
	`no` INT PRIMARY KEY auto_increment,
	`title` VARCHAR(255) NOT NULL,
	`content` TEXT NOT NULL,
	`uid` VARCHAR(20) NOT NULL,
	`regip` VARCHAR(100) NOT NULL,
	`rdate` DATETIME,
	`cate` VARCHAR(20) NOT NULL,
	`hit` INT DEFAULT '0'
);
CREATE TABLE `km_cs_faq` (
	`no` INT PRIMARY KEY auto_increment,
	`title` VARCHAR(255) NOT NULL,
	`content` TEXT NOT NULL,
	`uid` VARCHAR(20) NOT NULL,
	`regip` VARCHAR(100) NOT NULL,
	`rdate` DATETIME,
	`cate` VARCHAR(20) NOT NULL,
	`cate2` VARCHAR(20) NOT NULL,
	`hit` INT DEFAULT '0'
);
CREATE TABLE `km_cs_qna` (
	`no` INT PRIMARY KEY auto_increment,
	`title` VARCHAR(255) NOT NULL,
	`content` TEXT NOT NULL,
	`uid` VARCHAR(20) NOT NULL,
	`regip` VARCHAR(100) NOT NULL,
	`rdate` DATETIME,
	`cate` VARCHAR(20) NOT NULL,
	`cate2` VARCHAR(20) NOT NULL,
	`comment` TEXT
);
