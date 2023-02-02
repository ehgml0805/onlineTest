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
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;

@Controller
public class StudentController {
	//DI = new 연산자 역할
	@Autowired StudentService studentService;
	@Autowired IdService idService;
	//관리자가
	// 삭제
	@GetMapping("/employee/student/removeStudent")
	public String removeStudent(HttpSession session, @RequestParam("studentNo") int studentNo) {
		studentService.removeStudent(studentNo);
		return "redirect:/employee/student/studentList"; // 리스트로 리다이렉트
	}
	// 입력
	@GetMapping("/employee/student/addStudent")
	public String addStudent(HttpSession session) {
		return "employee/addStudent"; // forword
	}
	@PostMapping("/employee/student/addStudent")
	public String addStudent(HttpSession session, Student student, Model model) {
		String idCheck=idService.getIdCheck(student.getStudentId());
		if(idCheck!= null) {
			model.addAttribute("errorMsg", "중복된 아이디 입니다.");
			System.out.println("중복된 아이디: 컨트롤러");
			return "redirect:/employee/student/addStudent";
			//되돌아 오면 중복 된 것
		}
		int row = studentService.addStudent(student);
		// row == 1 이면 입력성공
		if(row == 0) {
			model.addAttribute("errorMsg", "회원가입 실패!");
			return "employee/addStudent";
		}
		System.out.println("회원가입 성공: 컨트롤러");
		
		return "redirect:/employee/student/studentList";
	}
	// 리스트
	@GetMapping("/employee/student/studentList")
	public String studentList(HttpSession session, Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
							, @RequestParam(value="searchWord", defaultValue="") String searchWord) { 
							// int currentPage = reuqest.getParamenter("currentPage");
		int selectCount=studentService.selectCount(searchWord);
		int lastPage=selectCount/rowPerPage;
		if(selectCount/rowPerPage !=0) {
			lastPage=lastPage+1;
		}
		int startPage=((currentPage-1)*rowPerPage)*rowPerPage+1;
		int endPage=startPage+rowPerPage-1;
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		List<Student> sList = studentService.getStudentList(currentPage, rowPerPage, searchWord);
		// request.setAttribute("list", list);
		model.addAttribute("sList", sList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("endPage", endPage);
		return "employee/studentList"; //파일 위치인듯?
	}
	
	//학생 로그인-관리자 로그인과 같은 화면 쓸 거
	@GetMapping("/student/loginStudent") //내가 주소창에 사용할 주소
	public String loginStudent(HttpSession session) {
		return "employee/loginEmp"; //주소창 주소를 입력하면 보낼곳
	}
	@PostMapping("/student/loginStudent")
	public String loginStudent(HttpSession session, Student student) {
		//service 호출
		Student resultStudent = studentService.loginStudent(student);
		//성공시 세션에 저장
		session.setAttribute("loginStudent", resultStudent);
		
		return "redirect:/loginEmp";
	}
	
	/*
	 * //학생 회원가입
	 * 
	 * @GetMapping("/student/addStudent") public String addStudent(HttpSession
	 * session) { Student
	 * loginStudent=(Student)session.getAttribute("loginStudent");
	 * if(loginStudent!=null) { //로그인 된 상태 return "redirect:/employee/loginEmp";
	 * //redirect: 서버가 클라이언트에게 요청할 주소를 응답결과로 전달하는 것을 의미 즉 두번째 URL로 redirect 처리 }
	 * return "student/addStudent";// forword: 첫번째 URL로 요청 이런느낌 }
	 * 
	 * @PostMapping("/student/addStudent") public String addStudent(HttpSession
	 * session, Student student,Model model ) { //이미 로그인 된 상태라면 다른 곳으로 보내기 Student
	 * loginStudent=(Student)session.getAttribute("loginStudent");
	 * if(loginStudent!=null) { //로그인 된 상태 return "redirect:employee/loginEmp"; }
	 * String idCheck=idService.getIdCheck(student.getStudentId()); if(idCheck !=
	 * null) { model.addAttribute("errorMsg", "중복된 아이디 입니다.");
	 * System.out.println("회원가입 실패(아이디 중복): 컨트롤러"); return
	 * "redirect:/student/addStudent"; //되돌아 오면 중복 된 것 }
	 * 
	 * int row= studentService.addStudent(student); if(row==0) {
	 * System.out.println("회원가입 실패: 컨트롤러"); return "student/addStudent"; }
	 * System.out.println("회원가입 성공: 컨트롤러"); return "redirect:/student/home"; }
	 * 
	 */
}
