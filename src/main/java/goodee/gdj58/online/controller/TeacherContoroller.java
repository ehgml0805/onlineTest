package goodee.gdj58.online.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Teacher;

@Controller
public class TeacherContoroller {
	@Autowired TeacherService teacherService;
	@Autowired IdService idService;
	
	//강사 회원가입
	@GetMapping("/teacher/addTeacher")
	public String addTeacher(HttpSession session) {
		Teacher loginTeacher=(Teacher)session.getAttribute("loginTeacher");
		if(loginTeacher!=null) { //로그인 된 상태
			return "redirect:/employee/loginEmp";
			//redirect: 서버가 클라이언트에게 요청할 주소를 응답결과로 전달하는 것을 의미 즉 두번째 URL로 redirect 처리
		}
		return "teacher/addTeacher";// forword: 첫번째 URL로 요청 이런느낌
	}
	@PostMapping("/teacher/addTeacher")
	public String addTeacher(HttpSession session, Teacher teacher,Model model ) {
		//이미 로그인 된 상태라면 다른 곳으로 보내기
		Teacher loginTeacher=(Teacher)session.getAttribute("loginTeacher");
		if(loginTeacher!=null) {  //로그인 된 상태
			return "redirect:employee/loginEmp";
		}
		String idCheck=idService.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			model.addAttribute("errorMsg", "중복된 아이디 입니다.");
			System.out.println("회원가입 실패(아이디 중복): 컨트롤러");
			return "redirect:/student/addStudent";
			//되돌아 오면 중복 된 것
		}
		
		int row= teacherService.addTeacher(loginTeacher);
		if(row==0) {
			System.out.println("회원가입 실패: 컨트롤러");
			return "student/addStudent";
		}
		System.out.println("회원가입 성공: 컨트롤러");
		return "redirect:/student/home";
		}
}
