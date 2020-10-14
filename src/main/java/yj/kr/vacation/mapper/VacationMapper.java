package yj.kr.vacation.mapper;

import java.util.List;
import java.util.Map;

public interface VacationMapper {

	List<Map<String, Object>> vacationlist(Map<String, Object> map);

	Map<String, Object> vacationsmaxseq();

	int vacationinsert(Map<String, Object> map);

	Map<String, Object> vacationdatail(Map<String, Object> map);

	int vacationupdate(Map<String, Object> map);

	int vacationdelete(Map<String, Object> map);

	int vacationpayment(Map<String, Object> map);

	int vacationback(Map<String, Object> map);

	List<Map<String, Object>> vacationmylist(Map<String, Object> map);

}
