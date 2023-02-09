package goodee.gdj58.online.restapi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import goodee.gdj58.online.restapi.mapper.EmployeeRestMapper;

@Service
public class EmployeeRestService {
	@Autowired public EmployeeRestMapper employeeRestMapper;
	public String getEmployeeId (String empId) {
		
		//사용 불가 아이디
		String resultStr="NO";
		
		if(employeeRestMapper.selectEmployeeId(empId)==null) {

			resultStr="YES";
			//사용 가능 아이디
		}
		
		return resultStr;
		
	}
}
