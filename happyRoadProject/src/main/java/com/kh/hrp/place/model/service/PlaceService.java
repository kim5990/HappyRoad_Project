package com.kh.hrp.place.model.service;

import static com.kh.hrp.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hrp.common.PageInfo;
import com.kh.hrp.common.model.vo.PlaceImage;
import com.kh.hrp.place.model.dao.PlaceDao;
import com.kh.hrp.place.model.vo.Place;
import com.kh.hrp.place.model.vo.PlaceSelect;
import com.kh.hrp.place.model.vo.Review;

public class PlaceService {
	
	public int selectListCount(int userNo) {
		
		Connection conn = getConnection();
		int listCount = new PlaceDao().selectListCount(conn, userNo);

		close(conn);
		return listCount;
	}
	
	public int selectSearchCount(String keyword) {
		
		Connection conn = getConnection();
		int SearchCount = new PlaceDao().selectSearchCount(conn, keyword);

		close(conn);
		return SearchCount;
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
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Place> selectSearchList(String keyword, PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Place> list = new PlaceDao().selectSearchList(conn, keyword, pi);
		
		close(conn);
		return list;
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
   
   public ArrayList<PlaceImage> selectPlaceImageList(int placeNo){
	   Connection conn = getConnection();
		ArrayList<PlaceImage> list = new PlaceDao().selectPlaceImageList(conn, placeNo);
		close(conn);
		return list;
	   
   }
   
   public ArrayList<Review> selectReviewList(int placeNo){
		Connection conn = getConnection();
		ArrayList<Review> list = new PlaceDao().selectReviewList(conn, placeNo);
		close(conn);
		return list;
	   
   }
   
   public int reviewListCount(int placeNo) {
		Connection conn = getConnection();      
		int reviewListCount = new PlaceDao().reviewListCount(conn, placeNo);
		close(conn);
		return reviewListCount;
   }
   
   public boolean checkLike(int placeNo, int userNo) {
		Connection conn = getConnection();      
		boolean isLike = new PlaceDao().checkLike(conn, placeNo, userNo);
		close(conn);
		return isLike;
   }
   
   public int placeLikeInsertController(int userNo, int placeNo) {
		Connection conn = getConnection();
		int result = new PlaceDao().placeLikeInsertController(conn, userNo, placeNo);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
   }

public ArrayList<PlaceSelect> mainSelectController() {
	Connection conn = getConnection();
	ArrayList<PlaceSelect> list = new PlaceDao().mainSelectController(conn);
	close(conn);
	return list;
}
   
}
   
   
