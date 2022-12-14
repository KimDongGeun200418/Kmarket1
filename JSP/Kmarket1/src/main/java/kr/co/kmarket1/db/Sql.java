package kr.co.kmarket1.db;

public class Sql {
	
	public static final String SELECT_NOTICE = "SELECT `no`,`title`, `rdate` from `km_cs_notice` WHERE `cate`= ? "
														+"ORDER BY `rdate` DESC "
														+"LIMIT ?, 10";
	public static final String SELECT_ALL_NOTICE = "SELECT `no`,`title`, `rdate` from `km_cs_notice` "
												+"ORDER BY `rdate` DESC "
												+"LIMIT ?, 10";
	public static final String SELECT_ARTICLE_NOTICE = "SELECT `title`,`rdate`,`content` FROM `km_cs_notice` WHERE `no`= ?";
	
	public static final String SELECT_ARTICLES_FAQ = "SELECT `title` from `km_cs_faq` WHERE `cate`= ? and `cate2`=? "
													+"ORDER BY `rdate` DESC";	
	public static final String SELECT_ARTICLES_QNA = "SELECT `title`,`uid`,`rdate` from `km_cs_qna`	WHERE `cate`= ? and `cate2`=? "
													+"ORDER BY `rdate` DESC "
													+"LIMIT ?, 10";

	public static final String SELECT_COUNT_NOTICE_ALL = "SELECT COUNT(`title`) FROM `km_cs_notice`";
	public static final String SELECT_COUNT_NOTICE = "SELECT COUNT(`title`) FROM `km_cs_notice` where `cate`=?";
	public static final String SELECT_COUNT_QNA = "SELECT COUNT(`title`) FROM `km_cs_qna` where `cate`=?";

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
												+ "`company`=?, `price`=?, `discount`=?, `point`=?,"
												+"`stock`=?, `delivery`=?, `status`=?, `duty`=?,"
												+ "`receipt`=?, `bizType`=?, `origin`=?"
												+ ",`seller`='test1', `thumb1`='1', `thumb2`='2', `thumb3`='3', `detail`='4', `ip`='5', `rdate`=NOW()";

	public static final String SELECT_PRODUCTS ="SELECT * FROM `km_product`";
}
