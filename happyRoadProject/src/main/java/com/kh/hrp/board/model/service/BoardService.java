package com.kh.hrp.board.model.service;

import static com.kh.hrp.common.JDBCTemplate.close;
import static com.kh.hrp.common.JDBCTemplate.commit;
import static com.kh.hrp.common.JDBCTemplate.getConnection;
import static com.kh.hrp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.hrp.board.model.dao.BoardDao;
import com.kh.hrp.board.model.vo.Board;
import com.kh.hrp.common.PageInfo;

public class BoardService {

   public int selectListCount() {   // 게시물 총 갯수 가져오기
      
      Connection conn = getConnection();
      
      int listCount = new BoardDao().selectListCount(conn);
      
      close(conn);
      return listCount;
   }
   
   public ArrayList<Board> selectList(PageInfo pi){ // 게시물 리스트 가져오기
      
      Connection conn = getConnection();
      ArrayList<Board> list = new BoardDao().selectList(conn, pi);
      
      close(conn);
      
      return list;
   }
   
   public Board increaseCount(int boardNo) { // 카운터 올려주고 게시물 조회
      
      Connection conn = getConnection();

      int result = new BoardDao().increaseCount(conn, boardNo);
      
      Board b = null;
      if (result > 0) {
         commit(conn);
         //정보조회
         b = new BoardDao().selectBoard(conn, boardNo);
      } else {
         rollback(conn);
      }
      
      close(conn);
      
      return b;
   }
   
   
   public Board selectBoard(int boardNo) {
      Connection conn = getConnection();
      Board b = new BoardDao().selectBoard(conn, boardNo);
      
      close(conn);
      return b;
   }
   
   public int insertBoard(Board b, int userNo) { // 게시물 추가
      Connection conn = getConnection();
      
      int result = new BoardDao().insertBoard(conn, b, userNo);
      
      if (result > 0) {
         commit(conn);
      } else {
         rollback(conn);
      }
      
      close(conn);
      
      return result;
   }
   
   public int updateBoard(Board b) { // 게시글 수정
	   Connection conn = getConnection();
		
	   int result = new BoardDao().updateBoard(conn, b);

	   return result;
   }
   
   
   
}