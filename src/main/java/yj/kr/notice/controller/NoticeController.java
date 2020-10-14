package yj.kr.notice.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yj.kr.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	//공지사항리스트 화면
	@RequestMapping("/set/notice.do")
	public ModelAndView noticeView( HttpServletResponse response ) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notice/noticelist");
		
		return mv;
	}
	
	//공지사항리스트 화면
	@RequestMapping("/set/noticeenrollment.do")
	public ModelAndView noticeenrollment( HttpServletResponse response ) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notice/noticeinsert");
		
		return mv;
	}
	
	
	//공지사항 리스트
	@RequestMapping("/set/noticelist.do")
	public ModelAndView noticelist( HttpServletResponse response ) {
		
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> noticelist =new ArrayList<Map<String,Object>>();
		noticelist= noticeService.noticelist();
		mv.addObject("noticelist", noticelist);
		
		return mv;
	}	
	
	
	//공지사항 seq
	@RequestMapping(value = "/set/noticedetail.do")
	public ModelAndView suggestionsdetailView ( @RequestParam Map<String,Object> map, HttpServletResponse response ,HttpServletRequest request) throws Exception
	{
		
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String,Object> noticedetail = new HashMap<String, Object>();
		noticedetail=noticeService.noticedetail(map);
		mv.addObject("noticedetail", noticedetail);
		
		return mv;
		
	}	
	
	//공지사항 수정화면 데이터
	@RequestMapping("/set/noticeupdatedetail.do")
	public ModelAndView noticeupdatedetail( @RequestParam Map<String,Object> map ,HttpServletResponse response ) {
		

		Map<String,Object> noticeupdatedetail =new HashMap<String, Object>();
		noticeupdatedetail= noticeService.noticedetail(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("noticelist", noticeupdatedetail);
		mv.setViewName("notice/noticeupdate");
		
		return mv;
	}	
	
	//공지사항 삭제
	@RequestMapping("/set/noticedelete.do")
	public ModelAndView noticedelete( @RequestParam Map<String,Object> map ,HttpServletResponse response ) {
		

		int noticedelete= noticeService.noticedelete(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("noticedelete", noticedelete);
		
		return mv;
	}	
	
	//공지사항 수정
	@RequestMapping("/set/noticeupdate.do")
	public ModelAndView noticeupdate( @RequestParam Map<String,Object> map ,HttpServletResponse response ) {
		
		
		Calendar cal = Calendar.getInstance();
		String yearPath =  "" +cal.get(Calendar.YEAR);
		String monthPath = yearPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String hourPath = datePath + " " + new DecimalFormat("00").format(cal.get(Calendar.HOUR_OF_DAY));
		String minutePath = hourPath + ":" + new DecimalFormat("00").format(cal.get(Calendar.MINUTE));
		String secondPath = minutePath + ":" + new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		map.put("NOTICE_UPDATEDATE",secondPath);
		int noticeupdate= noticeService.noticeupdate(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("noticeupdate", noticeupdate);
		
		return mv;
	}	
	
	//게시글 번호 +1
	@RequestMapping(value = "/set/noticemaxseq.do")
	public ModelAndView suggestionsmaxseq ( HttpServletResponse response) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> noticemaxseq = new HashMap<String,Object>();
    	noticemaxseq=noticeService.noticemaxseq();
    	if(noticemaxseq ==null) {
    		int maxseq = 1;
    		mv.addObject("noticemaxseq", maxseq);
    	}else {
    		mv.addObject("noticemaxseq", noticemaxseq);
    	}
    	
    	
    	return mv;
		
	}	
	
	//공지사항 등록
	@RequestMapping("/set/noticeinsert.do")
	public ModelAndView noticeinsert( @RequestParam Map<String,Object> map ,HttpServletResponse response ) {
		
		
		Calendar cal = Calendar.getInstance();
		String yearPath =  "" +cal.get(Calendar.YEAR);
		String monthPath = yearPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String hourPath = datePath + "-" + new DecimalFormat("00").format(cal.get(Calendar.HOUR_OF_DAY));
		String minutePath = hourPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.MINUTE));
		String secondPath = minutePath + "-" + new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		map.put("NOTICE_CREATEDATE",secondPath);
		int noticeinsert= noticeService.noticeinsert(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("noticeinsert", noticeinsert);
		
		return mv;
	}	
	
	
	
	
}
