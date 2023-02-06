package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Teacher;
@Service
@Transactional
public class TeacherService {
	//DI = new 연산자 역할
	@Autowired private TeacherMapper teachereMapper;
	
	//변수 타입은 mapper에서 쓴 타입과 동일해야 함
	//관리자가 강사 등록
	public int addTeacher(Teacher teacher) {
		
		return teachereMapper.insertTeacher(teacher);
	}
	//관리자가 강사 삭제
	public int removeTeacher(int teacherNo) {
		return teachereMapper.deleteTeacher(teacherNo);
	}
	//페이징
	public int selectCount(String searchWord) {
		return teachereMapper.selectCount(searchWord);
	}
	
	//관리자 쪽에서 보는 강사리스트
	public List<Teacher> getTeacherList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage-1)*rowPerPage; //0변부터 출력할 거~ rowPwePage 개수만큼 출력
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return teachereMapper.selectTeacherList(paramMap);
	}
	public Teacher loginTeacher(Teacher teacher) {
		return teachereMapper.loginTeacher(teacher);
	}
}
