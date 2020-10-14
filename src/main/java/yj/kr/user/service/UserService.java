package yj.kr.user.service;


import yj.kr.user.mapper.UserMapper;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService
{
	
	@Autowired
	private UserMapper userMapper;

	public List<Map<String, Object>> userlist() {
		// TODO Auto-generated method stub
		return userMapper.userlist();
	}

	public Map<String, Object> idchk(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.idchk(map);
	}

	public Map<String, Object> insertemailchk(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.insertemailchk(map);
	}

	public int userinsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.userinsert(map);
	}

	public int userupdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.userupdate(map);
	}

	
}
