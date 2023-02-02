package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Teacher;
@Controller
public class TeacherController {
	
	@Autowired TeacherService teacherService;
	@Autowired IdService idService;
	
	// 삭제
	@GetMapping("/employee/teacher/removeTeacher")
	public String removeTeacher(HttpSession session, @RequestParam("teacherNo") int teacherNo) {
		
		teacherService.removeTeacher(teacherNo);
		return "redirect:/employee/teacher/teacherList"; // 리스트로 리다이렉트
	}
	
	//입력
	@GetMapping("/employee/teacher/addTeacher")
	public String addTeacher(HttpSession session) {
		
		return "employee/addTeacher"; // forword
	}
	@PostMapping("/employee/teacher/addTeacher")
	public String addTeacher(HttpSession session, Teacher teacher, Model model) {
		String idCheck=idService.getIdCheck(teacher.getTeacherId());
		if(idCheck!= null) {
			model.addAttribute("errorMsg", "중복된 아이디 입니다.");
			System.out.println("중복된 아이디: 컨트롤러");
			return "redirect:/employee/teacher/addTeacher";
			//되돌아 오면 중복 된 것
		}
		int row = teacherService.addTeacher(teacher);
		// row == 1 이면 입력성공
		if(row == 0) {
			model.addAttribute("errorMsg", "회원가입 실패!");
			return "employee/addTeacher";
		}
		System.out.println("회원가입 성공: 컨트롤러");
		
		return "redirect:/employee/teacher/teacherList";
	}
	
	// 리스트
	@GetMapping("/employee/teacher/teacherList")
	public String teacherList(HttpSession session, Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
							, @RequestParam(value="searchWord", defaultValue="") String searchWord) { 
							// int currentPage = reuqest.getParamenter("currentPage");

		int selectCount=teacherService.selectCount(searchWord);
		int lastPage=selectCount/rowPerPage;
		if(selectCount/rowPerPage !=0) {
			lastPage=lastPage+1;
		}
		int startPage=((currentPage-1)*rowPerPage)*rowPerPage+1;
		int endPage=startPage+rowPerPage-1;
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		List<Teacher> tList = teacherService.getTeacherList(currentPage, rowPerPage, searchWord);
		// request.setAttribute("list", list);
		model.addAttribute("tList", tList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("endPage", endPage);
		return "employee/teacherList";
	}
}
