package yj.kr.login.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yj.kr.login.mapper.LoginMapper;

@Service
public class LoginService {

	@Autowired
	private LoginMapper loginMapper;

	public Map<String, Object> loginchk(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return loginMapper.loginchk(map);
	}

	public Map<String, Object> passchk(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return loginMapper.passchk(map);
	}

	public Map<String, Object> idfindchk(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return loginMapper.idfindchk(map);
	}

	public Map<String, Object> passwdfindchk(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return loginMapper.passwdfindchk(map);
	}
	

}
