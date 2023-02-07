package goodee.gdj58.online.test.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.test.mapper.TestMapper;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class TestService {
	//DI = new 연산자 역할
	@Autowired private TestMapper testMapper;
	
	
	//test 상세보기에서 문제 목록 출력
	public List<Question> getQuestionList(int testNo){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		return testMapper.selecQuestionList(paramMap);
	}
	//tsetOne 상세보기 
	public List<Test> getTestOne(int testNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		return testMapper.selecTestOne(testNo);
	}
	
	//test 추가
	public int addTest(Test test) {
		return testMapper.insertTest(test);
	}
	
	//페이징을 위한 총 개수
	public int selectCount(String searchword) {
		return testMapper.selectCount(searchword);
	}
	//강사 tsetList 
	public List<Test> getTestListByStudent(int currentPage, int rowPerPage, String searchWord ){
		int beginRow = (currentPage-1)*rowPerPage; //0변부터 출력할 거~ rowPwePage 개수만큼 출력
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return testMapper.selecTestList(paramMap);
	}
	//강사 tsetList 
	public List<Test> getTestList(int currentPage, int rowPerPage, String searchWord ){
		int beginRow = (currentPage-1)*rowPerPage; //0변부터 출력할 거~ rowPwePage 개수만큼 출력
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return testMapper.selecTestList(paramMap);
	}
}
