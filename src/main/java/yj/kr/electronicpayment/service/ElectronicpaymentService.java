package yj.kr.electronicpayment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yj.kr.electronicpayment.mapper.ElectronicpaymentMapper;
@Service
public class ElectronicpaymentService {

	@Autowired
	private ElectronicpaymentMapper electronicpaymentMapper;
	
	public List<Map<String, Object>> electronicpaymentlist() {
		// TODO Auto-generated method stub
		return electronicpaymentMapper.electronicpaymentlist();
	}

	public Map<String, Object> electronicpaymentmaxseq() {
		// TODO Auto-generated method stub
		return electronicpaymentMapper.electronicpaymentmaxseq();
	}

	public int electronicpaymentinsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return electronicpaymentMapper.electronicpaymentinsert(map);
	}

	public Map<String, Object> electronicpaymentdetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return electronicpaymentMapper.electronicpaymentdetail(map);
	}

	public int payment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return electronicpaymentMapper.payment(map);
	}

	public int updatepayment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return electronicpaymentMapper.updatepayment(map);
	}

	public int deletepayment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return electronicpaymentMapper.deletepayment(map);
	}

	public int backpayment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return electronicpaymentMapper.backpayment(map);
	}

}
