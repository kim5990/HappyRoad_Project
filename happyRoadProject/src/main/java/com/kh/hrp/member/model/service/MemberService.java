package com.kh.hrp.member.model.service;

import static com.kh.hrp.common.JDBCTemplate.close;
import static com.kh.hrp.common.JDBCTemplate.commit;
import static com.kh.hrp.common.JDBCTemplate.getConnection;
import static com.kh.hrp.common.JDBCTemplate.rollback;
import java.sql.Connection;

import javax.swing.plaf.synth.SynthOptionPaneUI;

import com.kh.hrp.member.model.dao.MemberDao;
import com.kh.hrp.member.model.vo.Member;

public class MemberService {
   
   public Member loginMember(String userId, String userPwd) {
      
      Connection conn = getConnection();
      Member m = new MemberDao().loginMember(conn, userId, userPwd);
      
      close(conn);
      return m;
   }
   
   public int insertMember(Member m) {
	   
	   Connection conn = getConnection();
	   int result = new MemberDao().insertMember(conn, m);
	   close(conn);
	   return result;
   }
   
   public Member updatePwdMember(String userId,String userPwd,String updatePwd) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePwdMember(conn, userId, userPwd, updatePwd);

		Member updateMem = null;
		if (result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, userId);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return updateMem;
	}
   
   public int deleteMember(String userId,String userPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn, userId, userPwd);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
   
   public Member updateMember(Member m) {
	   Connection conn = getConnection();
	   int result = new MemberDao().updateMember(conn, m);
	   
	   Member updateMem = null;
		if (result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
   }
   
   public int idCheck(String checkId) {
	   	Connection conn = getConnection();
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		return count;
   }
}