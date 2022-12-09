package kr.co.kmarket1.controller.cs;

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

@WebServlet("/cs/notice/list.do")
public class NoticeListController extends HttpServlet{

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
		
		int currentpage = service.getCurrentPage(pg);//현재 페이지 번호
		//int total = service.selectCountTotal();//전체 게시물 개수
		//int lastPageNum = service.getLastPageNum(total);//마지막 페이지 번호
		//int[] result = service.getPageGroupNum(currentPage, lastPageNum);//페이지 그룹 번호
		//int pageStartNum = service.getPageStartNum(total, currentPage)//페이지 시작 번호
		//int start = service.getStartNum(currentPage);//시작 인덱스		
		
		
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
