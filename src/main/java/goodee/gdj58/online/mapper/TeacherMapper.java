package goodee.gdj58.online.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Mapper
public interface TeacherMapper {
	Student loginTeacher(Teacher teacher); //학생로그인
	int deleteTeacher(int teacherstudentNo); //학생 탈퇴
	int insertTeacher(Teacher teacher); //학생 회원가입
}
