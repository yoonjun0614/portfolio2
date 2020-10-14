package yj.kr.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yj.kr.notice.mapper.NoticeMapper;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
 	
	public List<Map<String, Object>> noticelist() {
		// TODO Auto-generated method stub
		return noticeMapper.noticelist();
	}

	public Map<String, Object> noticeupdatedetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeMapper.noticeupdatedetail(map);
	}

	public Map<String, Object> noticedetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeMapper.noticedetail(map);
	}

	public int noticedelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeMapper.noticedelete(map);
	}

	public int noticeupdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeMapper.noticeupdate(map);
	}

	public Map<String, Object> noticemaxseq() {
		// TODO Auto-generated method stub
		return noticeMapper.noticemaxseq();
	}

	public int noticeinsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeMapper.noticeinsert(map);
	}

}
