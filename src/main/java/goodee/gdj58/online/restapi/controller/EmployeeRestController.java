package goodee.gdj58.online.restapi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.restapi.service.EmployeeRestService;

@RestController
public class EmployeeRestController {
	@Autowired EmployeeRestService employeeRestService;
	
	@GetMapping("/employee/idck")
	public String idck(@RequestParam(value = "empId") String empId) {
		return employeeRestService.getEmployeeId(empId);
	}
	
}
