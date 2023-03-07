package goodee.gdj58.online.test.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Question;
@Mapper
public interface QuestionMapper {
	//문제 수정
	int updateQuestion(Map<String,Object> paramMap);
	//문제 상세보기 안쓸듯
	Question questionOne(int questionNo);
	//문제 삭제
	int deleteQuestion(int questionNo, int testNo);
	//시험추가
	int insertQuestion(Question question);
	//testone에서 문제 리스트 List<Map<String, Object>>: 키값이 아닌, 데이터를 이용한 정렬
	List<Map<String, Object>> testByQList(int testNo);
}
