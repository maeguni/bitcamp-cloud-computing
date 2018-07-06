package bitcamp.pms.servlet.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import bitcamp.pms.dao.MemberDao;
//
public class ContextLoaderListener 
     implements ServletContextListener{
    
    
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("ContextLoaderListener 실행!");
        
       MemberDao MemberDao = new MemberDao)(               
            MmeberDao memberDao = new MemberDao(
               "jdbc:mysql://13.125.81.120:3306/studydb",
               "study", "1111");              
               
               
               )
        
    
    
    
}
}
