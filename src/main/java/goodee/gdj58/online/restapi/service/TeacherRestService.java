package goodee.gdj58.online.restapi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import goodee.gdj58.online.restapi.mapper.TeacherRestMapper;

@Service
public class TeacherRestService {
	@Autowired public TeacherRestMapper teacherRestMapper;
	public String getTeacherId (String teacherId) {
		
		//사용 불가 아이디
		String resultStr="NO";
		
		if(teacherRestMapper.selectTeacherId(teacherId)==null) {

			resultStr="YES";
			//사용 가능 아이디
		}
		
		return resultStr;
		
	}
}
