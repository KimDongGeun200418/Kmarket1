package kr.co.kmarket1.db;

public class Sql {
	//cs-notice
	public static final String INSERT_ARTICLE_NOTICE = "INSERT INTO `km_cs_notice` SET `title`=?, `cate`=?, `content`=?, `uid`=?, `regip`=?, `rdate`=now()";
	public static final String SELECT_NOTICE = "SELECT `no`,`title`, `rdate`, `hit` from `km_cs_notice` WHERE `cate`= ? "
											+"ORDER BY `no` DESC "
											+"LIMIT ?, 10";
	public static final String SELECT_ALL_NOTICE = "SELECT `no`,`title`, `rdate`, `hit`, `cate` from `km_cs_notice` "
												+"ORDER BY `no` DESC "
												+"LIMIT ?, 10";
	public static final String SELECT_ARTICLE_NOTICE = "SELECT `title`,`rdate`,`content`, `cate` FROM `km_cs_notice` WHERE `no`= ?";
	public static final String SELECT_COUNT_NOTICE_ALL = "SELECT COUNT(`no`) FROM `km_cs_notice`";
	public static final String SELECT_COUNT_NOTICE = "SELECT COUNT(`no`) FROM `km_cs_notice` where `cate`=?";
	public static final String SELECT_LATEST_NOTICE = "SELECT `no`,`title`,`rdate`, `cate` FROM `km_cs_notice` "
												   +"ORDER BY `no` DESC LIMIT 5";
	public static final String UPDATE_ARTICLE_NOTICE = "update `km_cs_notice` set `cate`=?, `title`=?, `content`=?, `rdate`=NOW() where `no`=?";
	public static final String UPDATE_NOTICE_HIT = "UPDATE `km_cs_notice` SET `hit` = `hit` + 1 WHERE `no`=?";
	public static final String DELETE_NOTICE = "delete from `km_cs_notice` where `no`=?";
	//cs-qna
	public static final String INSERT_ARTICLE_QNA = "INSERT INTO `km_cs_qna` SET `title`=?, `cate`=?, `cate2`=?, `content`=?, `uid`=?, `regip`=?, `rdate`=now()";
	public static final String INSERT_COMMENT_QNA = "UPDATE `km_cs_qna` SET `comment`=? where `no`=?";
	public static final String SELECT_QNA = "SELECT `no`, `cate2`, `title`, `uid`, `rdate`, `comment` from `km_cs_qna` WHERE `cate`= ? "
											+"ORDER BY `no` DESC "
											+"LIMIT ?, 10";
	public static final String SELECT_ALL_QNA = "SELECT `no`, `cate`, `cate2`, `title`, `uid`, `rdate`, `comment` from `km_cs_qna` "
											+"ORDER BY `no` DESC "
											+"LIMIT ?, 10";
	public static final String SELECT_QNA_CATE = "SELECT DISTINCT(`cate`) FROM `km_cs_qna`";
	public static final String SELECT_QNA_CATE2 = "SELECT distinct `cate2` from `km_cs_qna` WHERE `cate`= ? ";
	public static final String SELECT_COUNT_QNA = "SELECT COUNT(`no`) FROM `km_cs_qna` where `cate`=?";
	public static final String SELECT_ARTICLE_QNA = "SELECT `cate2`, `title`, `uid`, `rdate`,`content`, `comment` FROM `km_cs_qna` WHERE `no`= ?";							
	public static final String SELECT_MAX_NO = "select max(`no`) from `km_cs_qna`";
	public static final String SELECT_LATEST_QNA = "SELECT `no`,`title`, `uid`, `rdate`, `cate` FROM `km_cs_qna` "
			                                       +"ORDER BY `no` DESC LIMIT 5";
	//cs-faq
	public static final String INSERT_ARTICLE_FAQ = "INSERT INTO `km_cs_faq` SET `title`=?, `cate`=?, `cate2`=?, `content`=?, `uid`=?, `regip`=?, `rdate`=now()";
	public static final String SELECT_ARTICLE_FAQ = "SELECT `title`, `content`, `cate`, `cate2` FROM `km_cs_faq` WHERE `no`= ?";							
	public static final String SELECT_FAQ = "SELECT `no`, `cate2`, `title`, `rdate`, `hit` from `km_cs_faq` WHERE `cate`= ? "
			                             +"ORDER BY `no` DESC ";
	public static final String SELECT_FAQ_CATE = "SELECT DISTINCT(`cate`) FROM `km_cs_faq`";
	public static final String SELECT_FAQ_CATE2 = "SELECT distinct `cate2` from `km_cs_faq` WHERE `cate`= ? ";
	public static final String SELECT_ALL_FAQ = "SELECT `no`,`title`, `rdate`, `hit`, `cate`, `cate2` from `km_cs_faq` "
												+"ORDER BY `no` DESC ";
	public static final String UPDATE_ARTICLE_FAQ = "update `km_cs_faq` set `cate`=?, `cate2`=?, `title`=?, `content`=?, `rdate`=NOW() where `no`=?";
	public static final String UPDATE_FAQ_HIT = "UPDATE `km_cs_faq` SET `hit` = `hit` + 1 WHERE `no`=?";
	public static final String DELETE_FAQ = "delete from `km_cs_faq` where `no`=?";
	
