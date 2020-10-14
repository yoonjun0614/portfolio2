package yj.kr.dataroom.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yj.kr.dataroom.mapper.DataroomMapper;
@Service
public class DataroomService {

	
	@Autowired
	private DataroomMapper dataroomMapper;
	
	public List<Map<String, Object>> dataroomlist() {
		// TODO Auto-generated method stub
		return dataroomMapper.dataroomlist();
	}

	public int upload(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dataroomMapper.upload(map);
	}

	public int uploaddelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dataroomMapper.uploaddelete(map);
	}

	public Map<String, Object> dataroommaxseq() {
		// TODO Auto-generated method stub
		return dataroomMapper.dataroommaxseq();
	}

	public int dataroominsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dataroomMapper.dataroominsert(map);
	}

	public Map<String, Object> dataroomdetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dataroomMapper.dataroomdetail(map);
	}

	public int dataroomupdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dataroomMapper.dataroomupdate(map);
	}

	public int dataroomdelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dataroomMapper.dataroomdelete(map);
	}

}
