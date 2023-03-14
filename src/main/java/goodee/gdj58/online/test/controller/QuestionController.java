package goodee.gdj58.online.test.controller;

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
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired QuestionService questionService;
	@Autowired ExampleService exampleService;
	
	//시험 수정
	@GetMapping("teacher/modifyQuestion")
	public String modifyQuestion(HttpSession session, Model model
								, @RequestParam(value = "questionNo") int questionNo) {
		
		//컨트롤러에서 데이터를 인자에 할당하는 대표적인 방법으로는 @RequestBody 와 @RequestParam 이 있다.
		//요청 파라미터를 메소드에서 1:1로 받기 위해 사용한다.
		//@RequestParam으로 데이터를 받을때는 데이터를 저장하는 이름으로 메서드의 변수명을 설정해주어야 한다.
		List<Map<String, Object>> qOne=questionService.getQuestionOne(questionNo);
		//System.out.println(qOne); //qNo
		//System.out.println(qOne.get(0)); //{qNo=3, qTitle=1+1 정답을 고르시오., testNo=5, eNo=38, eIdx=1, qIdx=1, eTitle=1, eOx=오답}
		//System.out.println(qOne.get(1)); //{qNo=3, qTitle=1+1 정답을 고르시오., testNo=5, eNo=39, eIdx=2, qIdx=1, eTitle=1, eOx=오답}
		//System.out.println(qOne.get(0).get("qNo"));//3
		
		model.addAttribute("qOne", qOne);
		
		return "teacher/modifyQuestion";
	}
	@PostMapping("teacher/modifyQuestion")
	public String modifyQuestion(HttpSession session, Question question
									, @RequestParam(value = "testNo") int testNo
									, @RequestParam(value = "exampleNo")int[] exampleNo
									, @RequestParam(value = "exampleIdx")int[] exampleIdx
									, @RequestParam(value = "exampleTitle") String[] exampleTitle
									, @RequestParam(value = "answerOx") String[] answerOx) {
		/*
		 * System.out.println(exampleNo.length); System.out.println(exampleIdx.length);
		 * System.out.println(exampleTitle.length); System.out.println(answerOx.length);
		 */
		
		//questionService.addQuestion mapper 실행하고 return question.getQuestionNo
		questionService.modifyQuestion(question);
		int row=0;
		for(int i = 0; i < 4; i++) {
	    	
			 Example e= new Example();
			 //e.setQuestionNo(questionNo);
			 e.setExampleNo(exampleNo[i]);
			 e.setExampleIdx(exampleIdx[i]);
			 e.setExampleTitle(exampleTitle[i]);
			 e.setAnswerOx(answerOx[i]);
			 row += exampleService.modifyExample(e);
	        }
		if(row!=4) {
			log.debug("시험 수정 실패!");
			return "redirect:/teacher/testOne?testNo="+testNo+"";
		}
		log.debug("시험 수정 성공");
		return "redirect:/teacher/testOne?testNo="+testNo+"";
	}
	
	//시험 문제 삭제
	@GetMapping("teacher/removeQuestion")
	public String removeQuestion(HttpSession session, @RequestParam("questionNo") int questionNo, int testNo ) {
		questionService.removeQuestion(questionNo);
		
		return "redirect:/teacher/testOne?testNo="+testNo+"";
	}

	//시험 문제 입력 + 보기도 같이
	@PostMapping("teacher/addQuestion")
	public String addQuestion(HttpSession session, Question question
							, @RequestParam(value = "testNo") int testNo
							, @RequestParam(value = "exampleIdx")int[] exampleIdx
							, @RequestParam(value = "exampleTitle") String[] exampleTitle
							, @RequestParam(value = "answerOx") String[] answerOx) {
		//questionService.addQuestion mapper 실행하고 return question.getQuestionNo
		int questionNo=questionService.addQuestion(question);
		int row=0;
		for(int i = 0; i < 4; i++) {
	    	
			 Example e= new Example();
			 e.setQuestionNo(questionNo);
			 e.setExampleIdx(exampleIdx[i]);
			 e.setExampleTitle(exampleTitle[i]);
			 e.setAnswerOx(answerOx[i]);
			 row += exampleService.addExample(e);
	        }
		if(row!=4) {
			System.out.println("시험 입력 실패!");
			return "redirect:/teacher/testOne?testNo="+testNo+"";
		}
		System.out.println("시험 입력 성공");
		return "redirect:/teacher/testOne?testNo="+testNo+"";
	}
	
}
