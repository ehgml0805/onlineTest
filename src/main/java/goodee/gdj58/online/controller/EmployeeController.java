package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	@Autowired IdService idService;
	
	//pw수정 모달
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session
								, @RequestParam(value = "oldPw") String oldPw
								, @RequestParam(value = "newPw") String newPw) {
		//로그인 후 호출가능
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		
		employeeService.updateEmployeePw(loginEmp.getEmpNo(), oldPw, newPw);
		return "redirect:/loginEmp";
	}
	
	// 홈
	@GetMapping("/homeEmp") //요청 주소
	public String loginEmp(HttpSession session) {
		return "employee/homeEmp";
	}
	
	//로그인
	@PostMapping("/loginEmp")
	public String loginEmp(HttpSession session, Employee emp) {
		Employee resultEmp = employeeService.login(emp);
		session.setAttribute("loginEmp", resultEmp);
		System.out.println(resultEmp+"<==세션 저장 결과 값");
		return "redirect:/homeEmp";
	}
	
	//로그아웃
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/homeEmp";
	}
	
	/*
	 *  로그인 후에 사용가능한 기능
	 */
	
	// 삭제
	@GetMapping("/employee/removeEmp")
	public String removeEmp(HttpSession session, @RequestParam("empNo") int empNo) {
		employeeService.removeEmployee(empNo);
		return "redirect:/employee/empList"; // 리스트로 리다이렉트
	}
	
	
	// 입력
	@GetMapping("/employee/addEmp")
	public String addEmp(HttpSession session) {
		return "employee/addEmp"; // forword
	}
	@PostMapping("/employee/addEmp")
	public String addEmp(HttpSession session, Employee employee,Model model) {
		String idCheck=idService.getIdCheck(employee.getEmpId());
		if(idCheck!= null) {
			model.addAttribute("errorMsg", "중복된 아이디 입니다.");
			System.out.println("중복된 아이디: 컨트롤러");
			return "redirect:/employee/addEmp";
			//되돌아 오면 중복 된 것
		}
		
		int row = employeeService.addEmployee(employee);
		// row == 1 이면 입력성공
		if(row == 0) {
			model.addAttribute("errorMsg", "회원가입 실패!");
			return "employee/addEmp";
		}
		System.out.println("회원추가 성공: 컨트롤러");
		return "redirect:/employee/empList"; // sendRedirect , CM -> C
	}
	
	// 리스트
	@GetMapping("/employee/empList")
	public String empList(HttpSession session, Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage  
							, @RequestParam(value="searchWord", defaultValue="") String searchWord) { 
							// int currentPage = reuqest.getParamenter("currentPage");
		
		log.debug(searchWord+"<-- 검색 값");
		
		int selectCount=employeeService.selectCount(searchWord);
		int lastPage=selectCount/rowPerPage;
		if(selectCount/rowPerPage !=0) {
			lastPage=lastPage+1;
		}
		int startPage=((currentPage-1)*rowPerPage)*rowPerPage+1;
		int endPage=startPage+rowPerPage-1;
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		log.debug("");
		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage, searchWord);
		// request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("endPage", endPage);
		return "employee/empList";
	}
}
