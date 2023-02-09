package goodee.gdj58.online.test.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Test;

@Mapper
public interface TestMapper {
	
	//시험 상세보기 
	List<Map<String, Object>> selecTestOne(int testNo);
	//test 추가
	int insertTest(Test test);
	//마지막 페이징
	int selectCount(String searchWord);
	//학생 시험 리스트 
	List<Test> selecTestListBystudent(Map<String, Object> paramMap);
	//강사 시험 리스트 
	List<Test> selecTestList(Map<String, Object> paramMap);
}
