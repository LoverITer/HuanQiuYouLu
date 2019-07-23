package com.admin.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xzy.bean.Admin;

/**
 * 拦截非法进入
 * 
 * @author Administrator
 *
 */

public class CheckLogInFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		 HttpServletRequest request=(HttpServletRequest)req;
		    HttpServletResponse response=(HttpServletResponse)resp;
		    
		    HttpSession session=request.getSession();
		    Admin admin=(Admin)session.getAttribute("logged");
		    String url=request.getServletPath();
		    System.out.println("filter:"+url);
		    if(null!=admin||(null!=url&&url.indexOf("login")!=-1)) {
		    	chain.doFilter(req, resp);
		    }else{
		    	response.sendRedirect("login");
		    }
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
