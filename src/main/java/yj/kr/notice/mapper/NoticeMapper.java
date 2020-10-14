package yj.kr.notice.mapper;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {

	List<Map<String, Object>> noticelist();

	Map<String, Object> noticeupdatedetail(Map<String, Object> map);

	Map<String, Object> noticedetail(Map<String, Object> map);

	int noticedelete(Map<String, Object> map);

	int noticeupdate(Map<String, Object> map);

	Map<String, Object> noticemaxseq();

	int noticeinsert(Map<String, Object> map);

}
