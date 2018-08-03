package bitcamp.servlet.fileservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet("/files")
public class FilieServlet extends HttpServlet {
    
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
          
         //업로드 파일을 외장 하드에 저장하는 역할을 수행
         DiskFileItemFactory factory = new DiskFileItemFactory();

         // 멀티파트 데이터를 파싱한다.
         // 업로드된 파일은 위에서 설정한 factory를 이용하여 다룬다               
         ServletFileUpload upload = new ServletFileUpload(factory);

         // 클라인언트가 보낸 데이터를 분석한다.
         try
         List<FileItem> items = upload.parseRequest(request);
         
         
         
         
         
         
         
    }  
    
    

}
