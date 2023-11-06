package com.kh.hrp.place.model.service;

import static com.kh.hrp.common.JDBCTemplate.close;
import static com.kh.hrp.common.JDBCTemplate.commit;
import static com.kh.hrp.common.JDBCTemplate.getConnection;
import static com.kh.hrp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.hrp.common.PageInfo;
import com.kh.hrp.common.model.vo.PlaceImage;
import com.kh.hrp.place.model.dao.PlaceDao;
import com.kh.hrp.place.model.vo.Place;

public class PlaceService {
   public int selectListCount(int userNo) {
      Connection conn = getConnection();
      
      int listCount = new PlaceDao().selectListCount(conn, userNo);
      
      close(conn);
      return listCount;
   }


   public ArrayList<Place> placeLikeSelectList(int userNo, PageInfo pi) {
      Connection conn = getConnection();
      ArrayList<Place> placelist = new PlaceDao().placeLikeSelectList(conn, userNo, pi);
      close(conn);
      return placelist;
   }


   public int placeLikeDeleteController(int userNo, int placeNo) {
      Connection conn = getConnection();
      int result = new PlaceDao().placeLikeDeleteController(conn, userNo, placeNo);
      if(result > 0) {
         commit(conn);
      }else {
         rollback(conn);
      }
      close(conn);
      return result;
   }
   
   
   public Place increaseCount(int placeNo) {
	   Connection conn = getConnection();
		PlaceDao pDao = new PlaceDao();
		
		// 1) 조회수 1올리기
		int result = pDao.increaseCount(conn, placeNo);
		Place p = null;
		
		if (result > 0) {	
			commit(conn);
			// 2) detail 객체 불러오기
			p = pDao.selectPlace(conn, placeNo);
		} else {
			rollback(conn);
		}
		close(conn);
		return p;
   }
   
   
}