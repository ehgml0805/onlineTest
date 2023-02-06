package goodee.gdj58.online.test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.test.service.QuestionService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired QuestionService questionService;
	//시험 삭제
	@GetMapping("test/question/removeQuestion")
	public String removeQuestion(HttpSession session, @RequestParam("questionNo") int questionNo) {
		questionService.removeQuestion(questionNo);
		
		return "redirect:/teacher/testList";
	}

	//시험 입력
	@GetMapping("teacher/testList/addQuestion")
	public String addQuestion(HttpSession session) {
		return "teacher/testList/addQuestion";
	}
	@PostMapping("teacher/testList/addQuestion")
	public String addQuestion(HttpSession session, Question question) {
		int row=questionService.addQuestion(question);
		if(row==0) {
			System.out.println("시험 입력 실패!");
			return "redirect:/test/example/addQuestion";
		}
		log.debug("1");
		System.out.println("시험 입력 성공");
		return "teacher/testList";
	}
	
	//시험 목록 출력
	@GetMapping("teacher/testList/Question")
	public String questionList(HttpSession session, Model model
								, @RequestParam(value = "currentPage", defaultValue="1") int currentPage
								, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
						//@RequestParam("가져올 데이터의 이름")[데이터타입][가져온 데이터를 담을 변수]
		List<Question> QList= questionService.getQuestionList(currentPage, rowPerPage);
		model.addAttribute("QList", QList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		
		return "test/testOne"; //forword는 url 주소가 바뀌지 않음
	}
}
