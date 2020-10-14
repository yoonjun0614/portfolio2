package yj.kr.login.controller;

import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import yj.kr.login.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@RequestMapping( value ="/")
	public ModelAndView loginView (  HttpServletResponse response ) throws Exception
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/login");
		
		return mv;
	}
	
	@RequestMapping( value ="/set/idfind.do")
	public ModelAndView idfindView ( HttpServletResponse response) throws Exception
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/forgot-id");
		
		return mv;
	}
	
	
	@RequestMapping( value ="/set/passwdfind.do")
	public ModelAndView passwdfindView ( HttpServletResponse response) throws Exception
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/forgot-passwd");
		
		return mv;
	}
	
	@RequestMapping( value ="/set/login.do")
	public ModelAndView login(@RequestParam Map<String,Object> map,  HttpServletResponse response , HttpSession session) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String,Object> loginchk = new HashMap<String, Object>();
		loginchk = loginService.loginchk(map);
		mv.setViewName("jsonView");
		if(loginchk ==null) {
			int i = 0;
			mv.addObject("idchk",i);
			
			return mv;
		}else {
			Map<String,Object> passchk = new HashMap<String, Object>();
			passchk = loginService.passchk(map);
			if(passchk == null) {
				int i = 1;
				mv.addObject("idchk",i);
				
				return mv;
			}else {
				int i = 2;
				mv.addObject("idchk",i);
				session.setAttribute("UserLogin",passchk);
				
				return mv;
			}
		}
	}
	
	@RequestMapping(value ="/set/logout.do")
	public ModelAndView logout(HttpSession session , @RequestParam Map<String,Object> map) {
		
		ModelAndView mv = new ModelAndView("jsonView");
		mv.setViewName("jsonView");
		session.removeAttribute("UserLogin");
		mv.addObject("logout", "1");
		
		return mv;
	}
	
	
	@RequestMapping( value ="/set/idfindchk")
	public ModelAndView idfindchk(@RequestParam Map<String,Object> map , HttpServletResponse response) throws Exception
	{
		
		Map<String,Object> idfindchk = new HashMap<String,Object>();
		idfindchk=loginService.idfindchk(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.setViewName("jsonView");
		if(idfindchk ==null) {
			mv.addObject("idfindchk", "0");
			
			return mv;
		}else {
			mv.addObject("idfind", idfindchk);
			mv.addObject("idfindchk", "1");
			
			return mv;
		}

	}
	
	@RequestMapping( value ="/set/passwdfindchk")
	public ModelAndView passwdfindchk(@RequestParam Map<String,Object> map , HttpServletResponse response) throws Exception
	{
		
		Map<String,Object> passwdfindchk = new HashMap<String,Object>();
		passwdfindchk=loginService.passwdfindchk(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.setViewName("jsonView");
		if(passwdfindchk ==null) {
			mv.addObject("passwdfindchk", "0");
			
			return mv;
		}else {
			mv.addObject("passwdfind", passwdfindchk);
			mv.addObject("passwdfindchk", "1");
			
			return mv;
		}

	}
	
}
