/*package bitcamp.pms.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bitcamp.pms.dao.MemberDao;
import bitcamp.pms.domain.Member;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
     MemberService memberService;


    @RequestMapping("list")
    public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "3") int size,
            Model model) throws Exception {

        if (page < 1)
            page = 1;
        if (size < 1 || size > 20)
            size = 3;
        // DB에서 가져올 데이터의 페이지 정보
     
        List<Member> list = memberService.list(page,size);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("totalPage",memberService.getTotalpage(size));

        return "member/list";

    }

    @GetMapping("form")
    public void from() {
        // 리턴값이 보이드면 현재 URL 를 기준으로 패스를 그래로 리턴

    }

    @PostMapping("add")
    public String add(Member member) {

        memberService.insert(member);
        return "redirect:list";
        
    }
    @RequestMapping("delete")
    public String delete(String id) throws Exception {
        
        memberService.delete(id);
        return "redirect:list";
       
    }
    
    @RequestMapping("view/{id}")
    public String view(@PathVariable String id , Model model) throws Exception {

                  
        Member member = memberService.get(id);     
        model.addAttribute("member", member);
        return "member/view";
    }
    
    @RequestMapping("update")
    public String update(Member member) throws Exception {
             
        if (memberService.update(member) == 0) {
            return "member/updatefail";
        } else {
            return "redirect:list";
        }
    }
    

}
*/

package bitcamp.pms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bitcamp.pms.dao.MemberDao;
import bitcamp.pms.domain.Member;
import bitcamp.pms.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    MemberService memberService;
    @Autowired
    MemberDao memberDao;

    // 더이상 인터페이스를 쓰지않기 때문에 매핑사용해서 이 메서드를 쓴다는 것을 알려줌
    @RequestMapping("list")
    public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "3") int size,
            Model model) throws Exception {

        if (page < 1) {
            page = 1;
        }
        if (size < 1 || size > 20) {
            size = 3;
        }

        List<Member> list = memberService.list(page, size);

        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("totalPage", memberService.getTotalPage(size));

        return "member/list";

    }

    @GetMapping("form")
    public void form() {
        // 리턴값이 void면 현재 path를 그대로 리턴한다.
    }

    @PostMapping("add")
    public String add(Member member) throws Exception {

        memberService.insert(member);
        return "redirect:list";
    }

    @RequestMapping("delete")
    public String delete(String id) throws Exception {

        memberService.delete(id);
        return "redirect:list";
    }

    @RequestMapping("update")
    public String update(Member member) throws Exception {

        if (memberService.update(member) == 0) {
            return "member/updatefail";
        } else {
            return "redirect:list";
        }
    }

    @RequestMapping("view/{id}")
    public String view(@PathVariable String id, Model model) throws Exception {

        Member member = memberService.get(id);
        model.addAttribute("member", member);

        return "member/view";
    }
}