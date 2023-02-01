package goodee.gdj58.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.vo.Student;

@Service
@Transactional
public class StudentService {
	//DI = new 연산자 역할
	@Autowired private StudentMapper studentMapper;
	
	//학생로그인
	public Student loginStudent(Student student) {
		
		return studentMapper.loginStudent(student);
	}
	
	//학생회원탈퇴
	public int remoevStudent(int studentNo) {
		
		return studentMapper.deleteStudent(studentNo);
	}
	
	//학생회원가입
	//변수 타입은 mapper에서 쓴 타입과 동일해야 함
	public int addStudent(Student student){
		
		return studentMapper.insertStudent(student);
	}
}
