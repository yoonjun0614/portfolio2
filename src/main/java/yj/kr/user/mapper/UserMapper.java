package yj.kr.user.mapper;

import java.util.List;
import java.util.Map;


public interface UserMapper
{

	List<Map<String, Object>> userlist();

	Map<String, Object> idchk(Map<String, Object> map);

	Map<String, Object> insertemailchk(Map<String, Object> map);

	int userinsert(Map<String, Object> map);

	int userupdate(Map<String, Object> map);


}
