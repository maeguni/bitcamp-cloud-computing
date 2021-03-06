package bitcamp.pms.servlet.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bitcamp.pms.dao.BoardDao;
import bitcamp.pms.domain.Board;

@SuppressWarnings("serial")
@WebServlet("/board/update")
public class BoardUpdeteServlet extends HttpServlet{
    
 @Override
protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
     
     
     request.setCharacterEncoding("UTF-8");     
     response.setContentType("text/html;charset=UTF-8");
     PrintWriter out = response.getWriter();     
     out.println("<!DOCTYPE html>");
     out.println("<html>");
     out.println("<head>");
     out.println("<meta charset='UTF-8'>");
     out.println("<meta http-equiv='Refresh' content='4;url=list'>");
     out.println("<title>게시물 변경</title>");
     out.println("</head>");
     out.println("<body>");
     out.println("<h1>게시물 변경 결과</h1>");     
     try {
         Board board = new Board();          
         board.setTitl(request.getParameter("title"));   
         board.setCont(request.getParameter("content"));               
         board.setBno(Integer.parseInt(request.getParameter("no")));  
         System.out.println(board.toString());
         
         if(BoardDao.update(board)== 0) {
             out.println("<p>해당 게시물이 존재하지 않습니다.</p>");
                        
         } else {
             out.println("<p>변경하였습니다.</p>");
         }
    
     } catch (Exception e) {
         out.println("<p>변경 실패!</p>");
         e.printStackTrace(out);
     }
     out.println("</body>");
     out.println("</html>");
     
}      

}
