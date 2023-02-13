package goodee.gdj58.online.test.controller;

import java.util.Iterator;
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
import goodee.gdj58.online.test.service.TestService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	@Autowired TestService testService;
	@Autowired ExampleService exampleService;
	//tsetOne 상세보기
	@GetMapping("teacher/testOne")
	public String testOne(HttpSession session, Model model, int testNo, Example example) {
		
		//test 상세보기
		List<Map<String, Object>> tQList=testService.getTestOne(testNo);
		model.addAttribute("tQList", tQList);
		model.addAttribute("testNo", testNo);
		/*
		 * for(Map<String, Object> qm: tQList) { int qIdx=(int) qm.get("qIdx");
		 * System.out.println(qIdx+"<---qIdx");
		 * 
		 * List<Example> eList=exampleService.getExampleList(qIdx);
		 * //null,null,null,null 뜬다 왜...? System.out.println(eList+"<---eList");
		 * model.addAttribute("eList", eList); }
		 */
		//testOne에서 질문 목록 출력
		for(Map<String, Object> qm: tQList) { 
			int qIdx=(int) qm.get("qIdx");
			System.out.println(qIdx+"<---qIdx");
			List<Map<String, Object>> eList=exampleService.getExampleList(qIdx);
			if(eList.isEmpty()) { //보기가 없을때 
				String meg="보기가 없습니다.";
				System.out.println("보기가 없습니다.");
				model.getAttribute(meg);
			}else {
			System.out.println(eList+"<---eList");
			model.addAttribute("eList", eList); 
			}
		}
			
		return "teacher/testOne";
	}
		
	//강사가 test 입력
	@PostMapping("teacher/addTest")
	public String addTest(HttpSession session, Test test, Model model) {
		int row=testService.addTest(test);
		if(row == 0) {
			model.addAttribute("errorMsg", "시험추가 실패!");
			return "teacher/addTest";
		}
		//System.out.println("시험추가 성공: 컨트롤러");
		return "redirect:/teacher/testList"; // sendRedirect , CM -> C
	}
	
	//학생이 보는 testList
	@GetMapping("student/testList")
	public String testListBystudent (HttpSession session, Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage  
							, @RequestParam(value="searchWord", defaultValue="") String searchWord) { 
		
		log.debug(searchWord+"<-- 검색 값");
	
		int selectCount=testService.selectCount(searchWord);
		int lastPage=selectCount/rowPerPage;
		if(selectCount/rowPerPage !=0) {
			lastPage=lastPage+1;
		}
		int startPage=((currentPage-1)*rowPerPage)*rowPerPage+1;
		int endPage=startPage+rowPerPage-1;
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		
		List<Test> tList= testService.getTestList(currentPage, rowPerPage, searchWord);
		model.addAttribute("tList", tList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("endPage", endPage);
		return "student/testList";
	}
	
	//강사가 보는 testList
	@GetMapping("teacher/testList")
	public String testList (HttpSession session, Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage  
							, @RequestParam(value="searchWord", defaultValue="") String searchWord) { 
		
		log.debug(searchWord+"<-- 검색 값");
	
		int selectCount=testService.selectCount(searchWord);
		int lastPage=selectCount/rowPerPage;
		if(selectCount/rowPerPage !=0) {
			lastPage=lastPage+1;
		}
		int startPage=((currentPage-1)*rowPerPage)*rowPerPage+1;
		int endPage=startPage+rowPerPage-1;
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		
		List<Test> tList= testService.getTestList(currentPage, rowPerPage, searchWord);
		model.addAttribute("tList", tList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("endPage", endPage);
		return "teacher/testList";
	}
}
