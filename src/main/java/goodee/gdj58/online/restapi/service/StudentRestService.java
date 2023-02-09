package goodee.gdj58.online.restapi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import goodee.gdj58.online.restapi.mapper.StudentRestMapper;

@Service
public class StudentRestService {
	@Autowired public StudentRestMapper studentRestMapper;
	
	public String getStudentId (String studentId) {
		
		//사용 불가 아이디
		String resultStr="NO";
		
		if(studentRestMapper.selectStudentId(studentId)==null) {

			resultStr="YES";
			//사용 가능 아이디
		}
		
		return resultStr;
		
	}
}
