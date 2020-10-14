package yj.kr.vacation.controller;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yj.kr.vacation.service.VacationService;

@Controller
public class VacationController {
	
	@Autowired
	private VacationService vacationService;
	
	@RequestMapping("/set/vacation.do")
	public ModelAndView vacationView(  HttpServletResponse response  )
	{
		ModelAndView mv =new ModelAndView();
		mv.setViewName("vacation/vacationlist");
		
		return mv;
	}

	@RequestMapping("/set/myvacation.do")
	public ModelAndView myvacationView(  HttpServletResponse response  )
	{
		ModelAndView mv =new ModelAndView();
		mv.setViewName("vacation/vacationmylist");
		
		return mv;
	}	
	
	@RequestMapping("/set/vacationlist.do")
	public ModelAndView vacationList( HttpServletResponse response , @RequestParam Map<String,Object> map )
	{
		
		ModelAndView mv =new ModelAndView("jsonView");
		List<Map<String,Object>>  vacationlist = new ArrayList<Map<String,Object>>();
		vacationlist =vacationService.vacationlist(map);
		mv.addObject("vacationlist", vacationlist);
		
		return mv;
		
	}
	
	@RequestMapping("/set/vacationenrollment.do")
	public ModelAndView vacationenrollment( HttpServletResponse response )
	{
		
		ModelAndView mv =new ModelAndView();
		mv.setViewName("vacation/vacationinsert");
		
		return mv;
		
	}	
	
	@RequestMapping(value = "/set/vacationmaxseq.do")
	public ModelAndView suggestionsmaxseq ( HttpServletResponse response) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> vacationsmaxseq = new HashMap<String,Object>();
    	vacationsmaxseq=vacationService.vacationsmaxseq();
    	if(vacationsmaxseq ==null) {
    		int maxseq = 1;
    		mv.addObject("vacationmaxseq", maxseq);
    	}else {
    		mv.addObject("vacationmaxseq", vacationsmaxseq);
    	}
    	
    	
    	return mv;
		
	}	

	@RequestMapping("/set/vacationinsert.do")
	public ModelAndView vacationinsert( HttpServletResponse response ,@RequestParam Map<String,Object> map)
	{
		
		
		Calendar cal = Calendar.getInstance();
		String yearPath =  "" +cal.get(Calendar.YEAR);
		String monthPath = yearPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String hourPath = datePath + " " + new DecimalFormat("00").format(cal.get(Calendar.HOUR_OF_DAY));
		String minutePath = hourPath + ":" + new DecimalFormat("00").format(cal.get(Calendar.MINUTE));
		String secondPath = minutePath + ":" + new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		
		map.put("VACATION_CREATEDATE",secondPath);
		ModelAndView mv =new ModelAndView("jsonView");
		int vacationinsert = vacationService.vacationinsert(map);
		mv.addObject("vacationinsert", vacationinsert);
		
		
		return mv;
		
	}	
	
	@RequestMapping(value = "/set/vacationdatail.do")
	public ModelAndView vacationdatailView ( @RequestParam Map<String,Object> map, HttpServletResponse response ,HttpServletRequest request) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String,Object> vacationdatail = new HashMap<String, Object>();
		vacationdatail=vacationService.vacationdatail(map);
		mv.addObject("vacationdatail", vacationdatail);
		
		return mv;
		
	}
	
	@RequestMapping(value = "/set/vacationupdatedatail.do")
	public ModelAndView vacationupdatedatail(@RequestParam Map<String,Object> map, HttpServletResponse response, HttpServletRequest request) throws Exception
	{

		Map<String,Object> vacationdatail = new HashMap<String, Object>();
		vacationdatail=vacationService.vacationdatail(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vacationdatailOne", vacationdatail);
		mv.setViewName("vacation/vacationupdate");
		
		return mv;
		
	}	
	
	@RequestMapping(value = "/set/vacationupdate.do")
	public ModelAndView vacationupdate(@RequestParam Map<String,Object> map, HttpServletResponse response, HttpServletRequest request) throws Exception
	{
		
		int vacationupdate=vacationService.vacationupdate(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("vacationupdate", vacationupdate);
		
		return mv;
		
	}	

	@RequestMapping(value = "/set/vacationdelete.do")
	public ModelAndView vacationdelete(@RequestParam Map<String,Object> map, HttpServletResponse response, HttpServletRequest request) throws Exception
	{
		
		int vacationdelete=vacationService.vacationdelete(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("vacationdelete", vacationdelete);
		
		return mv;
		
	}	
	
	@RequestMapping("/set/vacationpayment.do")
	public ModelAndView vacationpayment( HttpServletResponse response ,@RequestParam Map<String,Object> map)
	{
		
		
		Calendar cal = Calendar.getInstance();
		String yearPath =  "" +cal.get(Calendar.YEAR);
		String monthPath = yearPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String hourPath = datePath + " " + new DecimalFormat("00").format(cal.get(Calendar.HOUR_OF_DAY));
		String minutePath = hourPath + ":" + new DecimalFormat("00").format(cal.get(Calendar.MINUTE));
		String secondPath = minutePath + ":" + new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		
		map.put("VACATION_PAYMENTDATE",secondPath);
		ModelAndView mv =new ModelAndView("jsonView");
		int vacationpayment = vacationService.vacationpayment(map);
		mv.addObject("vacationpayment", vacationpayment);
		
		
		return mv;
		
	}	
	
	
	@RequestMapping("/set/vacationback.do")
	public ModelAndView vacationback( HttpServletResponse response ,@RequestParam Map<String,Object> map)
	{
		
		
		Calendar cal = Calendar.getInstance();
		String yearPath =  "" +cal.get(Calendar.YEAR);
		String monthPath = yearPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String hourPath = datePath + " " + new DecimalFormat("00").format(cal.get(Calendar.HOUR_OF_DAY));
		String minutePath = hourPath + ":" + new DecimalFormat("00").format(cal.get(Calendar.MINUTE));
		String secondPath = minutePath + ":" + new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		
		map.put("VACATION_PAYMENTDATE",secondPath);
		ModelAndView mv =new ModelAndView("jsonView");
		int vacationback = vacationService.vacationback(map);
		mv.addObject("vacationback", vacationback);
		
		
		return mv;
		
	}		
	
	@RequestMapping("/set/vacationmylist.do")
	public ModelAndView vacationmylist( HttpServletResponse response , @RequestParam Map<String,Object> map )
	{
		
		ModelAndView mv =new ModelAndView("jsonView");
		List<Map<String,Object>>  vacationmylist = new ArrayList<Map<String,Object>>();
		vacationmylist =vacationService.vacationmylist(map);
		mv.addObject("vacationmylist", vacationmylist);
		
		return mv;
		
	}	
	
	
	
	
	
	
}
