package bitcamp.pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bitcamp.pms.annotation.RequestMapping;
import bitcamp.pms.dao.MemberDao;


public class MemberDeleteController {
    
    MemberDao memberdao;
    
    
    public MemberDeleteController(MemberDao memberdao) {      
        this.memberdao = memberdao;
    }

@RequestMapping
  public String delete (
            HttpServletRequest request, 
            HttpServletResponse response) throws Exception {       
      
                 
            memberdao.delete(request.getParameter("id"));
            return"redirect:list";         
             
        }
    }
    
    








