package yj.kr.suggestions.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yj.kr.suggestions.mapper.SuggestionsMapper;

@Service
public class SuggestionsService {

	@Autowired
	private SuggestionsMapper suggestionsMapper;
	
	public List<Map<String, Object>> suggestionslist() {
		// TODO Auto-generated method stub
		return suggestionsMapper.suggestionslist();
	}

	public Map<String, Object> suggestionsdatail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return suggestionsMapper.suggestionsdatail(map);
	}

	public Map<String, Object> suggestionsmaxseq() {
		// TODO Auto-generated method stub
		return suggestionsMapper.suggestionsmaxseq();
	}

	public int suggestionslisert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return suggestionsMapper.suggestionslisert(map);
	}

	public int suggestionsupdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return suggestionsMapper.suggestionsupdate(map);
	}

	public int suggestionsdelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return suggestionsMapper.suggestionsdelete(map);
	}


}
