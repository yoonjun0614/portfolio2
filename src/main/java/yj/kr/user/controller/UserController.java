package yj.kr.user.controller;


import net.sf.json.JSONObject;
import yj.kr.user.service.UserService;


import java.util.ArrayList;

import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController
{

    @Autowired
    private UserService userService;

   
	//비상 연락망 화면
    @RequestMapping(value = "/set/userlist.do")
    private ModelAndView userListView( HttpServletResponse response ) throws Exception
    {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/user_managementlist");

        return mv;
    }
	//비상 연락망 리스트(사원 리스트)
    @RequestMapping(value = "/set/mainlist.do")
    private ModelAndView mainlist( HttpServletResponse response) throws Exception
    {
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	List<Map<String,Object>> userlist = new ArrayList<Map<String,Object>>();
    	userlist=userService.userlist();
    	mv.addObject("userlist", userlist);
    	
    	return mv;
    }
    //사용자 등록 화면
    @RequestMapping(value = "/set/insertdatail.do")
    private ModelAndView insertdatailView ( HttpServletResponse response) throws Exception
    {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/user_managementinsert");

        return mv;
    }
    
    //사용자 정보 수정 화면
    @RequestMapping(value = "/set/updatedatail.do")
    private ModelAndView updatedatailView ( HttpServletResponse response) throws Exception
    {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/user_managementupdate");

        return mv;
    }
    
    //사용자 등록 중복확인
	@RequestMapping(value = "/set/insertchk.do")
	private ModelAndView insertchk( HttpServletResponse response , @RequestParam Map<String,Object> map) throws Exception
	{
	
		ModelAndView mv =new ModelAndView("jsonView");
		Map<String,Object> insertidchk = userService.idchk(map);
		if(insertidchk == null ) {
			int chk = 0;
			mv.addObject("insertidchk", chk);
			
			return mv;
		}else{
			int chk = 1;
			mv.addObject("insertidchk", chk);
			
			return mv;
		}
		        	
	}    	
	//사용자 등록 이메일 체크
	@RequestMapping(value = "/set/insertemailchk.do")
	private ModelAndView insertemailchk( HttpServletResponse response , @RequestParam Map<String,Object> map) throws Exception
	{
	
		ModelAndView mv =new ModelAndView("jsonView");
		Map<String,Object> insertemailchk = userService.insertemailchk(map);
		if(insertemailchk == null ) {
			int chk = 0;
			mv.addObject("insertemailchk", chk);
			
			return mv;
		}else{
			int chk = 1;
			mv.addObject("insertemailchk", chk);
			
			return mv;
		}
		        	
	}     
    
	//사용자 등록
	@RequestMapping(value = "/set/userinsert.do")
	private ModelAndView userinsert( HttpServletResponse response , @RequestParam Map<String,Object> map) throws Exception
	{
	
		int userinsert= userService.userinsert(map);
		ModelAndView mv =new ModelAndView("jsonView");
		mv.addObject("userinsert", userinsert);
		
		return mv;
	}   

	//사용자 정보 수정
	@RequestMapping(value = "/set/userupdate.do")
	private ModelAndView update( HttpServletResponse response , @RequestParam Map<String,Object> map) throws Exception
	{
	
		int userupdate =userService.userupdate(map);
		ModelAndView mv =new ModelAndView("jsonView");
		mv.addObject("userupdate", userupdate);
		
		return mv;
	}   
	
}