	//index
	public static final String SELECT_PRODUCTS_BY_SOLD = "SELECT * FROM `km_product` ORDER BY `sold` DESC LIMIT ?";
	public static final String SELECT_PRODUCTS_BY_HIT = "SELECT * FROM `km_product` ORDER BY `hit` DESC LIMIT ?";
	public static final String SELECT_PRODUCTS_BY_SCORE = "SELECT * FROM `km_product` ORDER BY `score` DESC LIMIT ?";
	public static final String SELECT_PRODUCTS_BY_DISCOUNT = "SELECT * FROM `km_product` ORDER BY `discount` DESC LIMIT ?";
	public static final String SELECT_PRODUCTS_BY_LATEST = "SELECT * FROM `km_product` ORDER BY `prodNo` DESC LIMIT ?";
	public static final String SELECT_TERMS = "SELECT * FROM `km_member_terms`";

	//review
	public static final String SELECT_COUNT_REVIEW_TOTAL = "SELECT COUNT(`revNo`) FROM `km_product_review` WHERE `prodNo`=?";
	public static final String SELECT_REVIEWS = "SELECT * FROM `km_product_review` WHERE `prodNo`=? ORDER BY `rdate` DESC LIMIT ?, 5";
	
	//Member
	public static final String INSERT_MEMBER	= "INSERT INTO `km_member` SET"
												+ "`uid`=?, `pass`=SHA2(?,256), `name`=?, `gender`=?,"
												+ "`hp`=?, `email`=?, `type`=?, `zip`=?,"
												+ "`addr1`=?, `addr2`=?, `regip`=?, `provLocation`=?, `rdate`=NOW()";
	public static final String INSERT_SELLER	= "INSERT INTO `km_member` SET"
												+ "`uid`=?, `pass`=SHA2(?,256), `email`=?, `type`=?,"
												+ "`zip`=?, `addr1`=?, `addr2`=?, `regip`=?,"
												+ "`provLocation`=?, `company`=?, `ceo`=?, `rdate`=NOW(),"
												+ "`bizRegNum`=?, `comRegNum`=?, `tel`=?, `fax`=?, `name`=?, `gender`=?";
	public static final String CHECK_UID		= "SELECT COUNT(`uid`) FROM `km_member` WHERE `uid`=?";

	public static final String CHECK_MEMBER_FOR_LOGIN = "select * from `km_member` where `uid`=? and `pass`=SHA2(?,256)";
	
	//Product
	public static final String INSERT_PRODUCT	="INSERT INTO `km_product` SET"
												+ "`cate1`=?, `cate2`=?, `prodName`=?, `descript`=?,"
												+ "`company`=?, `seller`=?, `price`=?, `discount`=?,"
												+ "`point`=?, `stock`=?, `delivery`=?, `ip`=?, `rdate`=NOW(),"
												+ "`status`=?, `duty`=?, `receipt`=?, `bizType`=?, `origin`=?,"
												+ "`thumb1`=?, `thumb2`=?, `thumb3`=?, `detail`=?";
	public static final String SELECT_PRODUCT 			="SELECT a.*, b.`level` FROM `km_product` AS a "
														+"JOIN `km_member` AS b ON a.`seller` = b.`uid` WHERE `prodNo`=?";
	public static final String SELECT_PRODUCTS 			="SELECT * FROM `km_product`";
	public static final String COUNT_TODAY_PRODUCTS 	="SELECT COUNT(`prodNo`) FROM `km_product` WHERE DATE(`rdate`)=CURDATE()";
	
