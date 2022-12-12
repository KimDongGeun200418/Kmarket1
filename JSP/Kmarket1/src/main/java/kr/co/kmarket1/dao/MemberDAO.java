package kr.co.kmarket1.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket1.db.DBHelper;
import kr.co.kmarket1.db.Sql;
import kr.co.kmarket1.vo.MemberVO;

public class MemberDAO extends DBHelper{
Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	public void insertMember(MemberVO member) {
		
		try {
			logger.debug("insertMember Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_MEMBER);
			psmt.setString(1, member.getUid());
			psmt.setString(2, member.getPass());
			psmt.setString(3, member.getName());
			psmt.setInt(4, member.getGender());
			psmt.setString(5, member.getHp());
			psmt.setString(6, member.getEmail());
			psmt.setInt(7, member.getType());
			psmt.setString(8, member.getZip());
			psmt.setString(9, member.getAddr1());
			psmt.setString(10, member.getAddr2());
			psmt.setString(11, member.getRegip());
			psmt.setInt(12, member.getProvLocation());
			psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
			
	};
	
}
