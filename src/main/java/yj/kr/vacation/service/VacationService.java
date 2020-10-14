package yj.kr.vacation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yj.kr.vacation.mapper.VacationMapper;

@Service
public class VacationService {

	@Autowired
	private VacationMapper vacationMapper;
	
	public List<Map<String, Object>> vacationlist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return vacationMapper.vacationlist(map);
	}

	public Map<String, Object> vacationsmaxseq() {
		// TODO Auto-generated method stub
		return vacationMapper.vacationsmaxseq();
	}

	public int vacationinsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return vacationMapper.vacationinsert(map);
	}

	public Map<String, Object> vacationdatail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return vacationMapper.vacationdatail(map);
	}

	public int vacationupdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return vacationMapper.vacationupdate(map);
	}

	public int vacationdelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return vacationMapper.vacationdelete(map);
	}

	public int vacationpayment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return vacationMapper.vacationpayment(map);
	}

	public int vacationback(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return vacationMapper.vacationback(map);
	}

	public List<Map<String, Object>> vacationmylist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return vacationMapper.vacationmylist(map);
	}

}
