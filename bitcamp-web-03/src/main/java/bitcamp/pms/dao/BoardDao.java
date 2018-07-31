package bitcamp.pms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bitcamp.pms.domain.Board;

public class BoardDao {
   
    public static void inset(Board board)throws Exception{
        
        Class.forName("com.mysql.jdbc.Driver");
        try (
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://13.209.64.30:3306/studydb",
                    "study", "1111");
            PreparedStatement stmt = con.prepareStatement(
                "insert into pms2_board(titl,cont,cdt) values(?,?,now())");) {                
             stmt.setString(1,  board.getTitl());
             stmt.setString(2,  board.getCont());                                
             stmt.executeUpdate();
        }      
    }
    
    public static int delete(int bno)throws Exception{
        
        Class.forName("com.mysql.jdbc.Driver");
        try (
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://13.209.64.30:3306/studydb",
                    "study", "1111");
            PreparedStatement stmt = con.prepareStatement(
               "delete from pms2_board where bno=?");){
            
            stmt.setInt(1,bno);
            
            return stmt.executeUpdate();
        }         
        
    }    
    
    public static List<Board> selectList() throws Exception{        
        Class.forName("com.mysql.jdbc.Driver");
        try (
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://13.209.64.30:3306/studydb",
                    "study", "1111");
            PreparedStatement stmt = con.prepareStatement(
                "select bno,titl,cdt from pms2_board");
            ResultSet rs = stmt.executeQuery();) {
            
            ArrayList<Board> list =new ArrayList<>();
            while (rs.next()) {
                Board board = new Board();               
                board.setBno(rs.getInt("bno"));
                board.setTitl(rs.getString("titl")); 
                board.setCdt(rs.getDate("cdt"));
                list.add(board);
            }     
           return list;
        }   
        
    
}    
    public static int update(Board board)throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        try (
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://13.209.64.30:3306/studydb",
                    "study", "1111");
            PreparedStatement stmt = con.prepareStatement(
                "update pms2_board set titl=?, cont=?, cdt=now() where bno=?");) {
            
            stmt.setString(1, board.getTitl());
            stmt.setString(2, board.getCont());
            stmt.setInt(3, board.getBno());
            
                     
        return stmt.executeUpdate();
          
        
    }        
    }
        

    public static Board view(int bno)throws Exception{
        
        Class.forName("com.mysql.jdbc.Driver");
        try (
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://13.209.64.30:3306/studydb",
                    "study", "1111");
            PreparedStatement stmt = con.prepareStatement(
                "select bno,titl,cont,cdt from pms2_board where bno=?");) {
            
             stmt.setInt(1,bno);
             
             
             try(ResultSet rs =stmt.executeQuery();){
                 if(!rs.next()) {
                     return null;
                                      
                 }
                 Board board = new Board();
                 board.setTitl(rs.getString("titl"));
                 board.setCont(rs.getString("cont"));
                 board.setCdt(rs.getDate("cdt"));
                 board.setBno(rs.getInt("bno"));
                 return board;
             }
        
        
 }

}
}
