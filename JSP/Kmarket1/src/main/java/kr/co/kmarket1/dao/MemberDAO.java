package kr.co.kmarket1.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket1.db.DBHelper;
import kr.co.kmarket1.db.Sql;
import kr.co.kmarket1.vo.MemberVO;
import kr.co.kmarket1.vo.PointVO;

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
	
	public MemberVO selectMemberForOrder(String uid) {
		MemberVO member = null;
		try {
			logger.debug("selectMemberForOrder Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.CHECK_MEMBER_FOR_ORDER);
			psmt.setString(1, uid);
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
	//insertPoint
	public void insertPoint(int ordNo) {
		try {
			logger.debug("insertPoint Start...");
			conn = getConnection();
			PointVO point = new PointVO();
			
			//거래내역가져오기
			psmt = conn.prepareStatement(Sql.SELECT_ORDER_FOR_POINT);
			psmt.setInt(1, ordNo);
			rs = psmt.executeQuery();
			if(rs.next()) {
				point.setUid(rs.getString(1));
				point.setOrdNo(ordNo);
				point.setPoint(rs.getInt(2) - rs.getInt(3));
				point.setPointDate(rs.getString(4));
			}
			
			//포인트내역추가
			psmt = conn.prepareStatement(Sql.INSERT_POINT);
			psmt.setString(1, point.getUid());
			psmt.setInt(2, ordNo);
			psmt.setInt(3, point.getPoint());
			psmt.setString(4, point.getPointDate());
			psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	};
	//updatePoint
		public void updatePoint(String uid) {
			try {
				logger.debug("updatePoint Start...");
				conn = getConnection();
				int point = 0;
				//포인트내역 가져오기
				psmt = conn.prepareStatement(Sql.SELECT_POINTS);
				psmt.setString(1, uid);
				rs = psmt.executeQuery();
				while(rs.next()) {
					point += rs.getInt(1);
				}
				//멤버포인트 업데이트
				psmt = conn.prepareStatement(Sql.UPDATE_POINT);
				psmt.setInt(1, point);
				psmt.setString(2, uid);
				psmt.executeUpdate();
				
				close();
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
		};
	
}
