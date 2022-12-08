ALTER TABLE `board_user` ADD   COLUMN `wdate` DATETIME;

UPDATE `board_user` SET `name`=?, `nick`=?, `email`=?, `hp`=?, `zip`=?, `addr1`=?, `addr2`=? WHERE `uid`=?;


ALTER TABLE `board_user` DROP  COLUMN `sessLimitDate`;


update `board_user` set `sessId`='asdasd'essLimitDate`=nullDATE_ADD(NOW(), INTERVAL 3 DAY)re `uid`='gpaj123';
UPDATE `board_article` SET `title`='귀농학교', `content`='why', `rdate`=NOW() WHERE `no`=109;

SELECT a.*, b.nick FROM `board_article` AS a
JOIN `board_user` AS b
ON a.uid = b.uid
WHERE `parent`=0 AND `title` LIKE '%키워드%' OR `nick` LIKE '%kdg%';

SELECT MAX(`no`) from `board_article`

SELECT a.*, b.nick FROM `board_article` AS a
JOIN `board_user` AS b 
ON a.uid = b.uid 
WHERE `parent`=0 AND `cate`='faq'
ORDER BY `no` DESC java2db
LIMIT 0, 100;

UPDATE `board_article` 
SET `comment` = (SELECT a.count FROM (SELECT COUNT(`no`) AS count FROM `board_article` WHERE parent=129) a)
WHERE `no`=129;

EXEC SP_LOCK;


CREATE DATABASE `Kmarket1`;
CREATE USER 'ceo'@'%' IDENTIFIED BY '5678';
GRANT ALL PRIVILEGES ON `Kmarket1`.* TO 'ceo'@'%';
FLUSH PRIVILEGES;


