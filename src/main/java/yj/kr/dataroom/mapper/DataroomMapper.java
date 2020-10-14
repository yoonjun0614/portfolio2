package yj.kr.dataroom.mapper;

import java.util.List;
import java.util.Map;

public interface DataroomMapper {

	List<Map<String, Object>> dataroomlist();

	int upload(Map<String, Object> map);

	int uploaddelete(Map<String, Object> map);

	Map<String, Object> dataroommaxseq();

	int dataroominsert(Map<String, Object> map);

	Map<String, Object> dataroomdetail(Map<String, Object> map);

	int dataroomupdate(Map<String, Object> map);

	int dataroomdelete(Map<String, Object> map);

}
