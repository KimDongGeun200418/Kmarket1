package kr.co.kmarket1.dao;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket1.db.DBHelper;
import kr.co.kmarket1.db.Sql;
import kr.co.kmarket1.vo.CsArticleVO;

public class ArticleDAO extends DBHelper{

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	//notice
	public void insertArticleNotice(CsArticleVO article) {
		
		try {
			logger.info("insertArticleNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_ARTICLE_NOTICE);
			psmt.setString(1, article.getTitle());
			psmt.setString(2, article.getCate());
			psmt.setString(3, article.getContent());
			psmt.setString(4, article.getUid());
			psmt.setString(5, article.getRegip());
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	public List<CsArticleVO> selectNotice(String cate, int start){
		
		List<CsArticleVO> articles = new ArrayList<>();
		
		try {
			logger.info("selectNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_NOTICE);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO article = new CsArticleVO();
				article.setNo(rs.getString(1));
				article.setTitle(rs.getString(2));
				article.setRdate(rs.getString(3));
				article.setHit(rs.getString(4));
				
				articles.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	public List<CsArticleVO> selectAllNotice(int start){
		
		List<CsArticleVO> articles = new ArrayList<>();
		
		try {
			logger.info("selectAllNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ALL_NOTICE);
			psmt.setInt(1, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO article = new CsArticleVO();
				article.setNo(rs.getString(1));
				article.setTitle(rs.getString(2));
				article.setRdate(rs.getString(3));
				article.setHit(rs.getString(4));
				article.setCate(rs.getString(5));
				
				articles.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	public CsArticleVO selectArticleNotice(String no){
		
		 CsArticleVO article = null;
		
		try {
			logger.info("selectArticleNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLE_NOTICE);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				article = new CsArticleVO();
				article.setTitle(rs.getString(1));
				article.setRdate(rs.getString(2).substring(0, 10));
				article.setContent(rs.getString(3));
				article.setCate(rs.getString(4));
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return article;
	}
	
	public List<CsArticleVO> selectLatestNotice() {
		List<CsArticleVO> notices = new ArrayList<>();
		
		try {
			logger.info("selectLatestNotice...");
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_LATEST_NOTICE);
			
			while(rs.next()) {
				CsArticleVO ln = new CsArticleVO();
				ln.setNo(rs.getString(1));
				ln.setTitle(rs.getString(2));
				ln.setRdate(rs.getString(3));
				ln.setCate(rs.getString(4));
				
				notices.add(ln);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return notices;
	}
	
	public void updateArticleNotice(String no, String cate, String title, String content) {
		
		try {
			logger.info("updateArticleNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_NOTICE);
			psmt.setString(1, cate);
			psmt.setString(2, title);
			psmt.setString(3, content);
			psmt.setString(4, no);
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public void updateNoticeHit(String no) {
		try {
			logger.info("updateNoticeHit...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_NOTICE_HIT);
			psmt.setString(1, no);
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public int deleteNotice(String no) {
		
		int result = 0;
		
		try {
			logger.info("deleteNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.DELETE_NOTICE);
			psmt.setString(1, no);
			result = psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	//notice 게시물 카운트
	public int selectCountNotice(String cate) {
		
		int total = 0;
		
		try {
			logger.info("selectCountNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_NOTICE);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return total;
	}
	public int selectCountNoticeAll() {
		
		int total = 0;
		
		try {
			logger.info("selectCountNoticeAll...");
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_COUNT_NOTICE_ALL);
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return total;
	}
	
	//qna
	public void insertArticleQna(CsArticleVO article) {
		
		try {
			logger.info("insertArticleQna...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_ARTICLE_QNA);
			psmt.setString(1, article.getTitle());
			psmt.setString(2, article.getCate());
			psmt.setString(3, article.getCate2());
			psmt.setString(4, article.getContent());
			psmt.setString(5, article.getUid());
			psmt.setString(6, article.getRegip());
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public void insertCommentQna(String comment, String no) {
		
		try {
			logger.info("insertCommentQna...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_COMMENT_QNA);
			psmt.setString(1, comment);
			psmt.setString(2, no);
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public List<CsArticleVO> selectQna(String cate, int start){
		
		List<CsArticleVO> articles = new ArrayList<>();
		
		try {
			logger.info("selectQna...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_QNA);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO article = new CsArticleVO();
				article.setNo(rs.getString(1));
				article.setCate2(rs.getString(2));
				article.setTitle(rs.getString(3));
				article.setUid(rs.getString(4));
				article.setRdate(rs.getString(5));
				article.setComment(rs.getString(6));
				
				articles.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	public List<CsArticleVO> selectAllQna(int start){
		
		List<CsArticleVO> articles = new ArrayList<>();
		
		try {
			logger.info("selectAllQna...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ALL_QNA);
			psmt.setInt(1, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO article = new CsArticleVO();
				article.setNo(rs.getString(1));
				article.setCate(rs.getString(2));
				article.setCate2(rs.getString(3));
				article.setTitle(rs.getString(4));
				article.setUid(rs.getString(5));
				article.setRdate(rs.getString(6));
				article.setComment(rs.getString(7));
				
				articles.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	public List<CsArticleVO> selectQnaCate2(String cate){
		
		List<CsArticleVO> category = new ArrayList<>();
		
		try {
			logger.info("selectQnacate2...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_QNA_CATE2);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO ct = new CsArticleVO();
				ct.setCate2(rs.getString(1));
				
				category.add(ct);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return category;
	}
	
	public List<CsArticleVO> selectQnaCate(){
		
		List<CsArticleVO> category = new ArrayList<>();
		
		try {
			logger.info("selectQnacate...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_QNA_CATE);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO ct = new CsArticleVO();
				ct.setCate(rs.getString(1));
				
				category.add(ct);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return category;
	}
	
	public CsArticleVO selectArticleQna(String no){
		
		 CsArticleVO article = null;
		
		try {
			logger.info("selectArticleQna...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLE_QNA);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				article = new CsArticleVO();
				article.setCate2(rs.getString(1));
				article.setTitle(rs.getString(2));
				article.setUid(rs.getString(3));
				article.setRdate(rs.getString(4).substring(0, 10));
				article.setContent(rs.getString(5));
				article.setComment(rs.getString(6));
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return article;
	}
	
	public List<CsArticleVO> selectLatestQna() {
		List<CsArticleVO> qnas = new ArrayList<>();
		
		try {
			logger.info("selectLatestQna...");
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_LATEST_QNA);
			
			while(rs.next()) {
				CsArticleVO lq = new CsArticleVO();
				lq.setNo(rs.getString(1));
				lq.setTitle(rs.getString(2));
				lq.setUid(rs.getString(3));
				lq.setRdate(rs.getString(4));
				lq.setCate(rs.getString(5));
				
				qnas.add(lq);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return qnas;
	}
	
	//qna 게시물 카운트
	public int selectCountQna(String cate) {
		
		int total = 0;
		
		try {
			logger.info("selectCountQna...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_QNA);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return total;
	}
	
	//faq
	public void insertArticleFaq(CsArticleVO article) {
		
		try {
			logger.info("insertArticleFaq...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_ARTICLE_FAQ);
			psmt.setString(1, article.getTitle());
			psmt.setString(2, article.getCate());
			psmt.setString(3, article.getCate2());
			psmt.setString(4, article.getContent());
			psmt.setString(5, article.getUid());
			psmt.setString(6, article.getRegip());
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	public List<CsArticleVO> selectFaq(String cate){
		
		List<CsArticleVO> articles = new ArrayList<>();
		
		try {
			logger.info("selectFaq...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_FAQ);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO article = new CsArticleVO();
				article.setNo(rs.getString(1));
				article.setCate2(rs.getString(2));
				article.setTitle(rs.getString(3));
				article.setRdate(rs.getString(4));
				article.setHit(rs.getString(5));
				
				articles.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	public List<CsArticleVO> selectFaqCate2(String cate){
		
		List<CsArticleVO> category = new ArrayList<>();
		
		try {
			logger.info("selectcate2...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_FAQ_CATE2);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO ct = new CsArticleVO();
				ct.setCate2(rs.getString(1));
				
				category.add(ct);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return category;
	}
	public List<CsArticleVO> selectFaqCate(){
		
		List<CsArticleVO> category = new ArrayList<>();
		
		try {
			logger.info("selectcate...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_FAQ_CATE);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO ct = new CsArticleVO();
				ct.setCate(rs.getString(1));
				
				category.add(ct);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return category;
	}
	public CsArticleVO selectArticleFaq(String no){
		
		 CsArticleVO article = null;
		
		try {
			logger.info("selectArticleFaq...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLE_FAQ);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				article = new CsArticleVO();
				article.setTitle(rs.getString(1));
				article.setContent(rs.getString(2));
				article.setCate(rs.getString(3));
				article.setCate2(rs.getString(4));
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return article;
	}
	
	public List<CsArticleVO> selectAllFaq(){
		
		List<CsArticleVO> articles = new ArrayList<>();
		
		try {
			logger.info("selectAllFaq...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ALL_FAQ);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO article = new CsArticleVO();
				article.setNo(rs.getString(1));
				article.setTitle(rs.getString(2));
				article.setRdate(rs.getString(3));
				article.setHit(rs.getString(4));
				article.setCate(rs.getString(5));
				article.setCate2(rs.getString(6));
				
				articles.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	public void updateArticleFaq(String no, String cate, String cate2, String title, String content) {
		
		try {
			logger.info("updateArticleFaq...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_FAQ);
			psmt.setString(1, cate);
			psmt.setString(2, cate2);
			psmt.setString(3, title);
			psmt.setString(4, content);
			psmt.setString(5, no);
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public void updateFaqHit(String no) {
		try {
			logger.info("updateFaqHit...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_FAQ_HIT);
			psmt.setString(1, no);
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public int deleteFaq(String no) {
		
		int result = 0;
		
		try {
			logger.info("deleteFaq...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.DELETE_FAQ);
			psmt.setString(1, no);
			result = psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return result;
	}

}