	public static final String SELECT_PRODUCTS_BY_CATE_SOLD		="SELECT a.*, b.`level` FROM `km_product` AS a "
																+"JOIN `km_member` AS b ON a.`seller` = b.`uid` "
																+"WHERE `cate1`=? AND `cate2`=? ORDER BY `sold` DESC LIMIT ?, 10";
	public static final String SELECT_PRODUCTS_BY_CATE_LOW		="SELECT a.*, b.`level` FROM `km_product` AS a "
																+"JOIN `km_member` AS b ON a.`seller` = b.`uid` "
																+"WHERE `cate1`=? AND `cate2`=? ORDER BY `price` ASC LIMIT ?, 10";
	public static final String SELECT_PRODUCTS_BY_CATE_HIGH		="SELECT a.*, b.`level` FROM `km_product` AS a "
																+"JOIN `km_member` AS b ON a.`seller` = b.`uid` "
																+"WHERE `cate1`=? AND `cate2`=? ORDER BY `price` DESC LIMIT ?, 10";
	public static final String SELECT_PRODUCTS_BY_CATE_SCORE	="SELECT a.*, b.`level` FROM `km_product` AS a "
																+"JOIN `km_member` AS b ON a.`seller` = b.`uid` "
																+"WHERE `cate1`=? AND `cate2`=? ORDER BY `score` DESC LIMIT ?, 10";
	public static final String SELECT_PRODUCTS_BY_CATE_REVIEW	="SELECT a.*, b.`level` FROM `km_product` AS a "
																+"JOIN `km_member` AS b ON a.`seller` = b.`uid` "
																+"WHERE `cate1`=? AND `cate2`=? ORDER BY `review` DESC LIMIT ?, 10";
	public static final String SELECT_PRODUCTS_BY_CATE_LATEST	="SELECT a.*, b.`level` FROM `km_product` AS a "
																+"JOIN `km_member` AS b ON a.`seller` = b.`uid` "
																+"WHERE `cate1`=? AND `cate2`=? ORDER BY `rdate` DESC LIMIT ?, 10";
	public static final String SELECT_COUNT_PRODUCT_TOTAL 		= "SELECT COUNT(`prodNo`) FROM `km_product` WHERE `cate1`=? AND `cate2`=?";
	
	public static final String UPDATE_HIT 				="UPDATE `km_product` SET `hit` = `hit`+1 WHERE `prodNo`=?";
	public static final String SELECT_NAVCATE 	= "SELECT a.`c1Name`, b.`c2Name` "
												+ "FROM `km_product_cate1` AS a "
												+ "JOIN `km_product_cate2` AS b "
												+ "ON a.`cate1` = b.`cate1` "
												+ "WHERE b.`cate1`=? AND b.`cate2`=?";
	
	//cart
	public static final String INSERT_CART 	="INSERT INTO `km_product_cart` SET "
											+ "`uid` = ?,`prodNo`=?, `count`=?,"
											+ "`price`=?, `discount`=?, `point`=?,"
											+ "`delivery`=?, `total`=?, `rdate`=NOW()";
	public static final String SELECT_CART_PRODUCTS = "SELECT a.*,b.`prodName`, b.`descript`, b.`thumb1` "
													+ "FROM `km_product_cart` AS a JOIN `km_product` AS b "
													+ "ON a.`prodNo` = b.`prodNo` WHERE `uid`=?";
	public static final String DELETE_CART = "DELETE FROM `km_product_cart` WHERE `cartNo`=?";
	
	//order
	public static final String INSERT_ORDER 		= "INSERT INTO `km_product_order` SET `uid`=?";
	public static final String SELECT_ORDERNUM 		= "SELECT MAX(`ordNo`) FROM `km_product_order` WHERE `uid`=?";
	public static final String INSERT_ORDER_ITEM	= "INSERT INTO `km_product_order_item` SET `ordNo`=?,"
													+ "`prodNo`=?, `count`=?, `price`=?, `discount`=?,"
													+ "`point`=?, `delivery`=?, `total`=?";
	
}
