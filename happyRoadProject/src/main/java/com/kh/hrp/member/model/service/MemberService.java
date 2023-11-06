package com.kh.hrp.member.model.service;

import static com.kh.hrp.common.JDBCTemplate.close;
import static com.kh.hrp.common.JDBCTemplate.commit;
import static com.kh.hrp.common.JDBCTemplate.getConnection;
import static com.kh.hrp.common.JDBCTemplate.rollback;
import java.sql.Connection;

import com.kh.hrp.member.model.dao.MemberDao;
import com.kh.hrp.member.model.vo.Member;

public class MemberService {
   
   public Member loginMember(String userId, String userPwd) {
      
      Connection conn = getConnection();
      Member m = new MemberDao().loginMember(conn, userId, userPwd);
      
      close(conn);
      return m;
   }
}