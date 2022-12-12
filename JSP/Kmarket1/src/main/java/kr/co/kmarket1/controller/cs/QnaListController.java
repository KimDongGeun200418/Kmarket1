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

@WebServlet("/cs/qna/list.do")
public class QnaListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String cate2 = req.getParameter("cate2");
		String pg = req.getParameter("pg");
		
		int currentPage = service.getCurrentPage(pg);//현재 페이지 번호
		int total = service.selectCountTotalNotice();//전체 게시물 개수
		int lastPageNum = service.getLastPageNum(total);//마지막 페이지 번호
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);//페이지 그룹 번호
		int pageStartNum = service.getPageStartNum(total, currentPage);//페이지 시작 번호
		int start = service.getStartNum(currentPage);//시작 인덱스		
		
		List<CsArticleVO> articles = null;
		List<CsArticleVO> notice = null;
		
		if(cate == null) {
			articles = service.selectAllNotice(start);
		}else {
			articles = service.selectArticlesNotice(cate, start);
		}
		
	
		req.setAttribute("articles", articles);
		req.setAttribute("notice", notice);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum +1);
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("cate2", cate2);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Kmarket1/cs/notice/list.jsp");
		dispatcher.forward(req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
