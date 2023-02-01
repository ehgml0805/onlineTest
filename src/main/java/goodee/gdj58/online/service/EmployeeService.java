package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.EmployeeMapper;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;
@Service
@Transactional
//여러개의 트렌젝션처리하고 싶으면: 하나의 서비스에 여러개의 매퍼 호출해도 됨 그러면 트렌젝션 처리가 편함
public class EmployeeService {
	//DI = new 연산자 역할
	@Autowired private EmployeeMapper employeeMapper;
	
	//관리자가 학생 삭제
		public int removeTeacher(int teacherNo) {
			return employeeMapper.deleteTeacher(teacherNo);
		}
	//관리자 쪽에서 보는 강사리스트
	public List<Teacher> getTeacherList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage-1)*rowPerPage; //0변부터 출력할 거~ rowPwePage 개수만큼 출력
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return employeeMapper.selectTeacherList(paramMap);
	}
	
	
	//관리자가 학생 삭제
	public int removeStudent(int studentNo) {
		return employeeMapper.deleteStudent(studentNo);
	}
	//관리자 쪽에서 보는 학생리스트
	public List<Student> getStudentList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage-1)*rowPerPage; //0변부터 출력할 거~ rowPwePage 개수만큼 출력
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return employeeMapper.selectStudentList(paramMap);
	}
	
	
	public int updateEmployeePw(int empNo, String oldPw, String newPw) {
		// hashMap 다형성..
		Map<String,Object> paramMap= new HashMap<String, Object>();
		paramMap.put("empNo", empNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		return employeeMapper.updateEmployeePw(paramMap);
		
	}
	
	
	public Employee login(Employee emp) {
		return employeeMapper.login(emp);
	}
	
	
	public int removeEmployee(int empNo) {
		return employeeMapper.deleteEmployee(empNo);
	}
	
	public int addEmployee(Employee employee) {
		
		return employeeMapper.insertEmployee(employee);
	}
	
	public List<Employee> getEmployeeList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage-1)*rowPerPage; //0변부터 출력할 거~ rowPwePage 개수만큼 출력
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return employeeMapper.selectEmployeeList(paramMap);
	}
}
