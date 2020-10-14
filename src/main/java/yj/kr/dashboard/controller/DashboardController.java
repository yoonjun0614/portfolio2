package yj.kr.dashboard.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yj.kr.dashboard.Service.DashboardService;

@Controller
public class DashboardController {

//	@Autowired
//	private DashboardService dashboardService;
	
	
	@RequestMapping("/set/dashboard.do")
	public ModelAndView dashboardView( HttpServletResponse response ) 
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("dashboard/dashboard");
		
		return mv;
	}
	
}
