package goodee.gdj58.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Service
@Transactional
public class TeacherService {	@Autowired private TeacherService teacherService;
	
	//학생로그인
	public Teacher loginTeacher(Teacher teacher) {
		
		return teacherService.loginTeacher(teacher);
	}
	
	//강사 회원 탈퇴 만들긴 해놨으나 관리자만 삭제 가능하게 할 거..
	public int remoevTeacher(int teacherNo) {
		
		return teacherService.remoevTeacher(teacherNo);
	}
	
	//학생회원가입
	//변수 타입은 mapper에서 쓴 타입과 동일해야 함
	public int addTeacher(Teacher teacher){
		
		return teacherService.addTeacher(teacher);
	}

}