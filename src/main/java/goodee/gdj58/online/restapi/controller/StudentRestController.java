package goodee.gdj58.online.restapi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.restapi.service.StudentRestService;

@RestController
public class StudentRestController {
	@Autowired StudentRestService studentRestService;
	
	@GetMapping("/employee/student/idck")
	public String idck(@RequestParam(value = "studentId") String studentId) {
		return studentRestService.getStudentId(studentId);
	}
}
