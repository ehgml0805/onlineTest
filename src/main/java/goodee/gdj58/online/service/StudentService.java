package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	//변수 타입은 mapper에서 쓴 타입과 동일해야 함
	//관리자가 학생 등록
	public int addStudent(Student student) {
		
		return studentMapper.insertStudent(student);
	}
	//관리자가 학생 삭제
	public int removeStudent(int studentNo) {
		return studentMapper.deleteStudent(studentNo);
	}
	public int selectCount(String searchWord) {
		return studentMapper.selectCount(searchWord);
	}
	
	//관리자 쪽에서 보는 학생리스트
	public List<Student> getStudentList(int currentPage, int rowPerPage,String searchWord) {
		int beginRow = (currentPage-1)*rowPerPage; //0변부터 출력할 거~ rowPwePage 개수만큼 출력
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return studentMapper.selectStudentList(paramMap);
	}
	
	//학생로그인
	public Student loginStudent(Student student) {
		
		return studentMapper.loginStudent(student);
	}
	
}
