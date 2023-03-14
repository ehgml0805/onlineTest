package goodee.gdj58.online.test.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.test.mapper.QuestionMapper;
import goodee.gdj58.online.vo.Question;

@Service
@Transactional
public class QuestionService {
	//DI = new 연산자 역할
	@Autowired private QuestionMapper questionMapper;
	
	//변수 타입은 mapper에서 쓴 타입과 동일해야 함
	//보기 수정
	public int modifyQuestion(Question question) {
		questionMapper.updateQuestion(question);
		return question.getQuestionNo();
	}
	//문제 상세보기
	public List<Map<String, Object>> getQuestionOne(int questionNo) {
		return questionMapper.questionOne(questionNo);
	}
	
	//시험 삭제
		public int removeQuestion(int questionNo) {
			return questionMapper.deleteQuestion(questionNo);
		}
	//시험 추가
	public int addQuestion(Question question) {
		questionMapper.insertQuestion(question);
		System.out.print(question.getQuestionNo());
		return question.getQuestionNo();
	}
	
	//testone에서 문제,보기 리스트 
	public List<Map<String, Object>> getTestQEList(int testNo){
		return questionMapper.testByQEList(testNo);
	}
}
