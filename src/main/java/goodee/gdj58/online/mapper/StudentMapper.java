package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import goodee.gdj58.online.vo.*;

@Mapper
public interface StudentMapper {
	Student loginStudent(Student student); //학생로그인
	int deleteStudent(int studentNo); //학생 탈퇴
	int insertStudent(Student student); //학생 회원가입
}
