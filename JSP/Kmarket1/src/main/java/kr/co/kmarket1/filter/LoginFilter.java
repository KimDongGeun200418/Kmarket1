package kr.co.kmarket1.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket1.vo.MemberVO;



public class LoginFilter implements Filter {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		logger.info("LoginFilter ...");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession sess = req.getSession();
		
		//로그인 확인
		MemberVO loginUser = (MemberVO) sess.getAttribute("loginUser");
		if(loginUser == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인이 필요합니다.'); location.href='/Kmarket1/member/login.do';</script>");
			out.flush();

			//((HttpServletResponse)response).sendRedirect("/Kmarket1/member/login.do");
		}else {
			chain.doFilter(request, response);
		}
		
	}
	
	@Override
	public void destroy() {

	}
	
}
