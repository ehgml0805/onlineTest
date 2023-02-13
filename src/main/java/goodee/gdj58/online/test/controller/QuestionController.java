package goodee.gdj58.online.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.test.service.QuestionService;
import goodee.gdj58.online.vo.Question;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired QuestionService questionService;
	//시험 수정
	@GetMapping("teacher/modifyQuestion")
	public String modifyQuestion(HttpSession session, int questionIdx) {
		Question questionOne=questionService.getQuestionOne(questionIdx);
		int qIdx=questionOne.getQuestionIdx();
		int tNo=questionOne.getTestNo();
		String qTitle=questionOne.getQuestionTitle();
		
		System.out.println(qIdx+"<==qIdx");
		System.out.println(tNo+"<==tNo");
		System.out.println(qTitle+"<==qTitle");
		return "teacher/modifyQuestion";
	}
	
	//시험 삭제
	@GetMapping("teacher/removeQuestion")
	public String removeQuestion(HttpSession session, @RequestParam("questionNo") int questionNo) {
		questionService.removeQuestion(questionNo);
		
		return "redirect:/teacher/testList";
	}

	//시험 입력
	/*
	 * @GetMapping("teacher/testList/addQuestion") public String
	 * addQuestion(HttpSession session) { return "teacher/testList/addQuestion"; }
	 */
	@PostMapping("teacher/addQuestion")
	public String addQuestion(HttpSession session, Question question) {
		int row=questionService.addQuestion(question);
		if(row==0) {
			System.out.println("시험 입력 실패!");
			return "redirect:/test/example/addQuestion";
		}
		log.debug("1");
		System.out.println("시험 입력 성공");
		return "teacher/testOne";
	}
	
}
