package goodee.gdj58.online.test.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.test.service.ExampleService;
import goodee.gdj58.online.test.service.QuestionService;
import goodee.gdj58.online.test.service.TestService;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	@Autowired
	TestService testService;
	@Autowired
	QuestionService questionService;
	@Autowired
	ExampleService exampleService;

	// test삭제
	@GetMapping("teacher/removeTest")
	public String removeTest(HttpSession session, @RequestParam("testNo") int testNo) {
		Teacher loginTeacher = (Teacher) session.getAttribute("loginTeacher");
		int teacherNo = loginTeacher.getTeacherNo();
		testService.deleteTest(testNo, teacherNo);
		return "redirect:/teacher/testList";

	}

	// test수정
	@PostMapping("teacher/modefyTest")
	public String modefyTest(HttpSession session, @RequestParam(value = "testTitle") String testTitle,
			@RequestParam(value = "testEndDate") String testEndDate, @RequestParam(value = "testNo") int testNo) {
		Teacher loginTeacher = (Teacher) session.getAttribute("loginTeacher");
		int teacherNo = loginTeacher.getTeacherNo();

		testService.modefyTest(testNo, teacherNo, testTitle, testEndDate);
		return "redirect:/teacher/testList";
	}

	// 강사가 tsetOne 상세보기
	@GetMapping("teacher/testOne")
	public String testOne(HttpSession session, Model model,
							@RequestParam(value = "testNo") int testNo ) {
		
		//테스트 상세보기 
		List<Map<String, Object>> testOne =testService.getTestOne(testNo); 
		model.addAttribute("testOne", testOne);
		
		List<Map<String, Object>> list = questionService.getTestQEList(testNo);
		//Test test = teacherService.getTestTitle(testNo); // 테스트 정보
		//List<Map<String, Object>> answer = teacherService.getTestAnswer(testNo);
		//model.addAttribute("test",test);
		model.addAttribute("list",list);
		//model.addAttribute("answer",answer);
		log.debug("\u001B[31m" + list.size()/4 + "	<= 문제 개수");
		int questionCount = list.size()/4;
		model.addAttribute("questionCount", questionCount);

		return "teacher/testOne";
	}

	/*
	 * @GetMapping("teacher/testOne") public String testOne(HttpSession session,
	 * Model model, int testNo) { //테스트 상세보기 List<Map<String, Object>> testOne
	 * =testService.getTestOne(testNo); model.addAttribute("testOne", testOne);
	 * 
	 * //해당 테스트의 문제 리스트 List<Map<String, Object>> QList
	 * =questionService.getTestQList(testNo); model.addAttribute("QList", QList);
	 * //testOne에서 질문 목록 출력 for(Map<String, Object> qm: QList) { int
	 * questionNo=(int) qm.get("qNo"); model.addAttribute("qNo", questionNo);
	 * 
	 * String questionTitle=(String) qm.get("qTitle"); model.addAttribute("qTitle",
	 * questionTitle); int questionNo=(int) qm.get("qNo"); model.addAttribute("qNo",
	 * questionNo);
	 * 
	 * //헤당 테스트의 해당 문제의 보기 리스트 List<Example> EList
	 * =exampleService.getTestEList(questionNo);
	 * 
	 * if(EList.isEmpty()) { //보기가 없을때
	 * //System.out.println(questionIdx+"문제의 보기가 없습니다.");
	 * 
	 * }else {
	 * 
	 * model.addAttribute("EList", EList); } }
	 * 
	 * return "teacher/testOne"; }
	 */
	
	// 강사가 test 입력
	@PostMapping("teacher/addTest")
	public String addTest(HttpSession session, Test test, Model model) {
		int row = testService.addTest(test);
		if (row == 0) {
			model.addAttribute("errorMsg", "시험추가 실패!");
			return "teacher/addTest";
		}
		// System.out.println("시험추가 성공: 컨트롤러");
		return "redirect:/teacher/testList"; // sendRedirect , CM -> C
	}

	// 학생이 보는 testList
	@GetMapping("student/testList")
	public String testListBystudent(HttpSession session, Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord) {

		log.debug(searchWord + "<-- 검색 값");

		int selectCount = testService.selectCount(searchWord);
		int lastPage = selectCount / rowPerPage;
		if (selectCount / rowPerPage != 0) {
			lastPage = lastPage + 1;
		}
		int startPage = ((currentPage - 1) / rowPerPage) * rowPerPage + 1;
		int endPage = startPage + rowPerPage - 1;
		if (endPage > lastPage) {
			endPage = lastPage;
		}
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String nowTime1 = sdf1.format(now);
		System.out.println(nowTime1);
		
		List<Test> stList = testService.getTestListByStudent(currentPage, rowPerPage, searchWord);
		model.addAttribute("stList", stList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("nowTime1", nowTime1);

		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("endPage", endPage);
		return "student/testList";
	}

	// 강사가 보는 testList
	@GetMapping("teacher/testList")
	public String testList(HttpSession session, Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord) {

		log.debug(searchWord + "<-- 검색 값");

		int selectCount = testService.selectCount(searchWord);
		int lastPage = selectCount / rowPerPage;
		if (selectCount / rowPerPage != 0) {
			lastPage = lastPage + 1;
		}
		// int startPage=((currentPage-1)*rowPerPage)*rowPerPage+1;
		int startPage = ((currentPage - 1) / rowPerPage) * rowPerPage + 1;
		int endPage = startPage + rowPerPage - 1;
		if (endPage > lastPage) {
			endPage = lastPage;
		}

		List<Test> tList = testService.getTestList(currentPage, rowPerPage, searchWord);
		model.addAttribute("tList", tList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);

		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("endPage", endPage);
		Teacher loginTeacher = (Teacher) session.getAttribute("loginTeacher");
		int teacherNo = loginTeacher.getTeacherNo();
		model.addAttribute("teacherNo", teacherNo);
		return "teacher/testList";
	}
}
