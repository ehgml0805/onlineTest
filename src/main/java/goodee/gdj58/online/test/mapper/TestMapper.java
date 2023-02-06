package goodee.gdj58.online.test.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Test;

@Mapper
public interface TestMapper {
	//시험 상세보기에서 문제랑 보기 불러오기
	List<Question> selecQuestionList(Map<String, Object> paramMap);
	//시험 상세보기 
	List<Test> selecTestOne(int testNo);
	//test 추가
	int insertTest(Test test);
	//마지막 페이징
	int selectCount(String searchWord);
	//시험 리스트 
	List<Test> selecTestList(Map<String, Object> paramMap);
}