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
		return exampleMapper.updateExample(example);
	}
	
	//보기 삭제
	public int removeExample(int exampleNo,int questionNo,int teacherNo ) {
		return exampleMapper.deleteExample(exampleNo, questionNo, teacherNo);
	}
	
	//문제 추가 -> 보기 추가
	public int addExample(Example example) {
		return exampleMapper.insertExample(example);
	}
	
	//해당 테스트의 문제의 보기
	public List<Map<String, Object>> getTestEList(int questionIdx){
		return exampleMapper.testByEList(questionIdx);
	}
}
