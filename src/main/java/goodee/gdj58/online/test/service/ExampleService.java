package goodee.gdj58.online.test.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.test.mapper.ExampleMapper;
import goodee.gdj58.online.vo.Example;

@Service
@Transactional
public class ExampleService {
	//DI = new 연산자 역할
	@Autowired private ExampleMapper exampleMapper;
	
	//변수 타입은 mapper에서 쓴 타입과 동일해야 함
	//보기 수정
	public int modifyExample(Example example) {
		Map<String,Object> paramMap= new HashMap<String, Object>();
		paramMap.put("question_no", example.getQuestionNo());
		paramMap.put("example_idx", example.getExampleIdx());
		paramMap.put("example_title", example.getExampleTitle());
		paramMap.put("answer_ox", example.getAnswerOx());
		
		return exampleMapper.updateExample(paramMap);
	}
	
	//보기 삭제
	public int removeExample(int exampleNo) {
		return exampleMapper.deleteExample(exampleNo);
	}
	
	//보기 추가
	public int addExample(Example example) {
		return exampleMapper.insertExample(example);
	}
	
	//문제의 보기
	public List<Map<String, Object>> getExampleList(int qIdx){
		//int beginRow = (currentPage-1)*rowPerPage;
		//Map<String, Object> paramMap= new HashMap<String, Object>();
		//paramMap.put("qIdx", qIdx);
		
		//paramMap.put("beginRow", beginRow);
		//paramMap.put("rowPerPage", rowPerPage);
		return exampleMapper.selectExampleList(qIdx);
	}
}
