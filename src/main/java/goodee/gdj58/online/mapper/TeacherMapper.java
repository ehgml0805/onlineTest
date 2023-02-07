package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Mapper
public interface TeacherMapper {
	//강사 비밀번호 수정
	int updateTeacherPw(Map<String,Object> paramMap);
	//관리자가 강사 등록
	int insertTeacher(Teacher teacher);
	//관리자가 강사 삭제
	int deleteTeacher(int teacherNo);
	//마지막 페이징
	int selectCount(String searchWord);
	//관리자 쪽에서 보는 강사리스트
	List<Teacher> selectTeacherList(Map<String, Object> paramMap);
	//강사 로그인
	Teacher loginTeacher(Teacher teacher);
}
