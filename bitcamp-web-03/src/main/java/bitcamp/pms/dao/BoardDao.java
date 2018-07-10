package bitcamp.pms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

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

}