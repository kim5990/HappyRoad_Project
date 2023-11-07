package com.kh.hrp.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.hrp.common.JDBCTemplate.*;
import com.kh.hrp.member.model.vo.Member;

public class MemberDao {
   private Properties prop = new Properties();
   
   public MemberDao() {
      String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
      
      try {
         prop.loadFromXML(new FileInputStream(filePath));
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
   
   public Member loginMember(Connection conn, String userId, String userPwd) {
      Member m = null;
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("loginMember");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, userId);
         pstmt.setString(2, userPwd);
         
         rset = pstmt.executeQuery();
         
         if (rset.next()) {
            m = new Member(
                  rset.getInt("user_no"),
                  rset.getString("user_id"),
                  rset.getString("user_pwd"),
                  rset.getString("user_email"),
                  rset.getString("user_name"),
                  rset.getString("user_phone"),
                  rset.getString("user_level"),
                  rset.getDate("user_enroll_date"),
                  rset.getDate("user_modify_date"),
                  rset.getString("user_status")
                  );
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return m;
   }
   public int insertMember(Connection conn, Member m) {
	   int result = 0;
	   
	   PreparedStatement pstmt = null;
	   String sql = prop.getProperty("insertMember");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, m.getUserId());
		pstmt.setString(2, m.getUserPwd());
		pstmt.setString(3, m.getUserName());
		pstmt.setString(4, m.getUserEmail());
		pstmt.setString(5, m.getUserPhone());
		
		result = pstmt.executeUpdate();
	   } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	   } finally {
		close(pstmt);
	   }
	   
	   return result;
   }
   
   public int updatePwdMember(Connection conn, String userId,String userPwd,String updatePwd) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
		
	}
   
   public Member selectMember(Connection conn, String userId) {
		
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				m = new Member(
						rset.getInt("user_no"),
						rset.getString("user_id"),
						rset.getString("user_pwd"),
						rset.getString("user_email"),
						rset.getString("user_name"),
						rset.getString("user_phone"),
						rset.getString("user_level"),
						rset.getDate("user_enroll_date"),
						rset.getDate("user_modify_date"),
						rset.getString("user_status")
					);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
   
   public int deleteMember(Connection conn, String userId,String userPwd) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
   
}