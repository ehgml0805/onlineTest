package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import goodee.gdj58.online.vo.*;

@Mapper
public interface StudentMapper {
	
	//관리자가 학생 등록
	int insertStudent(Student student);
	//관리자가 학생 삭제
	int deleteStudent(int studentNo);
	//마지막 페이징
	int selectCount(String searchWord);
	//관리자 쪽에서 보는 학생목록
	List<Student> selectStudentList(Map<String, Object> paramMap);
	//학생로그인
	Student loginStudent(Student student);
}
