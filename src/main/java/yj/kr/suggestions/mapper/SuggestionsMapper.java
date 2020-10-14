package yj.kr.suggestions.mapper;

import java.util.List;
import java.util.Map;

public interface SuggestionsMapper {

	List<Map<String, Object>> suggestionslist();

	Map<String, Object> suggestionsdatail(Map<String, Object> map);

	Map<String, Object> suggestionsmaxseq();

	int suggestionslisert(Map<String, Object> map);

	int suggestionsupdate(Map<String, Object> map);

	int suggestionsdelete(Map<String, Object> map);



}
