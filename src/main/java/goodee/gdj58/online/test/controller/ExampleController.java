package goodee.gdj58.online.test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.test.service.ExampleService;
import goodee.gdj58.online.vo.Example;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ExampleController {
	@Autowired ExampleService exampleService;
	//보기 수정
	@GetMapping("test/question/modifyExample")
	public String modifyExample(HttpSession session) {
		return "test/example/modifyExamlpe";
	}
	@PostMapping("test/question/modifyExample")
	public String modifyExample(HttpSession session, Example example) {
		
		int row=exampleService.modifyExample(example);
		if(row==0) {
			System.out.println("보기 수정 실패!");
			return "test/example/modifyExamlpe";
		}
		log.debug("1");
		System.out.println("보기 수정 성공");
		return "redirect:/test/question/questionOne";
	}
	
	//보기 삭제
	@GetMapping("test/question/removeExample")
	public String removeExample(HttpSession session, @RequestParam("exampleNo") int exampleNo) {
		exampleService.removeExample(exampleNo);
		
		return "redirect:/test/question/questionOne";
	}
	
	//보기 입력
	@GetMapping("test/question/addExample")
	public String addExample(HttpSession session) {
		return "test/example/addExamlpe";
	}
	@PostMapping("test/question/addExample")
	public String addExample(HttpSession session, Example example) {
		int row=exampleService.addExample(example);
		if(row==0) {
			System.out.println("보기 입력 실패!");
			return "test/example/addExample";
		}
		log.debug("1");
		System.out.println("보기 입력 성공");
		return "redirect:/test/question/questionOne";
	}
	
	//보기 목록 출력
	@GetMapping("test/question/questionOne")
	public String exampleList(HttpSession session, Model model
								, @RequestParam(value = "currentPage", defaultValue="1") int currentPage
								, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
						//@RequestParam("가져올 데이터의 이름")[데이터타입][가져온 데이터를 담을 변수]
		List<Example> exList= exampleService.getExampleList(currentPage, rowPerPage);
		model.addAttribute("exList", exList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		
		return "test/question/questionOne";
	}
}
