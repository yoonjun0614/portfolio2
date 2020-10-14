package yj.kr.suggestions.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import yj.kr.suggestions.service.SuggestionsService;

@Controller
public class SuggestionsController {

	@Autowired
	private SuggestionsService suggestionsService;
	
	//게시글 리스트 화면
	@RequestMapping(value = "/set/suggestions.do")
	public ModelAndView suggestionsView ( HttpServletResponse response) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("suggestions/suggestionslist");
		
		return mv;
	}
	//게시글 등록 화면
	@RequestMapping(value = "/set/suggestionsenrollment.do")
	public ModelAndView suggestionsinsertView ( HttpServletResponse response) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("suggestions/suggestionsinsert");
		
		return mv;
	}
	
	//공지사항 수정 페이지 seq
	@RequestMapping(value = "/set/suggestionsdetail.do")
	public ModelAndView suggestionsdetail ( @RequestParam Map<String,Object> map, HttpServletResponse response ,HttpServletRequest request) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String,Object> suggestionsdatail = new HashMap<String, Object>();
		suggestionsdatail=suggestionsService.suggestionsdatail(map);
		mv.addObject("suggestionsdatail", suggestionsdatail);
		
		return mv;
		
	}
	
	//공지사항 수정 페이지 데이터
	@RequestMapping(value = "/set/suggestionsupdatedetail.do")
	public ModelAndView suggestionsupdatedetail(Model model,@RequestParam Map<String,Object> map, HttpServletResponse response, HttpServletRequest request) throws Exception
	{

		Map<String,Object> suggestionsdatail = new HashMap<String, Object>();
		suggestionsdatail=suggestionsService.suggestionsdatail(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("suggestionsdatailOne", suggestionsdatail);
		mv.setViewName("suggestions/suggestionsupdate");
		
		return mv;
		
	}
	
	
	//게시글삭제
	@RequestMapping(value = "/set/suggestionsdelete.do")
	public ModelAndView suggestionsdelete(Model model,@RequestParam Map<String,Object> map,HttpServletResponse response, HttpServletRequest request) throws Exception
	{

		int delete=suggestionsService.suggestionsdelete(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("suggestionsdelete", delete);
			
		return mv;
			
	}	

	//게시글 업데이트
	@RequestMapping(value = "/set/suggestionsupdate.do")
	public ModelAndView suggestionsupdate(Model model,@RequestParam Map<String,Object> map, HttpServletResponse response, HttpServletRequest request) throws Exception
	{

		Calendar cal = Calendar.getInstance();
		String yearPath =  "" +cal.get(Calendar.YEAR);
		String monthPath = yearPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String hourPath = datePath + " " + new DecimalFormat("00").format(cal.get(Calendar.HOUR_OF_DAY));
		String minutePath = hourPath + ":" + new DecimalFormat("00").format(cal.get(Calendar.MINUTE));
		String secondPath = minutePath + ":" + new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		
		map.put("SUGGESTIONS_UPDATEDATE",secondPath);
		int update=suggestionsService.suggestionsupdate(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("update", update);
		
		return mv;
		
	}
	
	
	//게시글 목록
	@RequestMapping(value = "/set/suggestionslist.do")
	public ModelAndView suggestionslistView ( HttpServletResponse response) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("jsonView");
    	List<Map<String,Object>> suggestionslist = new ArrayList<Map<String,Object>>();
    	suggestionslist=suggestionsService.suggestionslist();
    	mv.addObject("suggestionslist", suggestionslist);
    	
    	return mv;
		
	}

	//게시글 번호 +1
	@RequestMapping(value = "/set/suggestionsmaxseq.do")
	public ModelAndView suggestionsmaxseq ( HttpServletResponse response) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> suggestionsmaxseq = new HashMap<String,Object>();
    	suggestionsmaxseq=suggestionsService.suggestionsmaxseq();
    	if(suggestionsmaxseq ==null) {
    		int maxseq = 1;
    		mv.addObject("suggestionsmaxseq", maxseq);
    	}else {
    		mv.addObject("suggestionsmaxseq", suggestionsmaxseq);
    	}
    	
    	
    	return mv;
		
	}	

	
	//게시글 등록
	@RequestMapping(value = "/set/suggestionslisert.do")
	public ModelAndView suggestionslisert (@RequestParam Map<String,Object> map, HttpServletResponse response) throws Exception
	{

		Calendar cal = Calendar.getInstance();
		String yearPath =  "" +cal.get(Calendar.YEAR);
		String monthPath = yearPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String hourPath = datePath + " " + new DecimalFormat("00").format(cal.get(Calendar.HOUR_OF_DAY));
		String minutePath = hourPath + ":" + new DecimalFormat("00").format(cal.get(Calendar.MINUTE));
		String secondPath = minutePath + ":" + new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		map.put("SUGGESTIONS_CREATEDATE",secondPath);
		System.out.println("map:::"+map);
		int suggestionslisert= suggestionsService.suggestionslisert(map);
		ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("suggestionslisert", suggestionslisert);

    	return mv;
		
	}		
	
}
