package com.kh.hrp.place.model.dao;

import static com.kh.hrp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;


import com.kh.hrp.common.model.vo.PlaceImage;
import com.kh.hrp.common.PageInfo;
import com.kh.hrp.place.model.vo.Place;

public class PlaceDao {
   private Properties prop = new Properties();
   public PlaceDao() {
      String filePath = PlaceDao.class.getResource("/db/sql/place-mapper.xml").getPath();
      
      try {
         prop.loadFromXML(new FileInputStream(filePath));
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
   
   public int selectListCount(Connection conn, int userNo) {
      int listCount = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectListCount");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, userNo);
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            listCount = rset.getInt("count");
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return listCount;
   }

   public ArrayList<Place> placeLikeSelectList(Connection conn, int userNo, PageInfo pi) {
      ArrayList<Place>  placeList = new ArrayList<>();
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("placeLikeSelectList");
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         System.out.println(startRow);
         System.out.println(endRow);
         pstmt.setInt(1, userNo);
         pstmt.setInt(2, startRow);
         pstmt.setInt(3, endRow);
         
         rset = pstmt.executeQuery();
      while(rset.next()) {
         placeList.add(new Place(rset.getInt("PLACE_NO"), 
                           rset.getString("PLACE_TITLE"), 
                           rset.getString("PLACE_CONTENT_POINT"), 
                           rset.getString("PLACE_CONTENT_DETAIL"),  
                           rset.getString("PLACE_IMAGE_PATH"))
               );
      }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      return placeList;
   }

   public int placeLikeDeleteController(Connection conn, int userNo, int placeNo) {
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("placeLikeDeleteController");
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, userNo);
         pstmt.setInt(2, placeNo);
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      
      return result;
   }
   
   public Place selectPlace(Connection conn, int placeNo) {   
      ResultSet rset = null;
      Place p = null;
      
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("selectPlace");
      
      try {
         pstmt = conn.prepareStatement(sql); // 미완성
         pstmt.setInt(1, placeNo);
         
         rset = pstmt.executeQuery();
         if(rset.next()) {
            p = new Place(
                     rset.getInt("PLACE_NO"),
                     rset.getString("PLACE_TITLE"),
                     rset.getString("PLACE_CONTENT_POINT"),
                     rset.getString("PLACE_CONTENT_DETAIL"),
                     rset.getString("PLACE_THEMA"),
                     rset.getString("PLACE_ADDRESS"),
                     rset.getString("PLACE_HOMEPAGE"),
                     rset.getString("PLACE_CONTACT"),
                     rset.getString("PLACE_TIME"),
                     rset.getDate("PLACE_START"),   
                     rset.getDate("PLACE_END")
                  );
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return p;
      
   }
   
   
   public ArrayList<PlaceImage> selectPlaceImage(Connection conn, int placeNo){
      ArrayList<PlaceImage> list = new ArrayList<>();
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectPlaceImage");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, boardNo);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            Attachment at = new Attachment();
            at.setChangeName(rset.getString("change_name"));
            at.setFilePath(rset.getString("file_path"));
            
            list.add(at);
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