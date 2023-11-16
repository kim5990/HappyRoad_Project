package com.kh.hrp.board.model.dao;

import static com.kh.hrp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.hrp.board.model.vo.Board;
import com.kh.hrp.board.model.vo.BoardComment;
import com.kh.hrp.common.PageInfo;
import com.kh.hrp.place.model.vo.PlaceSelect;

public class BoardDao {
   
   private Properties prop = new Properties();
   
   public BoardDao() {
      String filePath = BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath();
      
      try {
         prop.loadFromXML(new FileInputStream(filePath));
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
   
   public int selectListCount(Connection conn) { // 게시물 총 갯수
      
      int listCount = 0;
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectListCount");
      
      try {
         pstmt = conn.prepareStatement(sql);
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            listCount = rset.getInt("count");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return listCount;
   }
   
   public int selectCommentCount(Connection conn, int boardNo) { // 댓글 총 갯수
	   int CommentlistCount = 0;
	      
       PreparedStatement pstmt = null;
       ResultSet rset = null;
      
       String sql = prop.getProperty("selectCommentCount");
       
       try {
           pstmt = conn.prepareStatement(sql);
           
           pstmt.setInt(1, boardNo);
           
           rset = pstmt.executeQuery();
           
           if(rset.next()) {
        	   CommentlistCount = rset.getInt("count");
           }
        } catch (SQLException e) {
           e.printStackTrace();
        } finally {
           close(rset);
           close(pstmt);
        }
       return CommentlistCount;
   }
   
   public ArrayList<Board> selectList(Connection conn, PageInfo pi){ // 보여질 게시물
      
      ArrayList<Board> list = new ArrayList<>();
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectList");
      
      try {
         pstmt = conn.prepareStatement(sql);
         // *currentPage : 현재 페이지(즉, 사용자가 요청한 페이지) *boardLimit : 한 페이지내에 보여질 게시글 최대갯수(단위)
         int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Board(
                  rset.getInt("BOARD_NO"),
                  rset.getString("USER_NAME"),
                  rset.getString("BOARD_TITLE"),
                  rset.getString("BOARD_CONTENT"),
                  rset.getInt("BOARD_COUNT"),
                  rset.getString("BOARD_ENROLL_DATE")
                  
                  ));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      
      return list;
   }
   
  
   
   public int increaseCount(Connection conn, int boardNo) { // 게시물 조회수 올려주고 디테일 페이지 가져오기
      int result = 0;
      
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("increaseCount");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, boardNo);
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
   }
   
   public Board selectBoard(Connection conn, int boardNo) { // 디테일 보여주기
      
      ResultSet rset = null;
      Board b = null;
      
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("selectBoard");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, boardNo);
         
         rset = pstmt.executeQuery();
         if(rset.next()) {
            b = new Board(
                  rset.getInt("BOARD_NO"),
                  rset.getString("USER_NAME"),
                  rset.getString("BOARD_TITLE"),
                  rset.getString("BOARD_CONTENT"),
                  rset.getInt("BOARD_COUNT"),
                  rset.getString("BOARD_ENROLL_DATE")
               );
            
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(conn);
      }
      return b;
   }
   
   
   public int insertBoard(Connection conn, Board b, int userNo) { // 게시물 추가
      int result = 0;
      
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertBoard");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, userNo);
         pstmt.setString(2, b.getBoardTitle());
         pstmt.setString(3, b.getBoardContent());
  
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      
      return result;
   }
   
   public int updateBoard(Connection conn, Board b) { // 게시글 수정
	   int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
   }
   
   public int deleteBoard(Connection conn, int boardNo) { // 게시글 삭제
   		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
	   
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
   }
   
   public ArrayList<BoardComment> selectBoardCommentList(Connection conn, PageInfo pi, int boardNo){ // 찐 
	   ArrayList<BoardComment> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardCommentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			// pstmt.setInt(1, boardNo);
			 // *currentPage : 현재 페이지(즉, 사용자가 요청한 페이지) *boardLimit : 한 페이지내에 보여질 게시글 최대갯수(단위)
	           int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	           int endRow = startRow + pi.getBoardLimit() - 1;
	           
	           pstmt.setInt(1, boardNo);
	           pstmt.setInt(2, startRow);
	           pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardComment(
							rset.getInt("COMMENT_NO"),
							rset.getString("BOARD_NO"),
							rset.getString("COMMENT_USER"),
							rset.getString("COMMENT_CONTENT"),
							rset.getString("COMMENT_NEWDATE"),
							rset.getString("USER_NAME")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
   }
   

   
   public int insertComment(Connection conn, BoardComment c) {
	   int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCommentNo());
			pstmt.setString(2, c.getCommentContent());
			pstmt.setString(3, c.getCommentUser());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	   
   }
   
   public int deleteComment(Connection conn, int cno) {
	   int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
   }
   
   public int SearchBoardCount(Connection conn, String searchcontent) { // 검색어 총 죄회수
	   
	   int bsearchCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("SearchBoardCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchcontent);
			pstmt.setString(1, "%" + searchcontent + "%");
			
			rset = pstmt.executeQuery();
		
			if (rset.next()) {
				bsearchCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bsearchCount;
   }
   
   public ArrayList<Board> SearchBoardList(Connection conn, String searchcontent, PageInfo pi){ // 검색어 리스트
	   
	   ArrayList<Board> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("SearchBoardList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, "%" + searchcontent + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(
		                  rset.getInt("BOARD_NO"),
		                  rset.getString("USER_NAME"),
		                  rset.getString("BOARD_TITLE"),
		                  rset.getString("BOARD_CONTENT"),
		                  rset.getInt("BOARD_COUNT"),
		                  rset.getString("BOARD_ENROLL_DATE")
		                  
		                  ));
 				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
   }
   
}