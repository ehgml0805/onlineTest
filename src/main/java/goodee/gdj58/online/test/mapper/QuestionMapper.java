package goodee.gdj58.online.test.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Question;
@Mapper
public interface QuestionMapper {
	//시험 수정
	int updateQuestion(Map<String,Object> paramMap);
	//시험 삭제
	int deleteQuestion(int questionNo);
	//시험추가
	int insertQuestion(Question question);
	//test ->question 문제 리스트 
	List<Question> selecQuestionList(Map<String, Object> paramMap);
}
