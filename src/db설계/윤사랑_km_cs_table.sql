CREATE TABLE `km_cs_notice` (
	`no` INT PRIMARY KEY auto_increment,
	`title` VARCHAR(255) NOT NULL,
	`content` TEXT NOT NULL,
	`uid` VARCHAR(20) NOT NULL,
	`regip` VARCHAR(100) NOT NULL,
	`rdate` DATETIME,
	`cate` VARCHAR(20) NOT NULL
);
CREATE TABLE `km_cs_faq` (
	`no` INT PRIMARY KEY auto_increment,
	`title` VARCHAR(255) NOT NULL,
	`content` TEXT NOT NULL,
	`uid` VARCHAR(20) NOT NULL,
	`regip` VARCHAR(100) NOT NULL,
	`rdate` DATETIME,
	`cate` VARCHAR(20) NOT NULL,
	`cate2` VARCHAR(20) NOT NULL
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
	`parent` INT(10) NULL DEFAULT '0',
	`comment` INT(10) NULL DEFAULT '0'
);

SELECT `no`, `cate2`, `title` from `km_cs_faq` WHERE `cate`= 'member' GROUP BY `cate2` ORDER BY `no` DESC ;