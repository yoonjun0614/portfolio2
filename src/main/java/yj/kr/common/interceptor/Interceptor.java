package yj.kr.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter{

	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	String reqUrl = request.getServletPath();
    	
        if (reqUrl.contains("/set/idfind.do") || reqUrl.contains("/set/passwdfind.do") || reqUrl.contains("/set/login.do") ){ 
        	
            return super.preHandle(request, response, handler);
        }
    	
    	
    	HttpSession session = request.getSession();
    	if(session.getAttribute("UserLogin") ==null) {
    		response.sendRedirect("/");
    		
    		return false;
    	}
    	
        return true;
    }
	
	
}
