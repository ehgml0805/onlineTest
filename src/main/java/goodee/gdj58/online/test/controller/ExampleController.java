package goodee.gdj58.online.test.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@PostMapping("teacher/addExample")
	public String addExample(HttpSession session, Example example
							, @RequestParam(value = "testNo") int testNo
							, @RequestParam(value = "questionNo") int questionNo
							, @RequestParam(value = "exampleIdx")int[] exampleIdx
							, @RequestParam(value = "exampleTitle") String[] exampleTitle
							, @RequestParam(value = "answerOx") String[] answerOx) {
		
		System.out.println(testNo);
		System.out.println(questionNo);
		System.out.println(exampleIdx);
		System.out.println(exampleTitle);
		System.out.println(answerOx);
		
	
		int row = 0;
        for (int i = 0; i<4; i++) {
        	
			 Example e= new Example();
			 e.setQuestionNo(questionNo);
			 e.setExampleIdx(exampleIdx[i]);
			 e.setExampleTitle(exampleTitle[i]);
			 e.setAnswerOx(answerOx[i]);
			 //row=exampleService.addExample(example);
			 row+=exampleService.addExample(example);
        }
		 
		 if(row!=4) {
		 System.out.println("보기 입력 실패!"); return
		 "redirect:/teacher/testOne?testNo="+testNo+""; }
		 System.out.println("보기 입력 성공");
		 
		return "redirect:/teacher/testOne?testNo="+testNo+"";
	}
	
}
