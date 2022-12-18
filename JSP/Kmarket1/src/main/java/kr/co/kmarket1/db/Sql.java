package kr.co.kmarket1.db;

public class Sql {
	//Cs
	public static final String SELECT_NOTICE = "SELECT `no`,`title`, `rdate` from `km_cs_notice` WHERE `cate`= ? "
											+"ORDER BY `no` DESC "
											+"LIMIT ?, 10";
	public static final String SELECT_ALL_NOTICE = "SELECT `no`,`title`, `rdate` from `km_cs_notice` "
												+"ORDER BY `no` DESC "
												+"LIMIT ?, 10";
	public static final String SELECT_ARTICLE_NOTICE = "SELECT `title`,`rdate`,`content` FROM `km_cs_notice` WHERE `no`= ?";
	public static final String SELECT_COUNT_NOTICE_ALL = "SELECT COUNT(`no`) FROM `km_cs_notice`";
	public static final String SELECT_COUNT_NOTICE = "SELECT COUNT(`no`) FROM `km_cs_notice` where `cate`=?";
	public static final String SELECT_LATEST_NOTICE = "SELECT `no`,`title`,`rdate`, `cate` FROM `km_cs_notice` "
												   +"ORDER BY `no` DESC LIMIT 5";
	
	public static final String SELECT_QNA = "SELECT `no`, `cate2`, `title`, `uid`, `rdate`, `comment` from `km_cs_qna` WHERE `cate`= ? "
											+"ORDER BY `no` DESC "
											+"LIMIT ?, 10";
	public static final String SELECT_COUNT_QNA = "SELECT COUNT(`no`) FROM `km_cs_qna` where `cate`=?";
	public static final String SELECT_ARTICLE_QNA = "SELECT `cate2`, `title`, `uid`, `rdate`,`content` FROM `km_cs_qna` WHERE `no`= ?";							
	public static final String SELECT_MAX_NO = "select max(`no`) from `km_cs_qna`";
	public static final String SELECT_LATEST_QNA = "SELECT `no`,`title`, `uid`, `rdate`, `cate` FROM `km_cs_qna` "
			                                       +"ORDER BY `no` DESC LIMIT 5";
	
	public static final String INSERT_ARTICLE = "INSERT INTO `km_cs_qna` SET `title`=?, `cate`=?, `cate2`=?, `content`=?, `uid`=?, `regip`=?, `rdate`=now()";
	
	public static final String SELECT_ARTICLE_FAQ = "SELECT `title`, `content` FROM `km_cs_faq` WHERE `no`= ?";							
											
	public static final String SELECT_FAQ = "SELECT `no`, `cate2`, `title` from `km_cs_faq` WHERE `cate`= ? "
			                             +"ORDER BY `no` DESC ";
	public static final String SELECT_FAQ_CATE = "SELECT distinct `cate2` from `km_cs_faq` WHERE `cate`= ? ";
			
											
	
	
	public static final String SELECT_TERMS = "SELECT * FROM `km_member_terms`";

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
	public static final String SELECT_PRODUCT 			="SELECT * FROM `km_product` WHERE `prodNo`=?";
	public static final String SELECT_PRODUCTS 			="SELECT * FROM `km_product`";
	public static final String COUNT_TODAY_PRODUCTS 	="SELECT COUNT(`prodNo`) FROM `km_product` WHERE DATE(`rdate`)=CURDATE()";
	public static final String SELECT_PRODUCTS_BY_CATE 	="SELECT * FROM `km_product` WHERE `cate1`=? AND `cate2`=?";

}
