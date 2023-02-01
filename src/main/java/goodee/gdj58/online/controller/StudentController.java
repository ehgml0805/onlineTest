package goodee.gdj58.online.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Student;

@Controller
public class StudentController {
	//DI = new 연산자 역할
	@Autowired StudentService studentService;
	@Autowired IdService idService;
	
	//학생 로그인-관리자 로그인과 같은 화면 쓸 거
	@GetMapping("/student/loginStudent") //내가 주소창에 사용할 주소
	public String loginStudent(HttpSession session) {
		//이미 로그인 된 상태라면 다른 곳으로 보내기
		Student loginStudent=(Student)session.getAttribute("loginStudent");
		if(loginStudent!=null) {
			return "redirect:/";
		}
		return "employee/loginEmp"; //주소창 주소를 입력하면 보낼곳
	}
	@PostMapping("/student/loginStudent")
	public String loginStudent(HttpSession session, Student student) {
		//service 호출
		Student resultStudent = studentService.loginStudent(student);
		if(resultStudent == null) { // 로그인 실패하면 
			System.out.println("로그인 실패: 컨트롤러");
			return "redirect:/employee/loginEmp";
		}
		
		//성공시 세션에 저장
		session.setAttribute("loginStudent", resultStudent);
		
		return "redirect://student/home";
	}
	
	//학생 회원가입
	@GetMapping("/student/addStudent")
	public String addStudent(HttpSession session) {
		Student loginStudent=(Student)session.getAttribute("loginStudent");
		if(loginStudent!=null) { //로그인 된 상태
			return "redirect:/employee/loginEmp";
			//redirect: 서버가 클라이언트에게 요청할 주소를 응답결과로 전달하는 것을 의미 즉 두번째 URL로 redirect 처리
		}
		return "student/addStudent";// forword: 첫번째 URL로 요청 이런느낌
	}
	@PostMapping("/student/addStudent")
	public String addStudent(HttpSession session, Student student,Model model ) {
		//이미 로그인 된 상태라면 다른 곳으로 보내기
		Student loginStudent=(Student)session.getAttribute("loginStudent");
		if(loginStudent!=null) {  //로그인 된 상태
			return "redirect:employee/loginEmp";
		}
		String idCheck=idService.getIdCheck(student.getStudentId());
		if(idCheck != null) {
			model.addAttribute("errorMsg", "중복된 아이디 입니다.");
			System.out.println("회원가입 실패(아이디 중복): 컨트롤러");
			return "redirect:/student/addStudent";
			//되돌아 오면 중복 된 것
		}
		
		int row= studentService.addStudent(student);
		if(row==0) {
			System.out.println("회원가입 실패: 컨트롤러");
			return "student/addStudent";
		}
		System.out.println("회원가입 성공: 컨트롤러");
		return "redirect:/student/home";
	}
	
	
}
