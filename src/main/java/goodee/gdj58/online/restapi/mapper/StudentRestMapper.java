package goodee.gdj58.online.restapi.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentRestMapper {
	public String selectStudentId(String studentId);
}
