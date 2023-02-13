package goodee.gdj58.online.test.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.test.mapper.QuestionMapper;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;

@Service
@Transactional
public class QuestionService {
	//DI = new 연산자 역할
	@Autowired private QuestionMapper questionMapper;
	
	//변수 타입은 mapper에서 쓴 타입과 동일해야 함
	//보기 수정
	public int modifyQuestion(Question question) {
		Map<String,Object> paramMap= new HashMap<String, Object>();
		paramMap.put("test_no", question.getTestNo());
		paramMap.put("question_idx", question.getQuestionIdx());
		paramMap.put("question_title", question.getQuestionTitle());
		
		return questionMapper.updateQuestion(paramMap);
	}
	//문제 상세보기
	public Question getQuestionOne(int questionIdx) {
		return questionMapper.questionOne(questionIdx);
	}
	
	//시험 삭제
		public int removeQuestion(int questionNo) {
			return questionMapper.deleteQuestion(questionNo);
		}
	//시험 추가
	public int addQuestion(Question question) {
		return questionMapper.insertQuestion(question);
	}
	
	//시험리스트: 페이징 해야 해?
	public List<Question> getQuestionList(int currentPage, int rowPerPage){
		//시작페이지
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap= new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return questionMapper.selecQuestionList(paramMap);
	}
}
