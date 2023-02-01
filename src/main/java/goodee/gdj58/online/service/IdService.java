package goodee.gdj58.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.IdMapper;

@Service
@Transactional
//여러개의 트렌젝션처리하고 싶으면: 하나의 서비스에 여러개의 매퍼 호출해도 됨 그러면 트렌젝션 처리가 편함
public class IdService {
@Autowired IdMapper idMapper;
	
	// null이면 사용가능, null아니면 사용불가한 ID
	public String getIdCheck(String id) {
		return idMapper.selectIdCheck(id);
	}

}
