package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;

@Mapper
public interface EmployeeMapper {

	int updateEmployeePw(Map<String,Object> paramMap);
	Employee login(Employee employee);
	int deleteEmployee(int empNo);
	int insertEmployee(Employee employee);
	//마지막 페이징
	int selectCount(String searchWord);
	//관리자 리스트
	List<Employee> selectEmployeeList(Map<String, Object> paramMap);
}
