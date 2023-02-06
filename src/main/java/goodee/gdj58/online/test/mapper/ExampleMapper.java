package goodee.gdj58.online.test.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;

@Mapper
public interface ExampleMapper {
	//보기 수정
	int updateExample (Map<String, Object> paramMap);
	//보기 삭제
	int deleteExample(int exampleNo);
	//보기 추가
	int insertExample(Example example);
	//보기 출력
	List<Example> selectExampleList (Map<String, Object> paramMap );
	
}
