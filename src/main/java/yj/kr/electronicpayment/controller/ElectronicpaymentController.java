package yj.kr.electronicpayment.controller;

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

import yj.kr.electronicpayment.service.ElectronicpaymentService;

@Controller
public class ElectronicpaymentController {

	@Autowired
	private ElectronicpaymentService electronicpaymentService;
	
	
	@RequestMapping("/set/electronicpayment.do")
	public ModelAndView electronicpaymenteView(  HttpServletResponse response ) 
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("electronicpayment/electronicpaymentlist");
		
		return mv;
		
	}
	
	@RequestMapping("/set/electronicpaymentlist.do")
	public ModelAndView electronicpaymentList( HttpServletResponse response )
	{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String,Object>> electronicpaymentlist = new ArrayList<Map<String,Object>>();
		electronicpaymentlist=electronicpaymentService.electronicpaymentlist();
		mv.addObject("electronicpaymentlist", electronicpaymentlist);
		
		return mv;
		
		
	}
	
	@RequestMapping("/set/electronicpaymentenrollment.do")
	public ModelAndView electronicpaymentenrollment( HttpServletResponse response )
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("electronicpayment/electronicpaymentinsert");	
		
		return mv;
		
		
	}
	
	//게시글 번호 +1
	@RequestMapping(value = "/set/electronicpaymentmaxseq.do")
	public ModelAndView suggestionsmaxseq ( HttpServletResponse response) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> electronicpaymentmaxseq = new HashMap<String,Object>();
    	electronicpaymentmaxseq=electronicpaymentService.electronicpaymentmaxseq();
    	if(electronicpaymentmaxseq ==null) {
    		int maxseq = 1;
    		mv.addObject("electronicpaymentmaxseq", maxseq);
    	}else {
    		mv.addObject("electronicpaymentmaxseq", electronicpaymentmaxseq);
    	}
    	
    	
    	return mv;
		
	}
	
	@RequestMapping(value = "/set/electronicpaymentinsert.do")
	public ModelAndView electronicpaymentinsert ( @RequestParam Map<String,Object> map, HttpServletResponse response)
	{
		
		ModelAndView mv = new ModelAndView("jsonView");
		Calendar cal = Calendar.getInstance();
		String yearPath =  "" +cal.get(Calendar.YEAR);
		String monthPath = yearPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String hourPath = datePath + " " + new DecimalFormat("00").format(cal.get(Calendar.HOUR_OF_DAY));
		String minutePath = hourPath + ":" + new DecimalFormat("00").format(cal.get(Calendar.MINUTE));
		String secondPath = minutePath + ":" + new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		map.put("ELECTRONICPAYMENT_CREATEDATE",secondPath);
		System.out.println("등록 내용 확인 ::::" + map);
    	int electronicpaymentinsert=electronicpaymentService.electronicpaymentinsert(map);
    	mv.addObject("electronicpaymentinsert", electronicpaymentinsert);
    	
    	return mv;
		
	}	
	
	@RequestMapping(value = "/set/electronicpaymentdatail.do")
	public ModelAndView electronicpaymentdatailView ( @RequestParam Map<String,Object> map, HttpServletResponse response ,HttpServletRequest request) throws Exception
	{
		
		
		ModelAndView mv = new ModelAndView("jsonView");
		System.out.println("electronicpaymentdatail:::"+map);
		Map<String,Object> electronicpaymentdetail = new HashMap<String, Object>();
		electronicpaymentdetail=electronicpaymentService.electronicpaymentdetail(map);
		mv.addObject("electronicpaymentdetail", electronicpaymentdetail);
		
		return mv;
		
	}	
	
	@RequestMapping("/set/electronicpaymentupdatedetail.do")
	public ModelAndView electronicpaymentupdatedetail( @RequestParam Map<String,Object> map ,HttpServletResponse response ) {
		

		Map<String,Object> electronicpaymentupdatedetail =new HashMap<String, Object>();
		electronicpaymentupdatedetail= electronicpaymentService.electronicpaymentdetail(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("electronicpaymentupdatedetail", electronicpaymentupdatedetail);
		mv.setViewName("electronicpayment/electronicpaymentupdate");
		
		return mv;
	}		
	
	@RequestMapping("/set/payment.do")
	public ModelAndView payment( @RequestParam Map<String,Object> map ,HttpServletResponse response ) {
		
		Calendar cal = Calendar.getInstance();
		String yearPath =  "" +cal.get(Calendar.YEAR);
		String monthPath = yearPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String hourPath = datePath + " " + new DecimalFormat("00").format(cal.get(Calendar.HOUR_OF_DAY));
		String minutePath = hourPath + ":" + new DecimalFormat("00").format(cal.get(Calendar.MINUTE));
		String secondPath = minutePath + ":" + new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		
		
		map.put("ELECTRONICPAYMENT_PAYMENTDATE",secondPath);
		
		System.out.println("결제 내용::"+map);
		int payment= electronicpaymentService.payment(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("payment", payment);
		
		return mv;
	}		
	
	
	@RequestMapping("/set/updatepayment.do")
	public ModelAndView updatepayment( @RequestParam Map<String,Object> map ,HttpServletResponse response ) {
		
		Calendar cal = Calendar.getInstance();
		String yearPath =  "" +cal.get(Calendar.YEAR);
		String monthPath = yearPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String hourPath = datePath + " " + new DecimalFormat("00").format(cal.get(Calendar.HOUR_OF_DAY));
		String minutePath = hourPath + ":" + new DecimalFormat("00").format(cal.get(Calendar.MINUTE));
		String secondPath = minutePath + ":" + new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		
		
		map.put("ELECTRONICPAYMENT_UPDATEDATE",secondPath);
		

		int updatepayment= electronicpaymentService.updatepayment(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("updatepayment", updatepayment);
		
		return mv;
	}		
	
	@RequestMapping("/set/deletepayment.do")
	public ModelAndView deletepayment( @RequestParam Map<String,Object> map ,HttpServletResponse response ) {
		

		
		int deletepayment= electronicpaymentService.deletepayment(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("deletepayment", deletepayment);
		
		return mv;
	}		
	
	
	@RequestMapping("/set/backpayment.do")
	public ModelAndView backpayment( @RequestParam Map<String,Object> map ,HttpServletResponse response ) {
		
		Calendar cal = Calendar.getInstance();
		String yearPath =  "" +cal.get(Calendar.YEAR);
		String monthPath = yearPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "-" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String hourPath = datePath + " " + new DecimalFormat("00").format(cal.get(Calendar.HOUR_OF_DAY));
		String minutePath = hourPath + ":" + new DecimalFormat("00").format(cal.get(Calendar.MINUTE));
		String secondPath = minutePath + ":" + new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		map.put("ELECTRONICPAYMENT_PAYMENTDATE", secondPath);
		System.out.println("반려 내용:::"+map);
		int backpayment= electronicpaymentService.backpayment(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("backpayment", backpayment);
		
		return mv;
	}	
	
}
