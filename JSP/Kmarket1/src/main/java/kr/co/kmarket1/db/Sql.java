package kr.co.kmarket1.db;

public class Sql {

	public static final String SELECT_ARTICLES = "SELECT `title`, `rdate` from `km_cs_article`	WHERE `cate`= ?";
}
