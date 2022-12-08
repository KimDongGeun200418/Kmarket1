CREATE TABLE `km_cs_notice` (
	`cate` VARCHAR(20) NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`content` TEXT NOT NULL,
	`uid` VARCHAR(20) NOT NULL,
	`regip` VARCHAR(100) NOT NULL,
	`rdate` DATETIME 
);
CREATE TABLE `km_cs_faq` (
	`cate1` VARCHAR(20) NOT NULL,
	`cate2` VARCHAR(20) NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`content` TEXT NOT NULL,
	`uid` VARCHAR(20) NOT NULL,
	`regip` VARCHAR(100) NOT NULL
);
CREATE TABLE `km_cs_qna` (
	`parent` INT(10) NULL DEFAULT '0',
	`comment` INT(10) NULL DEFAULT '0',
	`cate1` VARCHAR(20) NOT NULL,
	`cate2` VARCHAR(20) NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`content` TEXT NOT NULL,
	`uid` VARCHAR(20) NOT NULL,
	`regip` VARCHAR(100) NOT NULL,
	`rdate` DATETIME 
);