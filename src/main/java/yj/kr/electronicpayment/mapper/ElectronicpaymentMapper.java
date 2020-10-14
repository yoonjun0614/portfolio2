package yj.kr.electronicpayment.mapper;

import java.util.List;
import java.util.Map;

public interface ElectronicpaymentMapper {

	List<Map<String, Object>> electronicpaymentlist();

	Map<String, Object> electronicpaymentmaxseq();

	int electronicpaymentinsert(Map<String, Object> map);

	Map<String, Object> electronicpaymentdetail(Map<String, Object> map);

	int payment(Map<String, Object> map);

	int updatepayment(Map<String, Object> map);

	int deletepayment(Map<String, Object> map);

	int backpayment(Map<String, Object> map);

}
