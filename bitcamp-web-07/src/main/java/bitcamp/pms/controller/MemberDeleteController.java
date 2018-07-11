package bitcamp.pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bitcamp.pms.dao.MemberDao;


public class MemberDeleteController implements PageController {
    
    MemberDao memberdao;
    
    
    public MemberDeleteController(MemberDao memberdao) {      
        this.memberdao = memberdao;
    }


  public String service (
            HttpServletRequest request, 
            HttpServletResponse response) throws Exception {       
      
                 
            memberdao.delete(request.getParameter("id"));
            return"redirect:list";         
             
        }
    }
    
    








