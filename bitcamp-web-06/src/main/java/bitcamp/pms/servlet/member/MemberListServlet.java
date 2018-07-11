package bitcamp.pms.servlet.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bitcamp.pms.dao.MemberDao;
import bitcamp.pms.domain.Member;

@SuppressWarnings("serial")
@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request, 
            HttpServletResponse response) throws ServletException, IOException {
        //Db에서 가져올 데이터의 
        HashMap<String,Object> parames = new HashMap<>();
        if (request.getParameter("page") != null&&
            request.getParameter("size") != null ) {
            int page =Integer.parseInt(request.getParameter("page"));
            int size =Integer.parseInt(request.getParameter("size"));
            parames.put("startIndex",(page - 1)*size);
            parames.put("pageSize", size);
        }
        try {
            MemberDao memberDao = 
               (MemberDao) getServletContext().getAttribute("memberDao");
            
            List<Member> list = memberDao.selectList(parames);
            request.setAttribute("list", list);
            
            request.setAttribute("view", "/member/list.jsp");
                       
        } catch (Exception e) {
            request.setAttribute("error", e);
                      
        }
    }
    

}










