package goodee.gdj58.online.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.test.service.ExampleService;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ExampleController {
	@Autowired ExampleService exampleService;
	
	//보기 삭제
	@GetMapping("test/question/removeExample")
	public String removeExample(HttpSession session
								, @RequestParam("exampleNo") int exampleNo
								, @RequestParam("questionNo") int questionNo) {
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		int teacherNo=loginTeacher.getTeacherNo();
		exampleService.removeExample(exampleNo, questionNo, teacherNo);
		
		return "redirect:/test/question/questionOne";
	}
	
}
