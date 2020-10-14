package yj.kr.dataroom.controller;

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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import yj.kr.dataroom.service.DataroomService;
import yj.kr.dataroom.util.UploadFileUtil;

@Controller
public class DataroomController {

	@Autowired
	private DataroomService dataroomService;
	
	@RequestMapping("/set/dataroom.do")
	public ModelAndView dataroomView( HttpServletResponse response )
	{
		
		ModelAndView mv =new ModelAndView();
		mv.setViewName("dataroom/dataroomlist");
		
		return mv;
	}
	
	@RequestMapping("/set/dataroomenrollment.do")
	public ModelAndView dataroominsertView( HttpServletResponse response )
	{
		
		ModelAndView mv =new ModelAndView();
		mv.setViewName("dataroom/dataroominsert");
		
		return mv;
	}
	
	
	
	//자료실 글 리스트
	@RequestMapping("/set/dataroomlist.do")
	public ModelAndView dataroomList( HttpServletResponse response )
	{
		
		ModelAndView mv =new ModelAndView("jsonView");
		List<Map<String,Object>> dataroomlist = new ArrayList<Map<String,Object>>();
		dataroomlist = dataroomService.dataroomlist();
		mv.addObject("dataroomlist", dataroomlist);
		
		
		return mv;
		
	}
	
	@RequestMapping("/set/upload.do")
	@ResponseBody
	public ResponseEntity<String> uploadAjax(MultipartFile file , @RequestParam Map<String,Object> map) throws Exception{
		
    	Calendar calendar = Calendar.getInstance();
    	Date date = calendar.getTime();
    	String prevTime = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));

		Calendar cal = Calendar.getInstance();
		String yearPath = "/" + cal.get(Calendar.YEAR);
		String monthPath = yearPath + "/" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "/" + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		
    	map.put("PATH" , "/file"  + datePath +"/"+ prevTime + "_" + file.getOriginalFilename().replaceAll(" ", ""));
    	System.out.println("map::::"+map);
    	int update = dataroomService.upload(map);

		return new ResponseEntity<String>(UploadFileUtil.uploadFile("C:\\Users\\user\\Downloads\\fileDir" , file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
	@RequestMapping("/set/uploaddelete.do")
	public ModelAndView uploadDelete( @RequestParam Map<String,Object> map , HttpServletResponse response)
	{
		
		ModelAndView mv =new ModelAndView("jsonView");
		int uploaddelete = dataroomService.uploaddelete(map);
		mv.addObject("uploaddelete", uploaddelete);
		System.out.println("map::::"+map);
		return mv;
	}
	
	
	//게시글 번호 +1
	@RequestMapping(value = "/set/dataroommaxseq.do")
	public ModelAndView dataroommaxseq ( HttpServletResponse response) throws Exception
	{
		
		ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> dataroommaxseq = new HashMap<String,Object>();
    	dataroommaxseq=dataroomService.dataroommaxseq();
    	if(dataroommaxseq ==null) {
    		int maxseq = 1;
    		mv.addObject("dataroommaxseq", maxseq);
    	}else {
    		mv.addObject("dataroommaxseq", dataroommaxseq);
    	}
    	
    	
    	return mv;
		
	}
	
	@RequestMapping("/set/dataroominsert.do")
	public ModelAndView dataroominsert (HttpServletResponse response , @RequestParam Map<String,Object> map) 
	{
		
		ModelAndView mv = new ModelAndView("jsonView");
		int dataroominsert = dataroomService.dataroominsert(map);
		mv.addObject("dataroominsert", dataroominsert);
		return mv;
		
	}
	
	//공지사항 seq
	@RequestMapping(value = "/set/dataroomdetail.do")
	public ModelAndView dataroomdetailView ( @RequestParam Map<String,Object> map, HttpServletResponse response ,HttpServletRequest request) throws Exception
	{
		
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String,Object> dataroomdetail = new HashMap<String, Object>();
		dataroomdetail=dataroomService.dataroomdetail(map);
		mv.addObject("dataroomdetail", dataroomdetail);
		
		return mv;
		
	}	
	
	//공지사항 수정화면 데이터
	@RequestMapping("/set/dataroomupdatedetail.do")
	public ModelAndView noticeupdatedetail( @RequestParam Map<String,Object> map ,HttpServletResponse response ) {
		

		Map<String,Object> dataroomupdatedetail =new HashMap<String, Object>();
		dataroomupdatedetail= dataroomService.dataroomdetail(map);
		ModelAndView mv = new ModelAndView();
		System.out.println("dataroomupdatedetail"+dataroomupdatedetail);
		mv.addObject("dataroomdetail", dataroomupdatedetail);
		mv.setViewName("dataroom/dataroomupdate");
		
		return mv;
	}	

	
	@RequestMapping("/set/dataroomupdate.do")
	public ModelAndView dataroomupdate( @RequestParam Map<String,Object> map ,HttpServletResponse response ) {
		

		System.out.println("수정사항"+map);
		int dataroomupdate= dataroomService.dataroomupdate(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("dataroomupdate", dataroomupdate);
		
		return mv;
	}
	
	@RequestMapping("/set/dataroomdelete.do")
	public ModelAndView dataroomdelete( @RequestParam Map<String,Object> map ,HttpServletResponse response ) {
		

		
		int dataroomdelete= dataroomService.dataroomdelete(map);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("dataroomdelete", dataroomdelete);
		
		return mv;
	}	
	
	
}
