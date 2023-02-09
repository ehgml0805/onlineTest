package goodee.gdj58.online.restapi.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeRestMapper {
	public String selectEmployeeId(String empId);
}
