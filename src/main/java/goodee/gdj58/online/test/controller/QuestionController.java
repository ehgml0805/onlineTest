package goodee.gdj58.online.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String modifyQuestion(HttpSession session,Model model ,int questionNo) {
		Question questionOne=questionService.getQuestionOne(questionNo);
		//int qNo=questionOne.getQuestionNo();
		int qIdx=questionOne.getQuestionIdx();
		int tNo=questionOne.getTestNo();
		String qTitle=questionOne.getQuestionTitle();
		
		model.addAttribute("qNo", questionNo);
		model.addAttribute("qIdx", qIdx);
		model.addAttribute("tNo", tNo);
		model.addAttribute("qIdxqTitle", qTitle);
		
		/*
		 * System.out.println(qIdx+"<==qIdx"); System.out.println(tNo+"<==tNo");
		 * System.out.println(qTitle+"<==qTitle");
		 */
		return "teacher/modifyQuestion";
	}
	@PostMapping("teacher/modifyQuestion")
	public String modifyQuestion(HttpSession session, Model model , Question question
								, @RequestParam(value = "testNo") int testNo
								, @RequestParam(value = "questionIdx") int questionIdx
								, @RequestParam(value = "questionTitle") String questionTitle) {
		question= new Question();
		question.setQuestionIdx(questionIdx);
		question.setQuestionTitle(questionTitle);
		question.setTestNo(testNo);
		int row=questionService.modifyQuestion(question);
		log.debug("문제 수정 성공");
		
		return "teacher/testOne?testNo="+testNo+"";
		
	}
	
	//시험 문제 삭제
	@GetMapping("teacher/removeQuestion")
	public String removeQuestion(HttpSession session, @RequestParam("questionNo") int questionNo
									, @RequestParam(value = "testNo") int testNo) {
		
		questionService.removeQuestion(questionNo, testNo);
		
		return "redirect:/teacher/testOne?testNo="+testNo+"";
	}

	//시험 입력
	@PostMapping("teacher/addQuestion")
	public String addQuestion(HttpSession session, Question question
							, @RequestParam(value = "testNo") int testNo) {
		int row=questionService.addQuestion(question);
		if(row==0) {
			System.out.println("시험 입력 실패!");
			return "redirect:/teacher/testOne?testNo="+testNo+"";
		}
		log.debug("1");
		System.out.println("시험 입력 성공");
		return "redirect:/teacher/testOne?testNo="+testNo+"";
	}
	
}
