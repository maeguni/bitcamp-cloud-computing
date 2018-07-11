package bitcamp.pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bitcamp.pms.dao.MemberDao;
import bitcamp.pms.domain.Member;


public class MemberUpdateController  implements PageController {
    
  MemberDao memberdao;
    
    
    public MemberUpdateController(MemberDao memberdao) {      
        this.memberdao = memberdao;
    }

public String service(
            HttpServletRequest request, 
            HttpServletResponse response) throws Exception {
     
    Member member = new Member();
            member.setId(request.getParameter("id"));
            member.setEmail(request.getParameter("email"));
            member.setPassword(request.getParameter("password"));           
    
                 
            if (memberdao.update(member) == 0) {
                return "/member/updatefail.jsp";
              
            } else {
                return "redirect:list";
            }
            
}
}
     
     
         








