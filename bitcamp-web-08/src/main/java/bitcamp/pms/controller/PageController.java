package bitcamp.pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface PageController {
    // 프론트 컨트롤(caller)와 페이지 컨트롤(callee) 사이의 호출 규칙
     String service(HttpServletRequest request,HttpServletResponse response)throws Exception;

}
