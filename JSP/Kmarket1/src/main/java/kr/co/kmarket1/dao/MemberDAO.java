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
	
	public void insertSeller(MemberVO member) {
		
		try {
			logger.debug("insertSeller Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_SELLER);
			psmt.setString(1, member.getUid());
			psmt.setString(2, member.getPass());
			psmt.setString(3, member.getEmail());
			psmt.setInt(4, member.getType());
			psmt.setString(5, member.getZip());
			psmt.setString(6, member.getAddr1());
			psmt.setString(7, member.getAddr2());
			psmt.setString(8, member.getRegip());
			psmt.setInt(9, member.getProvLocation());
			psmt.setString(10, member.getCompany());
			psmt.setString(11, member.getCeo());
			psmt.setString(12, member.getBizRegNum());
			psmt.setString(13, member.getComRegNum());
			psmt.setString(14, member.getTel());
			psmt.setString(15, member.getFax());
			psmt.setString(16, member.getName());
			psmt.setInt(17, member.getGender());
			psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
			
	};
	
	public int checkUid(String uid) {
		int result = 0;
		try {
			logger.debug("checkUid Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.CHECK_UID);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	};
	
	public MemberVO selectMemberForLogin(String uid, String pass) {
		MemberVO member = null;
		try {
			logger.debug("selectUserForLogin Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.CHECK_MEMBER_FOR_LOGIN);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			if(rs.next()) {
				member = new MemberVO();
				member.setUid(rs.getString(1));
				member.setPass(rs.getString(2));
				member.setName(rs.getString(3));
				member.setGender(rs.getInt(4));
				member.setHp(rs.getString(5));
				member.setEmail(rs.getString(6));
				member.setType(rs.getInt(7));
				member.setPoint(rs.getInt(8));
				member.setLevel(rs.getInt(9));
				member.setZip(rs.getString(10));
				member.setAddr1(rs.getString(11));
				member.setAddr2(rs.getString(12));
				member.setCompany(rs.getString(13));
				member.setCeo(rs.getString(14));
				member.setBizRegNum(rs.getString(15));
				member.setComRegNum(rs.getString(16));
				member.setTel(rs.getString(17));
				member.setManager(rs.getString(18));
				member.setManagerHp(rs.getString(19));
				member.setFax(rs.getString(20));
				member.setRegip(rs.getString(21));
				member.setWdate(rs.getString(22));
				member.setRdate(rs.getString(23));
				member.setProvLocation(rs.getString(24));
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return member;
	}
	
}
