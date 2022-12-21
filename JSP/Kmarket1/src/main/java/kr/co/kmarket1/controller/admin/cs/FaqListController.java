package kr.co.kmarket1.controller.admin.cs;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket1.service.ArticleService;
import kr.co.kmarket1.vo.CsArticleVO;

@WebServlet("/admin/cs/faqList.do")
public class FaqListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String pg = req.getParameter("pg");
		
		int currentPage = 0;//현재 페이지 번호
		int total = 0;//전체 게시물 개수
		int lastPageNum = 0;//마지막 페이지 번호
		int[] results = null;//페이지 그룹 번호
		int pageStartNum = 0;//페이지 시작 번호
		int start = 0;//시작 인덱스		
		
		List<CsArticleVO> articles = null;
		
		if(cate == null || cate.equals("")) {
			currentPage = service.getCurrentPage(pg);//현재 페이지 번호
			total = service.selectCountNoticeAll();//전체 게시물 개수
			lastPageNum = service.getLastPageNum(total);//마지막 페이지 번호
			results = service.getPageGroupNum(currentPage, lastPageNum);//페이지 그룹 번호
			pageStartNum = service.getPageStartNum(total, currentPage);//페이지 시작 번호
			start = service.getStartNum(currentPage);//시작 인덱스		
			
			articles = service.selectAllNotice(start);
		}else {
			currentPage = service.getCurrentPage(pg);//현재 페이지 번호
			total = service.selectCountNotice(cate);//전체 게시물 개수
			lastPageNum = service.getLastPageNum(total);//마지막 페이지 번호
			results = service.getPageGroupNum(currentPage, lastPageNum);//페이지 그룹 번호
			pageStartNum = service.getPageStartNum(total, currentPage);//페이지 시작 번호
			start = service.getStartNum(currentPage);//시작 인덱스		
			
			articles = service.selectNotice(cate, start);
		}
	
		req.setAttribute("articles", articles);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("pageGroupStart", results[0]);
		req.setAttribute("pageGroupEnd", results[1]);
		req.setAttribute("pageStartNum", pageStartNum +1);
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/faqList.jsp");
		dispatcher.forward(req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
