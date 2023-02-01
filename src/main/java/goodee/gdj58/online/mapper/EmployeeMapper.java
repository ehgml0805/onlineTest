package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Mapper
public interface EmployeeMapper {
	
	//관리자가 강사 등록
	int insertTeacher(Teacher teacher);
	//관리자가 강사 삭제
	int deleteTeacher(int teacherNo);
	//관리자 쪽에서 보는 강사리스트
	List<Teacher> selectTeacherList(Map<String, Object> paramMap);
	
	//관리자가 학생 등록
	int insertStudent(Student student);
	//관리자가 학생 삭제
	int deleteStudent(int studentNo);
	//관리자 쪽에서 보는 학생목록
	List<Student> selectStudentList(Map<String, Object> paramMap);
	
	int updateEmployeePw(Map<String,Object> paramMap);
	Employee login(Employee employee);
	int deleteEmployee(int empNo);
	int insertEmployee(Employee employee);
	List<Employee> selectEmployeeList(Map<String, Object> paramMap);
}
