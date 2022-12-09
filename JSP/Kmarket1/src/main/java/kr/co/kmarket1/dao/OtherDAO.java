package kr.co.kmarket1.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket1.db.DBHelper;
import kr.co.kmarket1.db.Sql;
import kr.co.kmarket1.vo.TermsVO;

public class OtherDAO extends DBHelper{

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static OtherDAO instance = new OtherDAO();
	public static OtherDAO getInstance() {
		return instance;
	}
	private OtherDAO() {}
	
	
	public TermsVO selectTerms(String type) {
		TermsVO terms = null;
		try {
			logger.debug("selectTerms Start...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_TERMS);
			if(rs.next()) {
				terms = new TermsVO();
				if(type.equals("1")) { terms.setTerms(rs.getString(1)); }
				else if(type.equals("2")) { terms.setTerms(rs.getString(5)); }
				terms.setPrivacy(rs.getString(2));
				terms.setLocation(rs.getString(3));
				terms.setFinance(rs.getString(4));
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return terms;
	}
	
}
