package kr.co.kmarket1.db;

public class Sql {
	
	public static final String SELECT_ARTICLES_NOTICE = "SELECT `title`, `rdate` from `km_cs_notice` WHERE `cate`= ? "
														+"ORDER BY `rdate` DESC "
														+"LIMIT ?, 10";
	public static final String SELECT_ARTICLES_FAQ = "SELECT `title` from `km_cs_faq` WHERE `cate`= ? and `cate2`=? "
													+"ORDER BY `rdate` DESC";	
	public static final String SELECT_ARTICLES_QNA = "SELECT `title`,`uid`,`rdate` from `km_cs_qna`	WHERE `cate`= ? and `cate2`=? "
													+"ORDER BY `rdate` DESC "
													+"LIMIT ?, 10";

	public static final String SELECT_COUNT_TOTAL_NOTICE = "SELECT COUNT(`title`) FROM `km_cs_notice` where `cate`=?";
	public static final String SELECT_COUNT_TOTAL_QNA = "SELECT COUNT(`title`) FROM `km_cs_qna` where `cate`=?";

}
