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
	
	//변수 타입은 mapper에서 쓴 타입과 동일해야 함
	
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
	
	public int selectCount(String searchWord) {
		return employeeMapper.selectCount(searchWord);
	}
	
	public List<Employee> getEmployeeList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage-1)*rowPerPage; //0변부터 출력할 거~ rowPwePage 개수만큼 출력
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return employeeMapper.selectEmployeeList(paramMap);
		
		
	}
}
