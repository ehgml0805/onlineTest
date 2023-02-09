package goodee.gdj58.online.restapi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.restapi.service.TeacherRestService;

@RestController
public class TeacherRestController {
	@Autowired TeacherRestService teacherRestService;
	
	@GetMapping("/employee/teacher/idck")
	public String idck(@RequestParam(value = "teacherId")String teacherId) {
		return teacherRestService.getTeacherId(teacherId);
	}
}
