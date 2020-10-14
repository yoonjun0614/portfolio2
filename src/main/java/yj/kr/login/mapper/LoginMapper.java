package yj.kr.login.mapper;

import java.util.Map;

public interface LoginMapper {

	Map<String, Object> loginchk(Map<String, Object> map);

	Map<String, Object> passchk(Map<String, Object> map);

	Map<String, Object> idfindchk(Map<String, Object> map);

	Map<String, Object> passwdfindchk(Map<String, Object> map);




}
